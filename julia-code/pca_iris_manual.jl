using Statistics, RDatasets, LinearAlgebra, Plots, Distributions, PyCall, Statistics

mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")
cm  = pyimport("matplotlib.cm")
sns = pyimport("seaborn")

sns.set_style("ticks") # dark_background,

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 13
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 13
rcParams["legend.fontsize"] = 13
rcParams["xtick.labelsize"] = 13
rcParams["ytick.labelsize"] = 13


function set_size(scale=1)
	width_pt = 468.
	inches_per_pt = 1 / 72.27
	golden_ratio = 0.57
	fig_width_in  = scale * width_pt * inches_per_pt # Figure width in inches
	fig_height_in = fig_width_in * golden_ratio
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end


data = dataset("datasets","iris")

data = data[:,[:SepalLength, :SepalWidth, :PetalLength, :PetalWidth]]

x    = Matrix(data)'

function manualPCA(x)
    covMat = cov(x')
    ev     = eigvals(covMat)
    eigOrder = sortperm(eigvals(covMat),rev=true)
    vecs      = eigvecs(covMat)[:,eigOrder]
    return (ev,vecs)
end

# ev,vecs = manualPCA(x)
#
# pcPts = vecs[:,1:2]'*x
#
# p2=scatter(pcPts[1,:], pcPts[2,:],c=:blue)
# plot(p2,size=(800,400))
outer(v, w) = [x * y for x in v, y in w]

w = 300
image = outer([1; 0.4; rand(50)], rand(w));
noisy_image = image .+ 0.03 .* randn.();

xs = noisy_image[1,:]
ys = noisy_image[2,:]


xs_centered = xs .- mean(xs)
ys_centered = ys .- mean(ys)

x  = [xs_centered ys_centered]'


fig , (ax1,ax2) = plt.subplots(2, figsize=set_size())
ax1.scatter(xs,ys)
ax2.scatter(xs_centered,ys_centered)
ax1.grid()
ax2.grid()
plt.savefig("pca1.pdf")

ev,vecs = manualPCA(x)

u1=vecs[:,1]
u2=vecs[:,2]

fig , (ax1,ax2) = plt.subplots(2, figsize=set_size())
#ax1.scatter(xs_centered,ys_centered)
ax1.plot([0 u1[1]],[0 u1[2]],color="red")
ax1.plot([0 u2[1]],[0 u2[2]],color="red")
ax1.grid()
ax2.grid()
plt.savefig("pca2.pdf")
