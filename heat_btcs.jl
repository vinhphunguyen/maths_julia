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
# u_t=c^2 u_xx with central difference schemes for u_xx and backward Euler for u_t
# both ends: zero temperature
# initial temperature
# This is BTCS finite difference method

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

# function initial_cond(x,L)
#   if     (x >= 0) && ( x <= 1/5)
# 	  return -x
#   elseif (x >= 1/5) && ( x <= 7/10)
# 	  return x - 2/5
#   else
# 	  return 1-x
#   end
# end

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

function heat_btcs(initial_temp)

    remove_files()

	L  = 1.0  #m
	κ  = 0.1

	Δx = L/10
	Δt = 0.125


	T  = 8.  # time interval [0,T]
	t  = 0.


	output_interval = 1

	s    = (Δt*κ^2)/Δx^2

	grid_point_count = Int32(L/Δx) + 1 # number of grid point

	# store u(x,t) for all points at three time instances: current (n), next (n+1)
	# and previous (n-1)

	A     = zeros(grid_point_count,grid_point_count)
	b     = zeros(grid_point_count)
	θ     = zeros(grid_point_count)
	nodes = zeros(grid_point_count)

	for i = 2:grid_point_count-1
		A[i,i]   = 1 + 2*s
		A[i,i-1] = -s
		A[i,i+1] = -s
	end

	A[1,1] = 1.
	A[grid_point_count,grid_point_count] = 1.

    fig, (ax1,ax2) = plt.subplots(1,2, figsize=set_size())
	ax1.imshow(A,interpolation="none")
	ax2.imshow(A[1:10,1:10],interpolation="none")
	plt.savefig("heat-matrix.png",bbox_inches="tight",dpi=600)

	# initial shape of the string: exp(-k(x-x0)^2)

	x0 = 0.3
	k  = 10

	for i = 1:grid_point_count
		x            = (i-1)*Δx
		nodes[i]     = x
		θ[i]         = initial_temp(x,L)
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

		b[2:end-1] = θ[2:end-1]
        θ[2:end-1] = A[2:end-1,2:end-1]\b[2:end-1]
        θ[1] = 0.
        θ[end] = 0.

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
	gif(anim, "heat_btcs.gif", fps=1)

    return nodes
end

nodes = heat_btcs(initial_cond)

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

# x0 = 1
# k  = 10
#
# Δt1 = 0.1*(1/k)
# Δt2 = 1.1*(2/k)
#
# r1 = k*Δt1
# r2 = k*Δt2
#
# t= 0:0.01:0.4
# x_exact=zeros(length(t))
# x1=zeros(length(t))
# x2=zeros(length(t))
#
#
# for n=1:length(t)
# 	x_exact[n]=x0*exp(-k*t[n])
# 	x1[n] = (1-r1)^(n-1)*x0
# 	x2[n] = (1-r2)^(n-1)*x0
# end
#
# fig, (ax1,ax2) = plt.subplots(1,2, figsize=set_size(1.2))
# ax1.plot(t,x_exact,color="black",label="exact sol.")
# ax1.plot(t,x1,color="blue",label=L"|r| \le 1 ")
# ax2.plot(t[1:length(t)-5],x2[1:length(t)-5],color="red",label=L"|r| > 1 ")
# ax1.legend()
# plt.savefig("fdm-stability.pdf",bbox_inches="tight")

data = zeros(3,12)
data[1,2:end] = nodes
data[2,2:end] = u2
data[3,2:end] = u3



#pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["", "0.0", "0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1.0"],backend = :latex,formatters = ft_printf("%5.8f",[2]))
