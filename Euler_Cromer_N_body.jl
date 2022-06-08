using Plots
using LaTeXStrings
using Printf
using LinearAlgebra

function n_body()

	# Euler-Cromer method to solve Kepler's N body problem
	# length: AU
	# time: years

	δ = 6e-3

	N = 3
	G = 1.

	m1 = 1.
	m2 = 1.
	m3 = 1.

	time      = 6. # 3.0 # 3 years or 3 periods
	dt        = 0.01
	stepCount = Int32(floor(time/dt))

	mass     = zeros(N)
	pos      = zeros(2,N,stepCount)
	vel      = zeros(2,N,stepCount)
	ta       = zeros(stepCount)

	mass[1]  = m1;
	mass[2]  = m2;
	mass[3]  = m3;

	# initial conditions

	pos[:,1,1] = [−0.97000436; 0.24308753];
	pos[:,3,1] = [0.97000436; -0.24308753];
	pos[:,2,1] = [0.1;0.];

	vel[:,1,1] = [0.4662036850; 0.4323657300];
	vel[:,3,1] = [0.4662036850; 0.4323657300];
	vel[:,2,1] = [−0.93240737, −0.86473146];


	function force(ri,rj,mj)
	 	rij = rj - ri
		d   = norm(rij)
		return (G*mj/d^3)* rij
	end

	for n=1:stepCount-1
		@printf("Solving step: %d %f \n", n, ta[n])
		for i = 1: N
			ri = pos[:,i,n]
			fi = zeros(2)
			for j = 1:N
				if ( j != i )
				    rj  = pos[:,j,n]
					mj  = mass[j]
					fij = force(ri,rj,mj)
					fi += fij
				end
			end

			vel[:,i,n+1] = vel[:,i,n] + dt * fi
			pos[:,i,n+1] = pos[:,i,n] + dt * vel[:,i,n+1]
		end
		ta[n+1] = ta[n] + dt
	end
	@printf("Solving done\n")

    colors     = [:blue,:orange,:red,:yellow]

	pyplot()
	p=plot(pos[1,1,:],pos[2,1,:],legend=false,axisratio=:equal,size=(400,400),color=colors[1])
	plot!(pos[1,2,:],pos[2,2,:],legend=false,color=colors[2])
	plot!(pos[1,3,:],pos[2,3,:],legend=false,color=colors[3])
	#xlims!(-1.1,1.1)
	#ylims!(-1.1,1.1)
	#plot!(xe,ve)
	xlabel!(L"x")
	ylabel!(L"y")

	savefig(p, "Euler-three-body.pdf")

	anim = @animate for n in 1:stepCount
		# the whole plot
		plot(;size=(400,400), axisratio=:equal, legend=false)
		xlims!(-1.1,1.1)
		ylims!(-1.1,1.1)
		scatter!(pos[1,:,n],pos[2,:,n],axisratio=:equal)
		plot!(pos[1,1,1:n],pos[2,1,1:n],axisratio=:equal,color=colors[1])
		plot!(pos[1,2,1:n],pos[2,2,1:n],axisratio=:equal,color=colors[2])
		plot!(pos[1,3,1:n],pos[2,3,1:n],axisratio=:equal,color=colors[3])
		# then the control points (no joining)
		end
		#filename = string("bezier","$(Int(c)).pdf")
		#savefig(filename)

	gif(anim, "three-body.gif", fps=30)

end

@time n_body()
