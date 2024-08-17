
using Printf
using LinearAlgebra
using CairoMakie
using DataStructures: CircularBuffer

# update the chaser (x1) 
function update(x1, x2, velo, dt)
	d_vec  = normalize(x2- x1)
    x      = x1 + velo * dt * d_vec
    return x
end

function chaser(pos1, pos2, pos3, velo, dt, epsilon)
	i    = 1
	t    = 0
	while (true)
		x1 = pos1[i]
		x2 = pos2[i]
		x3 = pos3[i]

		x1_new = update(x1, x2, velo, dt)
		x2_new = update(x2, x3, velo, dt)
		x3_new = update(x3, x1, velo, dt)

		dx = norm( x1_new - x2_new )

		if (dx < epsilon ) break; end

		push!(pos1,x1_new)
		push!(pos2,x2_new)
		push!(pos3,x3_new)

		i = i + 1
		t = t + dt
		#if (i > 60) break; end
	end
	return t, i, pos1, pos2, pos3
end

function go(pos1,pos2,pos3)
    velo    = 1.0
    dt      = 0.01
    epsilon = 5e-2;

    return chaser(pos1,pos2,pos3, velo, dt, epsilon)
end

###
posA = Array{Float64,1}[]
posB = Array{Float64,1}[]
posE = Array{Float64,1}[]

push!(posA, [0, 0])
push!(posB, [1, 0])
push!(posE, [cos(pi/3), sin(pi/3)])

t,stepCount, posA, posB, posE = go(posA, posB, posE)

###
posA1 = Array{Float64,1}[]
posB1 = Array{Float64,1}[]
posE1 = Array{Float64,1}[]

push!(posA1, [1, 0])
push!(posB1, [2, 0])
push!(posE1, [1+cos(pi / 3), 0 + sin(pi / 3)])

t, ss, posA1, posB1, posE1 = go(posA1, posB1, posE1)

###
posA2 = Array{Float64,1}[]
posB2 = Array{Float64,1}[]
posE2 = Array{Float64,1}[]

push!(posA2, [2, 0])
push!(posB2, [3, 0])
push!(posE2, [2 + cos(pi / 3), 0 + sin(pi / 3)])

t, ss, posA2, posB2, posE2 = go(posA2, posB2, posE2)

###
posA3 = Array{Float64,1}[]
posB3 = Array{Float64,1}[]
posE3 = Array{Float64,1}[]

push!(posA3, [1, 0])
push!(posB3, [1 + cos(pi / 3), 0 + sin(pi / 3)])
push!(posE3, [0 + cos(pi / 3), 0 + sin(pi / 3)])

t, ss, posA3, posB3, posE3 = go(posA3, posB3, posE3)
###
posA4 = Array{Float64,1}[]
posB4 = Array{Float64,1}[]
posE4 = Array{Float64,1}[]

push!(posA4, [2, 0])
push!(posE4, [3, 0])
push!(posB4, [2 + cos(pi / 3), 0 + sin(pi / 3)])

t, ss, posA4, posB4, posE4 = go(posA4, posB4, posE4)
###
posA5 = Array{Float64,1}[]
posB5 = Array{Float64,1}[]
posE5 = Array{Float64,1}[]

push!(posA5, [2, 0])
push!(posB5, [2 + cos(pi/3), sin(pi/3)])
push!(posE5, [1 + cos(pi / 3), 0 + sin(pi / 3)])

t, ss, posA5, posB5, posE5 = go(posA5, posB5, posE5)
###
posA6 = Array{Float64,1}[]
posB6 = Array{Float64,1}[]
posE6 = Array{Float64,1}[]

push!(posA6, [ cos(pi / 3), 0 + sin(pi / 3)])
push!(posB6, [1+cos(pi / 3), 0 + sin(pi / 3)])
push!(posE6, [cos(pi/3)+cos(pi / 3), sin(pi/3) + sin(pi / 3)])

