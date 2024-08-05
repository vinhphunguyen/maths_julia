using Plots
using Printf
using LinearAlgebra

# update the chaser (x1) 
function update(x1, x2, velo, dt)
	d_vec  = normalize(x2- x1)
    x      = x1 + velo * dt * d_vec
    return x
end


function chaser(pos1, pos2, pos3, pos4, velo, dt, epsilon)
	i    = 1
	t    = 0
	while (true)
		x1 = pos1[i]
		x2 = pos2[i]
		x3 = pos3[i]
		x4 = pos4[i]

		x1_new = update(x1, x2, velo, dt)
		x2_new = update(x2, x3, velo, dt)
		x3_new = update(x3, x4, velo, dt)
		x4_new = update(x4, x1, velo, dt)

		dx = norm( x1_new - x2_new )

		if (dx < epsilon ) break; end

		push!(pos1,x1_new)
		push!(pos2,x2_new)
		push!(pos3,x3_new)
		push!(pos4,x4_new)

		i = i + 1
		t = t + dt
		#if (i > 60) break; end
	end
	x1_values = [point[1] for point in pos1]
	y1_values = [point[2] for point in pos1]

	x2_values = [point[1] for point in pos2]
	y2_values = [point[2] for point in pos2]

	x3_values = [point[1] for point in pos3]
	y3_values = [point[2] for point in pos3]

	x4_values = [point[1] for point in pos4]
	y4_values = [point[2] for point in pos4]

	size = 6

	anim = @animate for i in 1:length(pos1)
		# the whole plot
		plot(;size=(400,400), axisratio=:equal, legend=false)
		xlims!(-0.5,0.5)
		ylims!(-0.5,0.5)

		plot!([0.5, 0.5, -0.5, -0.5],[-0.5,0.5,0.5,-0.5],linewidth=2, axisratio=:equal)
		plot!([x1_values[i], x2_values[i], x3_values[i], x4_values[i], x1_values[i]],
			  [y1_values[i], y2_values[i], y3_values[i], y4_values[i], y1_values[i]],
			linewidth=3, axisratio=:equal)

		scatter!([x1_values[i]],[y1_values[i]],axisratio=:equal, markersize=size)
		scatter!([x2_values[i]],[y2_values[i]],axisratio=:equal, markersize=size)
		scatter!([x3_values[i]],[y3_values[i]],axisratio=:equal, markersize=size)
		scatter!([x4_values[i]],[y4_values[i]],axisratio=:equal, markersize=size)

		plot!(x1_values[1:i],y1_values[1:i],axisratio=:equal)
		plot!(x2_values[1:i],y2_values[1:i],axisratio=:equal)
		plot!(x3_values[1:i],y3_values[1:i],axisratio=:equal)
		plot!(x4_values[1:i],y4_values[1:i],axisratio=:equal)

		if ( i% 10 == 0)
			filename = string("chase","$(Int(i)).pdf")
			savefig(filename)
		end

		end
	gif(anim, "chase.gif", fps=15)
	return t
end

# position of four bugs

pos1 = Array{Float64, 1}[]
pos2 = Array{Float64, 1}[]
pos3 = Array{Float64, 1}[]
pos4 = Array{Float64, 1}[]

# add initial position of bugs
push!(pos1,[ 0.5,-0.5])
push!(pos2,[ 0.5, 0.5])
push!(pos3,[-0.5, 0.5])
push!(pos4,[-0.5,-0.5])


velo = 1.0
dt   = 0.01
epsilon = 5e-2;

time = chaser(pos1,pos2,pos3,pos4, velo, dt, epsilon)

