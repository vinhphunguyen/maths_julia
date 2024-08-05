using Plots
using Printf
using LinearAlgebra

gr()

function generate_circle(radius, num_points)
    theta = range(0, 2π, length=num_points)
    x = radius * cos.(theta)
    y = radius * sin.(theta)
    return x, y
end

radius = 1.0
num_points = 100


# update the chaser (x1) 
function update(x1, x2, velo, dt)
	d_vec  = normalize(x2- x1)
    x      = x1 + velo * dt * d_vec
    return x
end

# a duck is traveling on a circle of radius r with angular speed ω
# a dog is chasing the duck with a constant speed v = ω * r (pos1)
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
    return (t, pos1, pos2)
end

# position of four bugs

pos1 = Array{Float64, 1}[]
pos2 = Array{Float64, 1}[]

# add initial position of bugs
push!(pos1,[ 0.0,0.0])
push!(pos2,[ 0.0, 1.0])

r     = 1.0
omega = 2.0
k     = 3/3
dt   = 0.1
epsilon = 5e-2;
tmax =10.

time, pos1, pos2 = chaser(pos1, pos2, r, omega, k, dt, epsilon, tmax )


# plot(; size=(400, 400), axisratio=:equal, legend=false)
# xlims!(-1.5, 1.5)
# ylims!(-1.5, 1.5)
# plot!(first.(pos1[1:length(pos1)]), last.(pos1[1:length(pos1)]), seriestype=:path, label="Bug 1")
# plot!(first.(pos2[1:length(pos1)]), last.(pos2[1:length(pos1)]), seriestype=:path, label="Bug 2")
