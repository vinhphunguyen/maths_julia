using Plots
using LaTeXStrings
using Printf
ENV["GKSwstype"]="nul"
gr()
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

# plot phase portrait with animation
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

#plot the pendulum with the rod + animation
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

#plot the pendulum with the rod and (t,theta)+ animation
function plot_pendulum_theta(θ,dθ,time,filename,fps)
	l = 1
	anim = @animate for i in 1:20:length(θ)
		# the whole plot
		p1 = plot(;size=(400,400), legend=false)
		p2 = plot(;size=(600,400), legend=false)
		xlims!(p1, -1.1, 1.1)  # Set xlims! for p1 only
		ylims!(p1, -1.1, 1.1)  # Set xlims! for p1 only
		θi = θ[i]
		x  = l*cos(θi-pi/2)
		y  = l*sin(θi-pi/2)
		scatter!(p1,[x],[y],axisratio=:equal,markersize=5)
		plot!(p1,[0,x],[0,y],axisratio=:equal)

		xlims!(p2, 0, time[end])  # Set xlims! for p1 only
		ylims!(p2, minimum(θ)-.2, maximum(θ)+.2)  # Set xlims! for p1 only
		scatter!(p2,[time[i]], [(θi)],xlabel=L"t",ylabel=L"\theta")
		plot!(p2,[time[1:i]],[(θ[1:i])])
    	plot(p1, p2, layout=(1,2), size=(820, 700))
	end
	#filename = string("bezier","$(Int(c)).pdf")
	#savefig(filename)
	gif(anim, filename, fps=fps)
end

# plot two plots: (θ,t) và phase portrait 
function snapshot(θ,dθdt,time,filename)
	pf=plot(time,θ,legend=false,xlabel=L"t",ylabel=L"\theta")
	ph=plot(θ,dθdt,legend=false,color="red", xlabel=L"\theta",ylabel=L"\dot{\theta}")
	pp=plot(pf, ph,  layout = (1,2), legend = false,size=(450,200))
	savefig(pp,filename)
end

# compare two initial conditions, 
# plot both (θ,t) and phase portrait
function compare_two_initials(A,Q,ω,θo1,θo2,T,Δt)
	θ1,dθ1dt,time1 = pendulum(A,Q,ω,θo1,T,Δt);
	θ2,dθ2dt,time2 = pendulum(A,Q,ω,θo2,T,Δt);
	pf=plot(time1,θ1,legend=false,xlabel=L"t",ylabel=L"\theta")
	plot!(pf,time2,θ2,linestyle=:dash,legend=false,xlabel=L"t",ylabel=L"\theta")
	ph=plot(θ1,dθ1dt,legend=false,color="red", xlabel=L"\theta",ylabel=L"\dot{\theta}")
	plot!(ph,θ2,dθ2dt,linestyle=:dash,legend=false,color="black", xlabel=L"\theta",ylabel=L"\dot{\theta}")
	pp=plot(pf, ph,  layout = (1,2), legend = false,size=(450,200))
	savefig(pp,"pendulum_compare.pdf")
end

A = 0.
Q = 2000.
ω = 1.
θo = 0.5
T  = 10*(2*pi/ω)
Δt = T/1000

θ,dθdt,time = pendulum(A,Q,ω,θo,T,Δt);

fps = 2
#phase_portrait(θ,dθdt,"pendulum_phase.gif",fps)
#plot_pendulum(θ,"pendulum.gif",fps)
plot_pendulum_theta(θ,dθdt,time,"pendulum0.gif",fps)

#snapshot(θ,dθdt,time,"pendulum.pdf")



A = 1.1
Q = 2
ω = 0.67
θo = 0.1
T  = 20*(2*pi/ω)
Δt = T/1000

#θ,dθdt,time = pendulum(A,Q,ω,θo,T,Δt);
#plot_pendulum_theta(θ,dθdt,time,"pendulum2.gif",fps)
#compare_two_initials(A,Q,ω,0.1,0.1001,T,Δt)