t, ss, posA6, posB6, posE6 = go(posA6, posB6, posE6)
###
posA7 = Array{Float64,1}[]
posB7 = Array{Float64,1}[]
posE7 = Array{Float64,1}[]

push!(posA7, [1+cos(pi/3), sin(pi/3)])
push!(posB7, [2+cos(pi/3), sin(pi/3)])
push!(posE7, [1+ 2cos(pi / 3), 0 + 2sin(pi / 3)])

t, ss, posA7, posB7, posE7 = go(posA7, posB7, posE7)
###
posA8 = Array{Float64,1}[]
posB8 = Array{Float64,1}[]
posE8 = Array{Float64,1}[]

push!(posA8, [1+cos(pi/3), 0+sin(pi/3)])
push!(posB8, [1+2cos(pi/3), 2sin(pi/3)])
push!(posE8, [2cos(pi / 3), 0 + 2sin(pi / 3)])

t, ss, posA8, posB8, posE8 = go(posA8, posB8, posE8)
###
posA9 = Array{Float64,1}[]
posB9 = Array{Float64,1}[]
posE9 = Array{Float64,1}[]

push!(posA9, [2cos(pi/3), 2sin(pi/3)])
push!(posB9, [1+2cos(pi/3), 2sin(pi/3)])
push!(posE9, [3cos(pi / 3), 3sin(pi / 3)])

t, ss, posA9, posB9, posE9 = go(posA9, posB9, posE9)

with_theme(theme_latexfonts()) do
    fontsize_theme = Theme(fontsize=40)
    set_theme!(fontsize_theme)
    fig = Figure()
    display(fig)
    ax = Axis(fig[1, 1], aspect=1) # aspect ratio 1:1
    hidedecorations!(ax)  # hides ticks, grid and lables
    hidespines!(ax)  # hide the frame
	for i in 1:5:stepCount
        squares0 = [Point2f(posA[i]), Point2f(posB[i]), Point2f(posE[i])]
        squares1 = [Point2f(posA1[i]), Point2f(posB1[i]), Point2f(posE1[i])]
        squares2 = [Point2f(posA2[i]), Point2f(posB2[i]), Point2f(posE2[i])]
        squares3 = [Point2f(posA3[i]), Point2f(posB3[i]), Point2f(posE3[i])]
        squares4 = [Point2f(posA4[i]), Point2f(posB4[i]), Point2f(posE4[i])]
        squares5 = [Point2f(posA5[i]), Point2f(posB5[i]), Point2f(posE5[i])]
        squares6 = [Point2f(posA6[i]), Point2f(posB6[i]), Point2f(posE6[i])]
        squares7 = [Point2f(posA7[i]), Point2f(posB7[i]), Point2f(posE7[i])]
        squares8 = [Point2f(posA8[i]), Point2f(posB8[i]), Point2f(posE8[i])]
        squares9 = [Point2f(posA9[i]), Point2f(posB9[i]), Point2f(posE9[i])]
        poly!(ax, squares0; closed=true, strokewidth=.2, color=:gray) # plot the square
        poly!(ax, squares1; closed=true, strokewidth=.2, color=:gray) # plot the square
        poly!(ax, squares2; closed=true, strokewidth=.2, color=:gray) # plot the square
        poly!(ax, squares3; closed=true, strokewidth=.2, color=:gray) # plot the square
        poly!(ax, squares4; closed=true, strokewidth=.2, color=:gray) # plot the square
        poly!(ax, squares5; closed=true, strokewidth=.2, color=:gray) # plot the square
        poly!(ax, squares6; closed=true, strokewidth=.2, color=:gray) # plot the square
        poly!(ax, squares7; closed=true, strokewidth=.2, color=:gray) # plot the square
        poly!(ax, squares8; closed=true, strokewidth=.2, color=:gray) # plot the square
        poly!(ax, squares9; closed=true, strokewidth=.2, color=:gray) # plot the square
	end
    save("frame.pdf", fig, bbox=:tight)
end