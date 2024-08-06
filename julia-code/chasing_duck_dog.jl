# numerical solution of the chasing duck-dog problem
# Problem: 
# a duck is traveling on a circle of radius r with angular speed ω
# a dog is chasing the duck with a constant speed v = k ( ω * r ), k in [0,∞]
# Animation using Makie

using Plots
using Printf
using LinearAlgebra
using GLMakie
using DataStructures: CircularBuffer

# generate points on a circle of radius r
# for visualization the duck's path
function generate_circle(radius, num_points)
    theta = range(0, 2π, length=num_points)
    x = radius * cos.(theta)
    y = radius * sin.(theta)
    return x, y
end

radius     = 1.0
num_points = 100


# update the chaser (x1) 
function update(x1, x2, velo, dt)
	d_vec  = normalize(x2- x1)
    x      = x1 + velo * dt * d_vec
    return x
end

# a duck is traveling on a circle of radius r with angular speed ω
# a dog is chasing the duck with a constant speed v = k * ω * r (pos1)
function chaser(pos1, pos2, r, omega, k, dt, epsilon, tmax)
	i    = 1
	t    = 0
	while (true)     
		x1 = pos1[i]
		x2 = pos2[i]

        i = i + 1
        t = t + dt

        velo   = k * omega * r
		x1_new = update(x1, x2, velo, dt)
        x2_new = [r * cos(omega * t), r * sin(omega * t)]

        push!(pos1, x1_new)
        push!(pos2, x2_new)

        dx = norm(x1_new - x2_new)

        # Print the current time
        println(t)

        # Check stopping conditions
        if ( t > tmax || dx < epsilon )
            break
        end
	end
    return (t, i, pos1, pos2)
end

function dog_duck_chasing()
    # position of duck and dog
    pos1 = Array{Float64, 1}[]
    pos2 = Array{Float64, 1}[]

    # add initial position of them
    push!(pos1,[ 0.0,0.0])
    push!(pos2,[ 1.0, 0.0]) # cannot change this

    r       = 1.0
    omega   = 2.0
    k       = 2/3
    dt      = 0.05
    epsilon = 5e-2;
    tmax    = 10.

    time, stepCount, pos1, pos2 = chaser(pos1, pos2, r, omega, k, dt, epsilon, tmax )

    return time, stepCount, pos1, pos2
end

# let the duck and dog run
time, stepCount, pos1, pos2 = dog_duck_chasing()

# animation using Makie

function progress_for_one_step!(pos1, pos2, i)
    return pos1[i+1,], pos2[i+1,]
end

function animstep!(pos1, pos2, i, duck, dog, traj)
    pos1_new, pos2_new = progress_for_one_step!(pos1, pos2, i)
    duck[] = [Point2f(pos2_new)]
    dog[]  = [Point2f(pos1_new)]
    push!(traj[], Point2f(pos1_new))
    traj[] = traj[] # <- important! Updating in-place the value of an
    # `Observable` does not trigger an update!
end

x,y = generate_circle(radius, num_points)

fig    = Figure()
display(fig)
ax    = Axis(fig[1, 1], aspect=1) # aspect ratio 1:1
duck  = Observable([Point2f(pos2[1])])
dog   = Observable([Point2f(pos1[1])])
tail  = 3000 # length of plotted trajectory, in units of `dt`
# The circular buffer datastructure makes making stepping-based
# animations very intuitive
traj  = CircularBuffer{Point2f}(tail)
fill!(traj, Point2f(pos1[1])) # add correct values to the circular buffer
traj = Observable(traj) # make it an observable

lines!(x, y)
scatter!(ax, duck; marker=:circle, strokewidth=2,
    color=:purple)

scatter!(ax, dog; marker=:circle, strokewidth=2,
    color=:black, markersize=12)

# then its trajectory, with a nice fadeout color
# c = to_color(:purple)
# tailcol = [RGBAf(c.r, c.g, c.b, (i / tail)^2) for i in 1:tail]
lines!(ax, traj; linewidth=3, color=:orange)

xlims!(ax, -1.1, 1.1)
ylims!(ax, -1.1, 1.1)

frames = 1:stepCount-1

record(fig, "video.mp4", frames; framerate=20) do i # i = frame number
    for j in 1:5 # step 5 times per frame
        animstep!(pos1, pos2, i, duck, dog, traj)
    end
    # any other manipulation of the figure here...
end # for each step of this loop, a frame is recorded

