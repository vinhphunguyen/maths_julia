using PrettyTables
using Plots
using LaTeXStrings
using PyCall

# Euler method to solve simple harmonic oscilation

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
	golden_ratio = 0.75
	fig_width_in  = scale * width_pt * inches_per_pt # Figure width in inches
	fig_height_in = fig_width_in * golden_ratio
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end

function f(x,t)
	return t*x
end


T         = 2
time      = T

# exact solution
ta    = 0:0.01:T
xe    = zeros(length(ta))

for i=1:length(ta)
	t     = ta[i]
	xe[i] =  0.1*exp(0.5*t^2)
end

fig , ax = plt.subplots(1, 1, figsize=set_size())
plt.plot(ta,xe,color="black",label="exact")
plt.ylim(bottom=0)

stepSize  = [0.4;0.2;0.1;0.05;0.025]
errors    = zeros(length(stepSize))
colors    = ["blue","orange","red"]

for (n,dt) in enumerate(stepSize)
	stepCount = Int32(floor(time/dt))+1
	x         = zeros(stepCount)
	t         = zeros(stepCount)
	e         = zeros(stepCount)
	# initial conditions
	x[1]      = 0.1
	for i=1:stepCount-1
		x[i+1] = x[i] + dt * f(x[i],t[i])
		t[i+1] = t[i] + dt
		xee    = 0.1*exp(0.5*t[i+1]^2)
		e[i+1] = abs(x[i+1]- xee)
	end
	errors[n]  = maximum(e)
    #plt.plot(t,x,color=colors[n],label=string(L"h=","$(dt)"),marker="o")
	#plot!(t,x,markershape=:circle, label= string("h=","$(dt)"))
end
plt.xlabel(L"x")
plt.ylabel(L"y(x)")
plt.legend()
plt.grid()
# plt.savefig("Euler-error.pdf",bbox_inches="tight")


fig , ax = plt.subplots(1, 1, figsize=set_size())
plt.loglog(stepSize,errors,color="black",label="exact")
plt.xlabel(L"h")
plt.ylabel(L"error")
plt.grid(true, which="both", ls="-")
plt.show()
plt.savefig("Euler-error-log.pdf",bbox_inches="tight")
