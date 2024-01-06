using PrettyTables
using Plots
using LaTeXStrings

omega0=1.0
beta  =0.05
x0    = 1.0
v0    = 3.0

omega0d = sqrt(omega0^2-beta^2)
theta   = atan(-(v0+beta*x0)/(omega0d*x0))
C       = x0 / cos(theta)

ta    = 0:0.1:50
xt    = zeros(length(ta))
b1    = zeros(length(ta))
b2    = zeros(length(ta))

for i=1:length(ta)
	t     = ta[i]
	xt[i] =  C*exp(-beta*t)*cos(omega0d*t+theta)
	b1[i] =  C*exp(-beta*t)
	b2[i] = -C*exp(-beta*t)
end


pyplot()
p=plot(ta,xt,legend=false,size=(250,250))
plot!(ta,b1,legend=false,color="red", linestyle = :dash)
plot!(ta,b2,legend=false,color="red", linestyle = :dash)
xlabel!(L"t")
ylabel!(L"x(t)")
savefig(p, "weakly-damped.pdf")


# energy conservation in simple harmonic oscillation

k = 1.
m = 2.
ω0 = sqrt(k/m)
T  = 2*π/ω0
A  = 1.
ϕ  = 0.

E  = 0.5*k*A^2

ta    = 0:0.1:T
T     = zeros(length(ta))
U     = zeros(length(ta))
x     = zeros(length(ta))
v     = zeros(length(ta))

for i=1:length(ta)
	t     = ta[i]
	T[i]  =  E*sin(ω0*t-ϕ)^2
	U[i]  =  E*cos(ω0*t-ϕ)^2
	x[i]  =  A*cos(ω0*t-ϕ)
	v[i]  =  -A*ω0*sin(ω0*t-ϕ)
end


# pyplot()
# p=plot(ta,T,size=(250,250),label=L"$T$")
# plot!(ta,U,label=L"$U$",color="blue")
# xlabel!(L"t")
# ylabel!("Energies")
# savefig(p, "SHO-energies.pdf")


pyplot()
p=plot(x,v,size=(250,250))
xlabel!(L"x")
ylabel!(L"\dot{x}")
savefig(p, "SHO-energies2.pdf")
