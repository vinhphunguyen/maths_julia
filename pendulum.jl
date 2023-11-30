using Plots
using LaTeXStrings
using Printf

# \dot{ω} = -sin Ω  - (1/Q)\dotθ+A cos ωt
# dotθ = ω
function pendulum(A,Q,ω,θo,T,Δt)
	stepCount = Int32(floor(T/Δt))
    # position of the blob m
	x    = zeros(stepCount)
	y    = zeros(stepCount)
	θ    = zeros(stepCount)
	dθdt = zeros(stepCount)
	time = zeros(stepCount)
	#dE   = zeros(stepCount)
    l = 1
	# initial conditions
	x[1]     = l*cos(θo-pi/2)
	y[1]     = l*sin(θo-pi/2)
	θ[1]     = θo
	dθdt[1]  = 0.
	time[1]  = 0.

	function f(θ,dθdt,t)
	 	return -sin(θ) - (1/Q)*dθdt + A*cos(ω*t)
	end

	for i=1:stepCount-1
		θi        = θ[i]
		dθdti     = dθdt[i]
		t         = time[i]
		dθdt[i+1] = dθdti + Δt * f(θi,dθdti,t)
		θ[i+1]    = θi    + Δt * dθdt[i+1]
		time[i+1] = t     + Δt
	end
    return θ,dθdt,time
end


function phase_portrait(θ,dθdt,filename,fps)
	anim = @animate for i in 1:length(θ)
		# the whole plot
		plot(;size=(400,400), axisratio=:equal, legend=false)
		xlims!(minimum(θ)-0.1,maximum(θ)+0.1)
		ylims!(minimum(dθdt)-0.02,maximum(dθdt)+0.02)
		scatter!([(θ[i])],[dθdt[i]],axisratio=:equal)
		plot!([(θ[1:i])],[dθdt[1:i]],axisratio=:equal)
	end
	#filename = string("bezier","$(Int(c)).pdf")
	#savefig(filename)
	gif(anim, filename, fps=fps)
end

function plot_pendulum(θ,filename,fps)
	l = 1
	anim = @animate for i in 1:length(θ)
		# the whole plot
		plot(;size=(400,400), axisratio=:equal, legend=false)
		xlims!(-1.1,1.1)
		ylims!(-1.1,1.1)
		θi = θ[i]
		x  = l*cos(θi-pi/2)
		y  = l*sin(θi-pi/2)
		scatter!([x],[y],axisratio=:equal,markersize=5)
		plot!([0,x],[0,y],axisratio=:equal)
	end
	#filename = string("bezier","$(Int(c)).pdf")
	#savefig(filename)
	gif(anim, filename, fps=fps)
end

function snapshot(θ,dθdt,time,filename)
	pyplot()
	pf=plot(time,θ,legend=false,xlabel=L"t",ylabel=L"\theta")
	ph=plot(θ,dθdt,legend=false,color="red", xlabel=L"\theta",ylabel=L"\dot{\theta}")
	plot(pf, ph,  layout = (1,2), legend = false,size=(450,200))
	savefig(filename)
end


A = 1.15
Q = 2
ω = 0.67
θo = 0.1
T  = 20*(2*pi/ω)
Δt = T/1000

θ,dθdt,time = pendulum(A,Q,ω,θo,T,Δt);

fps = 60
#phase_portrait(θ,dθdt,"pendulum_phase.gif",fps)
#plot_pendulum(θ,"pendulum.gif",fps)

snapshot(θ,dθdt,time,"pendulum.pdf")
