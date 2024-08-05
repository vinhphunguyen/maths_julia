using LinearAlgebra
using Plots
using LaTeXStrings
using PyCall

mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")
sns = pyimport("seaborn")

sns.set_style("ticks") # dark_background,

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 24
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 24
rcParams["legend.fontsize"] = 24
rcParams["xtick.labelsize"] = 24
rcParams["ytick.labelsize"] = 24

function set_size()
    width_pt = 1.5*468 / 1.5
    inches_per_pt = 1 / 72.27
    golden_ratio = 0.75
    fig_width_in = width_pt * inches_per_pt # Figure width in inches
    fig_height_in = fig_width_in * golden_ratio
    fig_dim = (fig_width_in, fig_height_in)
    return fig_dim
end

function leslie(A, x0, n)
    res = x0
    x   = x0
    for i = 1:n
        x = A*x
        res = [res x]
    end
    return res
end

A = [0 4 3; 0.5 0 0; 0 0.25 0]
x0 = [40, 40, 20]

n = 10
res=leslie(A, x0, n)

lambda = eigvals(A)
eigenv=eigvecs(A)

fig, ax = plt.subplots(1, 1, figsize=set_size())
plt.xlabel("Time (in years)")
plt.ylabel("Population")
line1, = plt.plot(0:n, res[1, :], label="Youth")
line2, = plt.plot(0:n, res[2, :], label="Juvenile")
line3, = plt.plot(0:n, res[3, :], label="Adult")

# Annotate each line at its end point
plt.annotate("Youth",    (n, res[1, end]+230), textcoords="offset points", xytext=(-10,-10), ha="center")
plt.annotate("Juvenile", (n, res[2, end]+300), textcoords="offset points", xytext=(-10,-10), ha="center")
plt.annotate("Adult",    (n, res[3, end]+220), textcoords="offset points", xytext=(-10,-10), ha="center")

# Increase the number of y-ticks
ax.yaxis.set_major_locator(plt.MaxNLocator(6))

ax.set_ylim(bottom=0)
plt.savefig("leslie1.pdf", bbox_inches="tight")

# second plot
# Normalize each column of res
n=20
res = leslie(A, x0, n)
res = res ./ sum(res, dims=1)
fig, ax = plt.subplots(1, 1, figsize=set_size())
plt.xlabel("Time (in years)")
plt.ylabel("Percent of population")
line1, = plt.plot(0:n, res[1, :], label="Youth")
line2, = plt.plot(0:n, res[2, :], label="Juvenile")
line3, = plt.plot(0:n, res[3, :], label="Adult")

# Annotate each line at its end point
plt.annotate("Youth", (n, res[1, end] + 0.1), textcoords="offset points", xytext=(-10, -10), ha="center")
plt.annotate("Juvenile", (n, res[2, end] + 0.1), textcoords="offset points", xytext=(-10, -10), ha="center")
plt.annotate("Adult", (n, res[3, end] + 0.1), textcoords="offset points", xytext=(-10, -10), ha="center")

# Increase the number of y-ticks
ax.yaxis.set_major_locator(plt.MaxNLocator(6))

ax.set_ylim(bottom=0)
plt.savefig("leslie2.pdf", bbox_inches="tight")

