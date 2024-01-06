using PrettyTables
using Plots
using LaTeXStrings
using Primes
using PyCall


mpl = pyimport("matplotlib")
sym = pyimport("sympy")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 12
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 12
rcParams["legend.fontsize"] = 12
rcParams["xtick.labelsize"] = 12
rcParams["ytick.labelsize"] = 12

function set_size(scale=1)
	width_pt = 468.
	inches_per_pt = 1 / 72.27
	golden_ratio = 0.75
	fig_width_in  = scale * width_pt * inches_per_pt # Figure width in inches
	fig_height_in = fig_width_in * golden_ratio
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end

f(y)   = log(y)-y
g(n,y) = exp(n*(f(y)))
gauss(y) = exp(-(y-1)^2/2)

y = 0:0.1:5

fig , ax = plt.subplots(1, 2)
ax[1].plot(y,f.(y))
ax[2].plot(y,g.(10,y))
#ax[2].plot(y,gauss.(y),color="red")
plt.tight_layout()
plt.savefig("laplace-func.pdf",bbox_inches="tight")
