using PrettyTables
using Plots
using LaTeXStrings
using Printf

gr()

# Euler-Cromer method to solve Kepler's 2 body problem
# length: AU
# time: years

δ = 6e-3

# Mercury data
e   = 0.206
a   = 0.39 # AU
b   = a*sqrt(1-e^2)

GM  = 4*π^2
x0  = (1. + e)*a
y0  = 0.
vx0 = 0.
vy0 = sqrt((GM/a)*(1-e)/(1+e))

time      = 0.28 # 3.0 # 3 years or 3 periods
dt        = 0.001
stepCount = Int32(floor(time/dt))

x    = zeros(stepCount)
y    = zeros(stepCount)
vx   = zeros(stepCount)
vy   = zeros(stepCount)
time    = zeros(stepCount)
#dE   = zeros(stepCount)

# initial conditions
x[1]  = x0
y[1]  = y0
vx[1] = vx0
vy[1] = vy0
time[1]  = 0.

function f(x,r)
 	return -(GM/r^3)*x
end

for i=1:stepCount-1
	xi      = x[i]
	yi      = y[i]
	r       = sqrt( xi^2 + yi^2 )

	vx[i+1] = vx[i] + dt * f(xi,r)
	vy[i+1] = vy[i] + dt * f(yi,r)

	x[i+1]  = xi  + dt * vx[i+1]
	y[i+1]  = yi  + dt * vy[i+1]

	#dE[i+1]= 0.5*(v[i+1]^2 - x[i+1]^2)
	time[i+1] = time[i] + dt

	if ( abs(x[i+1]-x[1]) < δ )
		println(time[i+1])
	end
end


pyplot()
p=plot(x,y,legend=false,size=(250,250))
#plot!(xe,ve)
xlabel!(L"x")
ylabel!(L"y")

savefig(p, "Euler-Kepler.pdf")

anim = @animate for i in 1:stepCount
	# the whole plot
	plot(;size=(400,400), axisratio=:equal, legend=false)
	xlims!(minimum(x)-0.02,maximum(x)+0.02)
	ylims!(minimum(y)-0.02,maximum(y)+0.02)
	scatter!([x[i]],[y[i]],axisratio=:equal)
	plot!([x[1:i]],[y[1:i]],axisratio=:equal)
	# then the control points (no joining)
	end
	#filename = string("bezier","$(Int(c)).pdf")
	#savefig(filename)

gif(anim, "mercury.gif", fps=30)
