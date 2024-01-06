using Plots
using LaTeXStrings
using Printf
using LinearAlgebra
using PyCall
using DelimitedFiles
using NaturalSort
using PrettyTables

import Glob

ENV["GKSwstype"]="nul"

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
#sns = pyimport("seaborn")

#sns.set_style("ticks") # dark_background,

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 13
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 13
rcParams["legend.fontsize"] = 13
rcParams["xtick.labelsize"] = 13
rcParams["ytick.labelsize"] = 13



function heat_ftcs(initial_cond)

    remove_files()

	L  = 1.0  # length
	T  = 8.   # time interval [0,T]
	κ  = 0.1  # diffusion coeff.

	Δx = L/10
	β  = 1.
	Δt = β * 0.5*(Δx^2/κ^2)
	s  = (Δt*κ^2)/Δx^2

	t  = 0.

	output_interval = 1


	grid_point_count = Int32(L/Δx) + 1 # number of grid point

	# store u(x,t) for all points at  time instance

	θn     = zeros(grid_point_count)
	θn1    = zeros(grid_point_count)
	nodes  = zeros(grid_point_count)

	# initial temperature of the rod

	for i = 1:grid_point_count
		x            = (i-1)*Δx
		nodes[i]     = x
		θn[i]        = initial_cond(x,L)
	end

	umax  = maximum(θn)

	#################################
	# solution phase
	#################################

	counter = 0

	while (t < T)
		if (counter % output_interval == 0)
			fileName = string("output","$(Int(counter)).txt")
			#file     = open(fileName, "a")
			writedlm(fileName, θn)
			#close(file)
		end

		θn[1]  =0.
		θn[end]=0.

    for i = 2:grid_point_count-1
			θn1[i] = θn[i] + s * ( θn[i+1] - 2*θn[i] + θn[i-1] )
		end

    θn       = copy(θn1)
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
	gif(anim, "heat_ftcs.gif", fps=1)
  return nodes
end

nodes = heat_ftcs(initial_cond)

κ=0.1
N = 10
u1_exact = [exact_sol(x,3.6,κ,N) for x in nodes]
u2_exact = [exact_sol(x,4.,κ,N)  for x in nodes]
u3_exact = [exact_sol(x,7.5,κ,N) for x in nodes]

fig , ax = plt.subplots(1, figsize=set_size())
u0 = readdlm("output0.txt")
u1 = readdlm("output6.txt")
# u2 = readdlm("output16.txt")
# u3 = readdlm("output30.txt")
#ax.plot(nodes,u0,color="black")
# ax.plot(nodes,u1_exact,color="red")
# ax.plot(nodes,u1,color="red",marker="o")
ax.plot(nodes,u1_exact,color="blue",label="exact")
ax.plot(nodes,u1,color="blue",marker="o",label="numerical")
# ax.plot(nodes,u2_exact,color="red")
# ax.plot(nodes,u2,color="red",marker="o",linestyle = "None")
# ax.plot(nodes,u3_exact,color="cyan")
# ax.plot(nodes,u3,color="cyan",marker="o",linestyle = "None")
plt.grid()
plt.legend()
plt.savefig("heat_exact_num.pdf")


# ω1 = 10.
# ω2 = (10/8)*ω1
# ω12=0.5*(ω1-ω2)

# time=0:0.01:5

# x1=cos.(ω1*time)
# x2=cos.(ω2*time)
# x3=2*cos.(ω12*time)
# x12=x1+x2

# fig , (ax1,ax2,ax3) = plt.subplots(3, figsize=set_size())
# fig.tight_layout()

# ax1.plot(time,x1,color="blue",label="x_1")
# ax2.plot(time,x2,color="cyan",label="x_2")
# ax3.plot(time,x12,color="red",label="x_1+x_2")
# ax3.plot(time,x3,"b--",label="x_1+x_2")
# ax3.plot(time,-x3,"b--",label="x_1+x_2")
# plt.grid()
# plt.savefig("beat-wave2.pdf")
