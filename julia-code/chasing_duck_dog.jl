# numerical solution of the chasing duck-dog problem
# Problem: 
# a duck is traveling on a circle of radius r with angular speed ω
# a dog is chasing the duck with a constant speed v = k ( ω * r ), k in [0,∞]
# Animation using Makie

using Printf
using LinearAlgebra
#using GLMakie
using CairoMakie    
using DataStructures: CircularBuffer
using LaTeXStrings


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

function distance(pos)
    d = 0.
    for i = 1:length(pos)-1
        d = d + norm( pos[i+1] - pos[i] )
    end
    return d
end

# update the chaser (x1) 
function update(x1, x2, velo, dt)
	d_vec  = normalize(x2- x1)
    x      = x1 + velo * dt * d_vec
    return x
end
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
        push!(pos1, x1_new); push!(pos2, x2_new)
        dx = norm(x1_new - x2_new)
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
    omega   = 1.0
    k       = .98
    dt      = 0.05
    epsilon = 5e-3;
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

function animstep!(pos1, pos2, i, duck, dog, traj, ddl)
    pos1_new, pos2_new = progress_for_one_step!(pos1, pos2, i)
    duck[] = [Point2f(pos2_new)]
    dog[]  = [Point2f(pos1_new)]
    ddl[]  = [Point2f(pos1_new), Point2f(pos2_new)]
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
ddl   = Observable([Point2f(pos1[1]), Point2f(pos2[1])])
tail  = 3000 # length of plotted trajectory, in units of `dt`
# The circular buffer datastructure makes making stepping-based
# animations very intuitive
traj  = CircularBuffer{Point2f}(tail)
fill!(traj, Point2f(pos1[1])) # add correct values to the circular buffer
traj = Observable(traj) # make it an observable

lines!(x, y) # plot the circle 
scatter!(ax, duck; marker=:circle, strokewidth=2,color=:purple) # plot the duck
scatter!(ax, dog; marker=:circle, strokewidth=2,color=:red, markersize=12)

# then its trajectory, with a nice fadeout color
# c = to_color(:purple)
# tailcol = [RGBAf(c.r, c.g, c.b, (i / tail)^2) for i in 1:tail]
lines!(ax, traj; linewidth=3, color=:orange)
lines!(ax, ddl; linewidth=1, color=:red)

xlims!(ax, -1.1, 1.1)
ylims!(ax, -1.1, 1.1)

frames = 1:stepCount-1

record(fig, "video.mp4", frames; framerate=20) do i # i = frame number
    for j in 1:5 # step 5 times per frame
        animstep!(pos1, pos2, i, duck, dog, traj, ddl)
    end
    # any other manipulation of the figure here...
end # for each step of this loop, a frame is recorded


# Save each frame as a PDF

with_theme(theme_latexfonts()) do
    fontsize_theme = Theme(fontsize=40)
    set_theme!(fontsize_theme)
    fig = Figure()
    display(fig)
    ax = Axis(fig[1, 1], aspect=1) # aspect ratio 1:1
    lines!(ax, x, y, color=:blue)
    scatter!(ax, first.(pos1), last.(pos1), color=:red, markersize=8)
    scatter!(ax, first.(pos2), last.(pos2), color=:green, markersize=5)
    save("frame.pdf", fig)
end    

d = distance(pos1)
println("Total distance traveled by the dog: ", d)