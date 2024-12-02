using LinearAlgebra
using CairoMakie # animation and plotting
using DataStructures: CircularBuffer

# update the chaser (x1) for one step
function update(x1, x2, velo, dt)
	d_vec  = normalize(x2- x1)
    x      = x1 + velo * dt * d_vec
    return x
end
# chaser function, for all bugs, all time steps
function chaser!(data, velo, dt, epsilon)
	i    = 1
	t    = 0
	while (true)
        for b=1:num_of_bugs
            pos_b1  = data[b]
            pos_b2  = b == num_of_bugs ? data[1] : data[b+1]
            x1      = pos_b1[i,:]
            x2      = pos_b2[i,:]
            x1_new  = update(x1, x2, velo, dt)
            data[b] = vcat(data[b], x1_new') # append new position to data
        end
        # check kissing condition
        x1_new = data[1][i+1,:]
        x2_new = data[2][i+1,:]
        dx     = norm(x1_new - x2_new)
        if (dx < epsilon)
            break
        end
        # advance to next step
		i = i + 1
		t = t + dt
	end
	return t, i
end

num_of_bugs = 4 
# data: contain the position in time of all the bugs
# data[i]: matrix of positions of bug i for all time steps
data = Vector{Matrix{Float64}}(undef, num_of_bugs)


# add initial position of bugs (vertices of regular polygon)
θ = 2π / num_of_bugs
for i=1:num_of_bugs
    data[i] = [cos((i-1)*θ) sin((i-1)*θ)]
end

velo    = 1.0
dt      = 0.01
epsilon = 5e-2;

time, stepCount    = chaser!(data, velo, dt, epsilon)

# make animation using Makie.jl
function animstep!(data, i, bugs, traj)
    bugs[] = [Point2f(data[b][i+1,:]) for b in 1:num_of_bugs]
    #squares[] = [Point2f(pos1_new), Point2f(pos2_new), Point2f(pos3_new), Point2f(pos4_new), Point2f(pos5_new)]
    for b = 1:num_of_bugs
        push!(getindex(traj)[b], Point2f(data[b][i+1,:])) # add the new position to the circular buffer
    end
end

# Function to generate regular polygon vertex coordinates
function generate_pentagon(radius, center, num_points=num_of_bugs)
    angles = range(0, stop=2π, length=num_points + 1)
    x      = [center[1] + radius * cos(angle) for angle in angles]
    y      = [center[2] + radius * sin(angle) for angle in angles]
    return x, y
end

# Parameters for the pentagon
radius = 1.0
center = (0.0, 0.0)

# Generate pentagon coordinates
x, y = generate_pentagon(radius, center)

fig  = Figure(); display(fig)
ax   = Axis(fig[1, 1], aspect=1) # aspect ratio 1:1
bugs = Observable([Point2f(data[b][1,:]) for b in 1:num_of_bugs])
# squares = Observable([Point2f(pos1[1]), Point2f(pos2[1]), Point2f(pos3[1]), Point2f(pos4[1]), Point2f(pos5[1]), Point2f(pos1[1])])

# trajectory tail
tail  = 3000 # length of plotted trajectory, in units of `dt`
traj  = [CircularBuffer{Point2f}(tail) for _ in 1:num_of_bugs]
for b=1:num_of_bugs
    fill!(traj[b], Point2f(data[b][1,:])) # add correct values to the circular buffer
end
traj = Observable(traj) # make it an observable


# Plot the pentagon
lines!(ax, x, y, linewidth=2, linestyle=:solid, color=:blue)
scatter!(ax, bugs; marker=:circle, strokewidth=2, color=:purple) # plot the duck
# poly!(ax, squares; closed=true, strokewidth=2, color=:purple) # plot the square
for b = 1:num_of_bugs
 lines!(ax, getindex(traj)[b]; linewidth=3, color=:orange)
end


xlims!(ax, -1.1, 1.1)
ylims!(ax, -1.1, 1.1)

frames = 1:stepCount-1

# record(fig, "video.mp4", frames; framerate=20) do i # i = frame number
#     for j in 1:5 # step 5 times per frame
#         animstep!(data, i, bugs, traj)
#     end
#     # any other manipulation of the figure here...
# end # for each step of this loop, a frame is recorded




# Define the exact solution function
e(theta) = exp(-theta)

# Define the range for theta
theta = LinRange(0, 100, 1000)

# Compute the function values
r_values = e.(theta)

# Convert polar coordinates (r, theta) to Cartesian coordinates (x, y)
x_values = r_values .* cos.(theta)
y_values = r_values .* sin.(theta)

# make a pdf 
with_theme(theme_latexfonts()) do
    fontsize_theme = Theme(fontsize=40)
    set_theme!(fontsize_theme)
    fig = Figure()
    display(fig)
    ax = Axis(fig[1, 1], aspect=1) # aspect ratio 1:1
    hidedecorations!(ax)  # hides ticks, grid and lables
    hidespines!(ax)  # hide the frame
    lines!(ax, x, y, color=:blue)
    lines!(ax, x_values, y_values, color=:red, linewidth=2)
    lines!(ax, data[1][:,1], data[1][:,2], color=:black, linewidth=2)
	# for i in 1:2:stepCount
    #     squares0 = [Point2f(data[b][i,:]) for b in 1: num_of_bugs]
    #     poly!(ax, squares0; strokewidth=.2, color=:gray) # plot the square
	# end
    save("frame.pdf", fig)
end