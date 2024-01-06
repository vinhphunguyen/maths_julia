using LaTeXStrings
using Printf
using LinearAlgebra
using GLMakie
using WriteVTK

# Solving 2D heat equation on a square using finite difference method
# u_t=c^2 (u_xx + u_yy) with central difference schemes for u_xx, u_yy 
# and backward Euler for u_t
# boundary: zero temperature
# initial temperature: uniform
# This is FTCS finite difference method

function heat_ftcs_2D()
	L  = 1.0  #m
	κ  = 1.

	Δx = Δy = L/30
	β  = .4
	Δt = β * 0.5*(Δx^2/κ^2)
	s  = (Δt*κ^2)/Δx^2

	T  = 1.  # time interval [0,T]
	t  = 0.

	x=0:Δx:L
	y=0:Δx:L

	grid_point_count = Int32(ceil(L/Δx))  # number of grid point along x dir.
	time_count       = Int32(ceil(T/Δt))

	# store temmprature θ for all grid points
	θ     = zeros(Float64, grid_point_count, grid_point_count, time_count)
	# initial tempature
	θ[:,:,1] .= .0
	# boundary temperature
	θ[1,:,:]   .= 0.        # left edge
	θ[end,:,:] .= 0.      # right edge
	θ[:,1,:]   .= 0.        # bottom edge 
	θ[:,end,:] .= 10.      # top edge

	#################################
	# solution phase

	for n = 1:time_count-1
		temp_n  = view(θ,:,:,n)       # old temperature
		temp_n1 = view(θ,:,:,n+1)     # new temp. to be updated
		for j in 2:grid_point_count-1 # column-major loop (fast)
		  for i in 2:grid_point_count-1
		        temp_n1[i, j] = temp_n[i,j] + 
		                       s * ( temp_n[i+1,j] + temp_n[i-1,j] + 
		        	                   temp_n[i,j+1] + temp_n[i,j-1] - 4* temp_n[i,j] )
		  end
  	end
	end

	return θ,x,y
end

# some functions for making animation using Makie
function animstep!(n, temp_mat, θ)
    temp_mat[] = θ[:,:,n+1]
end

function makefig(θ)
	fig       = Figure(); display(fig)
	temp_mat  = Observable(θ[:,:,2])
	ax,hm     = heatmap(fig[1,1],temp_mat, colormap = :heat, interpolate = false)
	ax.aspect = AxisAspect(1)
	Colorbar(fig[1,2], hm, ticks = 0:0.1:10)
	return fig, temp_mat
end

# 1. solve 
θ, x,y = heat_ftcs_2D()

# 2. animation    
# fig, temp_mat = makefig(θ)
# framerate = 5;
# frames = 1:framerate:size(θ,3)
# record(fig, "video.mp4", frames; framerate = framerate) do i # i = frame number
#      animstep!(i,temp_mat,θ)
# end # for each step of this loop, a frame is recorded

for n = 1:size(θ,3)
	filename = "file$n"  
	vtk_grid(filename, x, y) do vtk
	    vtk["temperature"] = θ[:,:,n]
	end
end



