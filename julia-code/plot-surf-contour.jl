using PyPlot
using ColorSchemes
using LinearAlgebra
using3D() # Needed to create a 3D subplot

###################
##  Create Data  ##
###################
n = 300
xs = ys=range(-3.5,stop=3.5,length=n)

# xgrid = repeat(x',n,1)
# ygrid = repeat(y,1,n)

# f(x,y) = x^2 + 2*y^2
# f(x,y) = x^2 + 2*y^2
# f(x,y) = x^2 + 2*y^2
f(x,y) = x^2 + x*y + y^2
zs = [f(x,y) for y in ys, x in xs]

solar = ColorSchemes.hsv.colors

th = Array(0:2*pi/100:2*pi+2*pi/100) # theta from 0 to 2pi ( + a little extra)
X = cos.(th)
Y = sin.(th)

rcParams = PyPlot.PyDict(PyPlot.matplotlib."rcParams")
font0 = Dict(
        "font.size" => 22,
        "axes.labelsize" => 18,
        "xtick.labelsize" => 18,
        "ytick.labelsize" => 18,
        "legend.fontsize" => 18,
)
merge!(rcParams, font0)

# ############
# ##  Plot  ##
# ############
#fig = figure("pyplot_surfaceplot",figsize=(10,10))
#ax = fig.add_subplot(2,1,1,projection="3d")
# plot_surface(xs, ys, zs, rstride=6, cstride=6, alpha=0.8,edgecolors="k",cmap=ColorMap(solar),linewidth=0.25)
# contour3D(xs, ys, zs)
# ax = PyPlot.gca()
# ax.contour(xs, ys, zs,offset=0)#,levels = [0.5,1.0,2.0,4.0])
# xlabel(L"x")
# ylabel(L"y")
# plot(X,Y)
# #fig.colorbar(surf, shrink=0.5, aspect=5)
# tight_layout()
#ax.contour(xs, ys, zs, offset=0)
#zlim(0,1.5)
# PyPlot.title("Surface Plot")
fig = figure(figsize=(8,8))
ax = fig.add_subplot(1, 1, 1)
levels = [1,2,3,4,5,6,7,8,9,10]
cp = contour(xs, ys, zs, colors="black",levels=levels)
ax.clabel(cp, inline=true, fmt = "%2.1f", fontsize=15)
#plot(X,Y)
xlabel(L"x")
ylabel(L"y")
xlim(-2,2)
ylim(-2,2)
#tight_layout()

# subplot(212)
# ax = fig.add_subplot(2,1,2)
# cp = contour(xgrid, ygrid, z, colors="black", linewidth=2.0)
# ax.clabel(cp, inline=5, fontsize=10)
# xlabel("X")
# ylabel("Y")
# PyPlot.title("Contour Plot")
# tight_layout()

# import PyPlot
# xs = ys = range(-1, stop=1, length=100)
# f(x,y) = x^2 + y^2 +x*y - x - y + 1
# zs = [f(x,y) for y in ys, x in xs]
# PyPlot.plot_surface(xs, ys, zs)
# PyPlot.contour3D(xs, ys, zs)
# zlim(0,2)
# ax = PyPlot.gca()
#ax.contour(xs, ys, zs, offset=0)
