using ModelingToolkit, MethodOfLines, OrdinaryDiffEq, DomainSets


@parameters x y t
@variables u(..) v(..)
Dt = Differential(t)
Dx = Differential(x)
Dy = Differential(y)
Dxx = Differential(x)^2
Dyy = Differential(y)^2

∇²(u) = Dxx(u) + Dyy(u)

brusselator_f(x, y, t) = (((x-0.3)^2 + (y-0.6)^2) <= 0.1^2) * (t >= 1.1) * 5.

x_min = y_min = t_min = 0.0
x_max = y_max = 20.0
t_max = 30.

αx = 2.
αy = 16.
C  = 4.5
K  = 6.75 

u0(x,y,t) = 1 + cos(π*x)*cos(π*y)
v0(x,y,t) = 2 + cos(2π*x)*cos(2π*y)

eq = [Dt(u(x,y,t)) ~  αx*∇²(u(x,y,t)) + v(x,y,t)*u(x,y,t)^2 + C - (K+1)*u(x,y,t),
      Dt(v(x,y,t)) ~  αy*∇²(v(x,y,t)) - v(x,y,t)*u(x,y,t)^2 + K*u(x,y,t)
      ]

domains = [x ∈ Interval(x_min, x_max),
           y ∈ Interval(y_min, y_max),
           t ∈ Interval(t_min, t_max)]

# Initial conditions and Periodic BCs
bcs = [u(x,y,0) ~ u0(x,y,0),
       u(0,y,t) ~ u(x_max,y,t),
       u(x,0,t) ~ u(x,y_max,t),

       v(x,y,0) ~ v0(x,y,0),
       v(0,y,t) ~ v(x_max,y,t),
       v(x,0,t) ~ v(x,y_max,t)] 

@named pdesys = PDESystem(eq,bcs,domains,[x,y,t],[u(x,y,t),v(x,y,t)])

N = 80

order = 2 # This may be increased to improve accuracy of some schemes

# Integers for x and y are interpreted as number of points. Use a Float to directtly specify stepsizes dx and dy.
discretization = MOLFiniteDifference([x=>N, y=>N], t, approx_order=order)

# Convert the PDE problem into an ODE problem
println("Discretization:")
@time prob = discretize(pdesys,discretization)

println("Solve:")
@time sol = solve(prob, TRBDF2(), saveat=0.1)


discrete_t = sol.t

ks = collect(keys(sol.u));

solu = sol.u[ks[1]];
solv = sol.u[ks[2]];

using Plots
anim = @animate for k in 1:length(discrete_t)
    heatmap(solu[2:end, 2:end, k], title="$(discrete_t[k])") # 2:end since end = 1, periodic condition
end
gif(anim, "Brusselator2Dsol_u.gif", fps = 8)

