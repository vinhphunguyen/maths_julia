using PrettyTables
using Plots
using LaTeXStrings

# Euler-Aspel-Cromer method to solve simple harmonic oscilation

k = 1.
m = 1.
ω0 = sqrt(k/m)
T  = 2*π/ω0
A  = 1.
ϕ  = 0.

E  = 0.5*k*A^2

ta    = 0:0.1:T
xe    = zeros(length(ta))
ve    = zeros(length(ta))

for i=1:length(ta)
	t     = ta[i]
	xe[i] =  A*cos(ω0*t-ϕ)
	ve[i] =  -A*ω0*sin(ω0*t-ϕ)
end

time      = 3*T # total time
dt        = 0.03
stepCount = Int32(floor(time/dt))

x    = zeros(stepCount)
v    = zeros(stepCount)
t    = zeros(stepCount)

# initial conditions
x[1] = A
v[1] = 0.
t[1] = 0.

function f(x,v)
 	return -(k/m)*x
end

for i=1:stepCount-1
	v[i+1] = v[i] + dt * f(x[i],v[i])
	x[i+1] = x[i] + dt * v[i+1]
	t[i+1] = t[i] + dt
end

pyplot()
p=plot(x,v,legend=false,size=(250,250))
plot!(xe,ve)
xlabel!(L"x")
ylabel!(L"\dot{x}")
savefig(p, "Euler-SHO.pdf")

pyplot()
p=plot(t,x,legend=false,size=(250,250))
xlabel!(L"x")
ylabel!(L"\dot{x}")
savefig(p, "Euler-SHO-x.pdf")
