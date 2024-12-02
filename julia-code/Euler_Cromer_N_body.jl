using LaTeXStrings
using Printf
using LinearAlgebra
using CairoMakie
using DataStructures: CircularBuffer

function n_body(x1,x2,v1,v2, time,dt)
	# Euler-Cromer method to solve Kepler's N body problem
	# length: AU
	# time: years
	m1 = 1;
	m2 = 1;
	m3 = 1; 
	G  = 1#2.95912208286e-4; #gravitational constant

	N    = 3;
	ndim = 3;

	stepCount = Int32(floor(time/dt))

	mass     = zeros(N)
	pos      = zeros(ndim,N,stepCount)
	vel      = zeros(ndim,N,stepCount)
	ta       = zeros(stepCount)

	mass[1]  = m1;
	mass[2]  = m2;
	mass[3]  = m3;

	# initial conditions

	pos[:,1,1]  = [x1; x2;0];
    pos[:,2, 1] = -pos[:, 1, 1]
	pos[:,3,1]  = [0.0;0.0;0.0];

    vel[:,1,1] = [v1; v2;0.]
	vel[:,2,1] = [v1; v2;0.0];
	vel[:,3,1] = [-2v1; -2v2;0.]

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

pos, stepCount = n_body(
-1, 
0.,
0.464445237398184,
0.396059973403921,
30,
0.0001 
)

function gen_plot(pos, filename)
    with_theme(theme_latexfonts()) do
        fontsize_theme = Theme(fontsize=40)
        set_theme!(fontsize_theme)
        fig = Figure(resolution=(1000, 1000), fonts=(; regular="CMU Serif"))
        display(fig)
        ax = Axis(fig[1, 1], aspect=1.0, xlabel=L"$x$", ylabel=L"$y$") # aspect ratio 1:1
        #xlims!(ax, -1.1, 1.1)
        #ylims!(ax, -1.1, 1.1)
        balls = Observable([Point2f(pos[1:2, 1, 1]), Point2f(pos[1:2, 2, 1]), Point2f(pos[1:2, 3, 1])])
        lines!(ax, pos[1, 1, :], pos[2, 1, :], color=:red, linewidth=4)
        lines!(ax, pos[1, 2, :], pos[2, 2, :], color=:blue, linewidth=4)
        lines!(ax, pos[1, 3, :], pos[2, 3, :], color=:black, linewidth=4)
        #lines!(ax, time, first.(sol.(time)), color=:cyan)
        #lines!(ax, time, last.(sol.(time)), color=:purple)
        scatter!(ax, balls; marker=:circle, strokewidth=2, markersize=20,
            strokecolor=:purple,
            color=:black)
        save(filename, fig)
    end
end

gen_plot(pos, "n_body.pdf")

function animstep!(pos,i, balls, traj)
    balls[] = [Point2f(pos[1:2,1,i+1]), 
	           Point2f(pos[1:2,2,i+1]),
	           Point2f(pos[1:2,3,i+1])]
    for b = 1:3
        push!(getindex(traj)[b], Point2f(pos[1:2,b,i+1])) # add the new position to the circular buffer
    end
end

# animation 
tail  = 3000 # length of plotted trajectory, in units of `dt`
traj  = [CircularBuffer{Point2f}(tail) for _ in 1:3]
for b = 1:3
    fill!(traj[b], Point2f(pos[1:2, b, 1])) # add correct values to the circular buffer
end
traj = Observable(traj) # make it an observable


# Create the initial plot
scene = Scene()
balls = Observable([Point2f(0, 0), Point2f(0, 0), Point2f(0, 0)])
scatter!(scene, balls; marker=:circle, strokewidth=2, strokecolor=:purple, color=:black)

# Plot the trajectories
for b in 1:3
    lines!(scene, getindex(traj)[b], color=:orange, linewidth=3)
end


frames = 1:stepCount-1

record(scene, "video.mp4", frames; framerate=30) do i # i = frame number
    for j in 1:10 # step fewer times per frame
        animstep!(pos, i, balls, traj)
    end
    # Update the plot incrementally
    scatter!(scene, balls; marker=:circle, strokewidth=2, strokecolor=:purple, color=:black)
    for b in 1:3
        lines!(scene, getindex(traj)[b], color=:orange, linewidth=3)
    end
end # for each step of this loop, a frame is recorded