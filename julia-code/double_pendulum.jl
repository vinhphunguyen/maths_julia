# A coplanar double pendulum

# https://discourse.julialang.org/t/symbolics-jl-modelingtoolkit-jl-differentialequations-jl-and-the-lagrangian-approach/89629/3

using Symbolics, ModelingToolkit
using Latexify 
using OrdinaryDiffEq
using CairoMakie
using Colors
using Printf
using DataStructures: CircularBuffer

@variables t θ(t) ϕ(t) 
@parameters m1, m2, l1, l2, g

# Differential operators
d   = Differential(t)
D1  = Differential(θ)
D2  = Differential(ϕ)
D11 = Differential(d(θ))
D22 = Differential(d(ϕ))

# Cartesian coordinates
x1 =  l1*sin(θ)
y1 = -l1*cos(θ)
x2 =  l2*sin(ϕ) + x1
y2 = -l2*cos(ϕ) + y1

# Kinetic energy
T = 0.5*m1*(expand_derivatives(d(x1))^2 + expand_derivatives(d(y1))^2) +
    0.5*m2*(expand_derivatives(d(x2))^2 + expand_derivatives(d(y2))^2)
T = simplify(T)

# Potential energy
V = m1*g*y1 + m2*g*y2

# Lagrangian
L = T - V

# Lagrange equations
E1 = expand_derivatives(d(expand_derivatives(D11(L)))) - expand_derivatives(D1(L))
E2 = expand_derivatives(d(expand_derivatives(D22(L)))) - expand_derivatives(D2(L))

# Solve Lagrange equations for the second order time derivatives
E11, E22 = Symbolics.solve_for([E1 ~ 0, E2 ~ 0], [d(d(θ)), d(d(ϕ))])

# ODE problem
system = [d(d(θ)) ~ E11, d(d(ϕ)) ~ E22]

@named DP = ODESystem(system, t, [θ, ϕ], [m1, m2, l1, l2, g])

DP = structural_simplify(DP)

# Parameters
M = [m1 => 1.0, m2 => 1.0, l1 => 1.0, l2 => 1.10, g => 10.0]

tspan = (0.0, 10.0)

# Initial conditions
X₀ = [d(θ) => 0.0, d(ϕ) => 0.0, θ => 79pi/180, ϕ => pi/2]

prob = ODEProblem(DP, X₀, tspan, M, abstol = 1e-7, reltol = 1e-7)
sol = solve(prob, Tsit5());

# Animation using Makie.jl
# Recalculate solution for equidistant time steps for smooth visualization
np = 600
t = range(tspan[1], tspan[2], np)
sl = sol(t);

# Cartesian coordinates
xx1 =  substitute(l1, M).val * sin.(sl[1,:]);
yy1 = -substitute(l1, M).val * cos.(sl[1,:]);
xx2 =  substitute(l2, M).val * sin.(sl[3,:]) .+ xx1;
yy2 = -substitute(l2, M).val * cos.(sl[3,:]) .+ yy1;


x1, x2, y1, y2 = xx1[1], xx2[1], yy1[1], yy2[1]
rod            = Observable([Point2f(0, 0), Point2f(x1, y1), Point2f(x2, y2)])
balls          = Observable([Point2f(x1, y1), Point2f(x2, y2)])
tail           = 300 # length of plotted trajectory, in units of `dt`
traj           = CircularBuffer{Point2f}(tail)
fill!(traj, Point2f(x2, y2)) # add correct values to the circular buffer
traj           = Observable(traj) # make it an observable

set_theme!(theme_black())
fig = Figure(resolution=(1000, 1000), fonts=(; regular="CMU Serif"))
display(fig);
ax = Axis(fig[1, 1])
scatter!(ax, [Point2f(0, 0)]; marker=:circle, strokewidth=2,
    strokecolor=:white,
    color=:black, markersize=[14]
)
lines!(ax, rod; linewidth=4, color=:green)
scatter!(ax, balls; marker=:circle, strokewidth=2,
    strokecolor=:cyan,
    color=:black, markersize=[8, 12]
)
# then its trajectory, with a nice fadeout color
c       = to_color(:yellow)
tailcol = [RGBAf(c.r, c.g, c.b, (i / tail)^2) for i in 1:tail]
lines!(ax, traj; linewidth=3, color=tailcol)

# We can also plot now any other static elements
ax.title  = "double pendulum"
ax.aspect = DataAspect()
l         = 1.1(substitute(l1, M).val + substitute(l2, M).val)
xlims!(ax, -l, l)
ylims!(ax, -l, l)

# %% 4. Create the "animation stepping function"
# Using the functions of step 1, we now define a function
# that updates the observables. Makie.jl understands observable
# updates and directly reflects this on the plotted elements.
function animstep!(xx1, xx2, yy1, yy2, i, rod, balls, traj)
    x1, x2, y1, y2 = xx1[i+1], xx2[i+1], yy1[i+1], yy2[i+1]
    rod[]   = [Point2f(0, 0), Point2f(x1, y1), Point2f(x2, y2)]
    balls[] = [Point2f(x1, y1), Point2f(x2, y2)]
    push!(traj[], Point2f(x2, y2))
    traj[] = traj[] # <- important! Updating in-place the value of an
    # `Observable` does not trigger an update!
end

frames = 1:length(xx1)-1

record(fig, "video.mp4", frames; framerate=20) do i # i = frame number
    #for j in 1:5 # step 5 times per frame
        animstep!(xx1, xx2, yy1, yy2, i, rod, balls, traj)
    #end
    # any other manipulation of the figure here...
end # for each step of this loop, a frame is recorded


function gen_plot(sl, time, filename)
    with_theme(theme_latexfonts()) do
        fontsize_theme = Theme(fontsize=30)
        set_theme!(fontsize_theme)
        fig = Figure(resolution=(1000, 500), fonts=(; regular="CMU Serif"))
        display(fig)
        ax = Axis(fig[1, 1], aspect=1.5, xlabel=L"$t$", ylabel=L"$\theta_1$") # aspect ratio 1:1
        #xlims!(ax, -1.1, 1.1)
        #ylims!(ax, -1.1, 1.1)
        lines!(ax, time, first.(sl[1, :]), color=:red, linewidth=2)
        ax2 = Axis(fig[1, 2], aspect=1.5, xlabel=L"$t$", ylabel=L"$\theta_2$") # aspect ratio 1:1
        #xlims!(ax, -1.1, 1.1)
        #ylims!(ax, -1.1, 1.1)
        lines!(ax2, time, first.(sl[3, :]), color=:red, linewidth=2)
        #lines!(ax, time, first.(sol.(time)), color=:cyan)
        #lines!(ax, time, last.(sol.(time)), color=:purple)
        save(filename, fig)
    end
end

gen_plot(sl, t, "filename.pdf")