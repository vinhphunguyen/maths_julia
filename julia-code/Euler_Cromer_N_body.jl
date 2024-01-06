using LaTeXStrings
using Printf
using LinearAlgebra
using GLMakie


function n_body()
	# Euler-Cromer method to solve Kepler's N body problem
	# length: AU
	# time: years
	m1 = 1;
	m2 = 3.00348959632E-6;
	m3 = m2*1.23000383E-2; 
	G  = 2.95912208286e-4; #gravitational constant

	N    = 3;
	ndim = 3;

	time      = 6. # 3.0 # 3 years or 3 periods
	dt        = 0.01
	stepCount = Int32(floor(time/dt))

	mass     = zeros(N)
	pos      = zeros(ndim,N,stepCount)
	vel      = zeros(ndim,N,stepCount)
	ta       = zeros(stepCount)

	mass[1]  = m1;
	mass[2]  = m2;
	mass[3]  = m3;

	# initial conditions

	pos[:,1,1] = [0; 0.0; 0];
	pos[:,2,1] = [-0.1667743823220;0.9690675883429;-0.0000342671456;];
	pos[:,3,1] = [-0.1694619061456;0.9692330175719;-0.0000266725711];

	vel[:,1,1] = [0.; 0.; 0.];
	vel[:,2,1] = [-0.0172346557280;-0.0029762680930;-0.0000004154391];
	vel[:,3,1] = [-0.0172817331582; -0.0035325102831;0.0000491191454];

	function force(ri,rj,mj)
	 	rij = rj - ri
		d   = norm(rij)
		return (G*mj/d^3)* rij
	end

	for n=1:stepCount-1
		@printf("Solving step: %d %f \n", n, ta[n])
		for i = 1: N
			ri = pos[:,i,n]
			fi = zeros(ndim)
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
	return pos, stepCount
end

function progress_for_one_step!(pos,i)
    return pos[:,:,i+1,]
end

function animstep!(pos,i, balls)
    pos_new = progress_for_one_step!(pos,i)
    balls[] = [Point2f(pos_new[1:2,1]), Point2f(pos_new[1:2,2])]
end

pos, stepCount = n_body()

fig = Figure()
display(fig)
ax = Axis(fig[1,1])
balls = Observable([Point2f(pos[1:2,1,1]), Point2f(pos[1:2,2,1] )])  
scatter!(ax, balls; marker = :circle, strokewidth = 2, 
        strokecolor = :purple,
        color = :black)

xlims!(ax, -1, 1)
ylims!(ax, -1, 1)

frames = 1:stepCount-1

record(fig, "video.mp4", frames; framerate = 60) do i # i = frame number
	for j in 1:5 # step 5 times per frame
    	animstep!(pos, i, balls)
	end
    # any other manipulation of the figure here...
end # for each step of this loop, a frame is recorded

