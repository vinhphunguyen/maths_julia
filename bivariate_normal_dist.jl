using Distributions
using Plots
using PyCall
using ColorSchemes

mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")
sns = pyimport("seaborn")

#sns.set_style("ticks") # dark_background,
sns.set_style("white")

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 16
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 16
rcParams["legend.fontsize"] = 16
rcParams["xtick.labelsize"] = 16
rcParams["ytick.labelsize"] = 16

μ = [0, 0]
Σ = [1  0.9;
     0.9 10]
p = MvNormal(μ, Σ)

X = range(-8, 8, length=100)
Y = range(-8, 8, length=100)
Z = [pdf(p, [x,y]) for y in Y, x in X] # Note x-y "for" ordering

fig = plt.figure(figsize=(6,6))
ax = fig.add_subplot(1, 1, 1)

ax.contourf(X, Y, Z)#, color=plt.cm.YlGnBu)
plt.savefig("bivariate-contour.pdf",bbox_inches="tight")
