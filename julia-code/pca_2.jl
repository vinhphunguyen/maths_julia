using MultivariateStats, Plots, Distributions, PyCall, Statistics

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

#------------------------------------
function set_size()
    width_pt = 468 / 1.5
    inches_per_pt = 1 / 72.27
    golden_ratio = 0.75
    fig_width_in = width_pt * inches_per_pt # Figure width in inches
    fig_height_in = fig_width_in * golden_ratio
    fig_dim = (fig_width_in, fig_height_in)
    return fig_dim
end
#------------------------------------

function manualPCA(xo)
    xs = xo[1, :]
    ys = xo[2, :]
    xs_centered = xs .- mean(xs)
    ys_centered = ys .- mean(ys)
    x        = hcat(xs_centered, ys_centered)
    x = x'
    covMat   = cov(x')
    ev       = eigvals(covMat)
    eigOrder = sortperm(eigvals(covMat), rev=true)
    vecs     = eigvecs(covMat)[:, eigOrder]
    return  (ev, vecs, x)
end

#-------------------------------------

meanVect = [20, 20]
covMat   = [1 .8; .8 1]
biNorm   = MvNormal(meanVect, covMat)
N        = 10^3
points   = rand(MvNormal(meanVect, covMat), N)

#fig, ax = plt.subplots(1, 1, figsize=set_size())
#plt.scatter(points[1,:], points[2,:], color="blue", marker="o", s=5)
#plt.savefig("pca.pdf", bbox_inches="tight")

#---------------------------------------

ev, vecs, pts = manualPCA(points)

u1 = 3*vecs[:, 1]
u2 = vecs[:, 2]

trans_pts1 = vecs[:,1]' * points
trans_pts2 = vecs[:,2]' * points

fig, (ax) = plt.subplots(1, figsize=set_size())
plt.gca().set_aspect("equal")
#ax.scatter(pts[1, :], pts[2, :], color="orange", marker="o", s=1)
#ax.plot([-u1[1], u1[1]], [-u1[2], u1[2]], color="red")
#ax.plot([-u2[1], u2[1]], [-u2[2], u2[2]], color="purple")
ax.scatter(trans_pts1, trans_pts2, color="orange", marker="o", s=1)
plt.savefig("pca2.pdf", bbox_inches="tight")