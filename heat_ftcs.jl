using Plots
using LaTeXStrings
using Printf
using LinearAlgebra
using PyCall
using DelimitedFiles
using NaturalSort
using PrettyTables

import Glob

# Solving 1D heat equation using finite difference method
# u_t=c^2 u_xx with central difference schemes for u_xx and forward Euler for u_t
# both ends: zero temperature
# initial temperature
# This is FTCS finite difference method

function remove_files()
	dumpfiles = Glob.glob("*.txt")
	if (length(dumpfiles) > 0 )
		[rm(file)  for file in dumpfiles]
	end

	dumpfiles = Glob.glob("*.pdf")
	if (length(dumpfiles) > 0 )
		[rm(file)  for file in dumpfiles]
	end
end


function set_size(scale=1)
	width_pt = 468.
	inches_per_pt = 1 / 72.27
	golden_ratio = 0.57
	fig_width_in  = scale * width_pt * inches_per_pt # Figure width in inches
	fig_height_in = fig_width_in * golden_ratio
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end

function initial_cond(x,L)
  return 1.
end

function exact_sol(x,t,κ,N)
	s = 0.
	for n=1:2:N
		s += (1/n) * exp(-(n*π*κ)^2*t) * sin(n*π*x)
	end
	return (4/π)*s
end

mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")
sns = pyimport("seaborn")

sns.set_style("ticks") # dark_background,

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 16
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 16
rcParams["legend.fontsize"] = 16
rcParams["xtick.labelsize"] = 16
rcParams["ytick.labelsize"] = 16



function heat_ftcs(initial_cond)

    remove_files()

	L  = 1.0  #m
	κ  = 0.1

	Δx = L/10

	β  = 1.1
	Δt = β * 0.5*(Δx^2/κ^2)


	T  = 8.   # time interval [0,T]
	t  = 0.


	output_interval = 1

	s    = (Δt*κ^2)/Δx^2

	grid_point_count = Int32(L/Δx) + 1 # number of grid point

	# store u(x,t) for all points at  time instance

	θ     = zeros(grid_point_count)
	nodes = zeros(grid_point_count)

	# initial temperature of the rod

	for i = 1:grid_point_count
		x            = (i-1)*Δx
		nodes[i]     = x
		θ[i]         = initial_cond(x,L)
	end

	umax  = maximum(θ)

	#################################
	# solution phase
	#################################

	counter = 0

	while (t < T)
		if (counter % output_interval == 0)
			fileName = string("output","$(Int(counter)).txt")
			#file     = open(fileName, "a")
			writedlm(fileName, θ)
			#close(file)
		end

		θ[1]=0.
		θ[end]=0.

        for i = 2:grid_point_count-1
			θ[i] = θ[i] + s * ( θ[i+1] - 2*θ[i] + θ[i-1] )
		end



		t       += Δt
		counter += 1
	end

	#################################
	# post processing
	#################################

	files = Glob.glob(string("*.txt"))
	files = sort(files,lt=natural)

    plot(;size=(400,400), axisratio=:equal, legend=false)

    anim = @animate for file in files
		 u = readdlm(file)
		 plot(nodes,u,color="black")
		 ylims!(0,umax)
		 savefig(string(splitext(file)[1],".pdf"))
	end
	gif(anim, "heat_ftbs.gif", fps=1)
    return nodes
end

heat_ftcs(initial_cond)

nodes = heat_ftcs(initial_cond)

κ=0.1
N = 10
u1_exact = [exact_sol(x,1.5,κ,N) for x in nodes]
u2_exact = [exact_sol(x,4.,κ,N) for x in nodes]
u3_exact = [exact_sol(x,7.5,κ,N) for x in nodes]

fig , ax = plt.subplots(1, figsize=set_size())
u0 = readdlm("output0.txt")
u1 = readdlm("output1.txt")
u2 = readdlm("output2.txt")
u3 = readdlm("output60.txt")
ax.plot(nodes,u0,color="black")
# ax.plot(nodes,u1_exact,color="red")
# ax.plot(nodes,u1,color="red",marker="o")
ax.plot(nodes,u1_exact,color="blue",label="exact")
ax.plot(nodes,u1,color="blue",marker="o",linestyle = "None",label="numerical")
ax.plot(nodes,u2_exact,color="red")
ax.plot(nodes,u2,color="red",marker="o",linestyle = "None")
ax.plot(nodes,u3_exact,color="cyan")
ax.plot(nodes,u3,color="cyan",marker="o",linestyle = "None")
plt.grid()
plt.legend()
plt.savefig("heat_exact_num.pdf")
