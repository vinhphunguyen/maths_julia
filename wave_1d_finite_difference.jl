using Plots
using LaTeXStrings
using Printf
using LinearAlgebra
using PyCall
using DelimitedFiles
using NaturalSort

import Glob

# Solving 1D wave equation using finite difference method
# u_tt=c^2 u_xx with central difference schemes for both u_tt and u_xx
# both ends: fixed
# no non-zero initial velocities

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

function wave()

    remove_files()

	c  = 300.0 # m/s^2
	L  = 1.0  #m

	α  = 1.
	Δx = L/200
	Δt = α*(Δx/c)
	T  = 2*(L/c)   # time interval [0,T]
	t  = 0.


	output_interval = 10

	r    = (Δt*c)/Δx
	r2   = r*r
	rfac = 2*(1-r2)

	grid_point_count = Int32(L/Δx) + 1 # number of grid point

	# store u(x,t) for all points at three time instances: current (n), next (n+1)
	# and previous (n-1)

	nodes     = zeros(grid_point_count)
	u_next    = zeros(grid_point_count)
	u_current = zeros(grid_point_count)
	u_prev    = zeros(grid_point_count)

	# initial shape of the string: exp(-k(x-x0)^2)

	x0 = 0.3
	k  = 1000

	for i = 1:grid_point_count
		x            = (i-1)*Δx
		nodes[i]     = x
		u_prev[i]    = exp(-k*(x-x0)^2)
		u_current[i]   = exp(-k*(x-x0)^2)
		#u_prev[i]    = sin(2*π*x)
	end

	umax  = maximum(u_prev)

	# for i = 2:grid_point_count-1
	# 	u_current[i] = u_prev[i] + 0.5*r2*(u_prev[i+1]-2*u_prev[i]+u_prev[i-1])
	# end

	#################################
	# solution phase
	#################################

	counter = 0

	while (t < T)
	    for i=2:grid_point_count-1
			u_next[i] = rfac*u_current[i] - u_prev[i] + r2 * (u_current[i+1]+u_current[i-1])
			#u_next[i] = 2*u_current[i] - u_prev[i] + r2 * (u_current[i+1] -2*u_current[i] + u_current[i-1])
		end

		#u_next[1] = 0.
		#u_next[grid_point_count] = 0.

        u_prev    = copy(u_current)
		u_current = copy(u_next)


		if (counter % output_interval == 0)
			fileName = string("output","$(Int(counter)).txt")
			#file     = open(fileName, "a")
			writedlm(fileName, u_next)
			#close(file)
		end
		t       += Δt
		counter += 1
	end

	#################################
	# post processing
	#################################

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

	function set_size(scale=1)
		width_pt = 468.
		inches_per_pt = 1 / 72.27
		golden_ratio = 0.2
		fig_width_in  = scale * width_pt * inches_per_pt # Figure width in inches
		fig_height_in = fig_width_in * golden_ratio
		fig_dim = ( fig_width_in , fig_height_in )
		return fig_dim
	end

	files = Glob.glob(string("*.txt"))
	files = sort(files,lt=natural)

    plot(;size=(400,400), axisratio=:equal, legend=false)

    anim = @animate for file in files
		 u = readdlm(file)
		 plot(nodes,u,color="black")
		 ylims!(-umax,umax)
		 savefig(string(splitext(file)[1],".pdf"))
	end
	gif(anim, "guitar_fourier.gif", fps=1)

end

wave()

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

function set_size(scale=1)
	width_pt = 468.
	inches_per_pt = 1 / 72.27
	golden_ratio = 0.2
	fig_width_in  = scale * width_pt * inches_per_pt # Figure width in inches
	fig_height_in = fig_width_in * golden_ratio
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end

fig , ax = plt.subplots(5, figsize=set_size())
u0 = readdlm("output0.txt")
u1 = readdlm("output10.txt")
u2 = readdlm("output50.txt")
u3 = readdlm("output60.txt")
u4 = readdlm("output160.txt")
ax[1].plot(nodes,u0,color="black")
ax[1].xaxis.set_visible(false)
ax[1].yaxis.set_visible(false)
ax[2].plot(nodes,u1,color="black")
ax[2].xaxis.set_visible(false)
ax[2].yaxis.set_visible(false)
ax[3].plot(nodes,u2,color="black")
ax[3].xaxis.set_visible(false)
ax[3].yaxis.set_visible(false)
ax[4].plot(nodes,u3,color="black")
ax[4].xaxis.set_visible(false)
ax[4].yaxis.set_visible(false)
ax[5].plot(nodes,u4,color="black")
ax[5].xaxis.set_visible(false)
ax[5].yaxis.set_visible(false)
plt.savefig("wave-fdm.pdf",bbox_inches="tight")
