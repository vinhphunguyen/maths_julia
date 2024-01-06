using Plots
using PrettyTables
using LaTeXStrings
using Printf
using LinearAlgebra
using PyCall
using PyPlot

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

function my_func(x,y)
    return (0.75*x-1.5)^2 + (y-2.0)^2 + 0.25*x*y
end

function func_grad(x,y)
    dfdx = 1.125*x - 2.25 + 0.25*y
    dfdy = 2.0*y - 4.0 + 0.25*x
    return [dfdx,dfdy]
end

function gradient_descent1()
	n  = 50
	xs = ys=range(0,stop=5,length=n)
	zs = [ my_func(x,y) for y in ys, x in xs]
	#iterate location
	x0       = [5.,4.]
	num_iter = 10
	sols     = zeros(num_iter,2)
	x        = zeros(2)
	lev      = 0:1:20

	for gamma in [0.01, 0.1, 0.2, 0.3, 0.5, 0.75]
	  sols[1,:] = x0
	  x = x0
	  # actual gradient descent algorithm
	  for i=2:num_iter
	    x = x - gamma * func_grad(x[1],x[2])
	    sols[i,:] = x
	  end
	  #plotting
	  plt.contour(xs,ys,zs,levels=lev)                 # plot the level curves
	  plt.plot(sols[:,1],sols[:,2],"r-")               # plot the line joining the x_k
	  plt.plot(sols[:,1],sols[:,2],"bo")              # plot the dots for x_k
	  grad_norm = norm(func_grad(x[1],x[2]))
	  title =  "gamma $gamma | final grad $grad_norm"
	  plt.title(title)
	  file = "gdm-$gamma.pdf"
	  plt.savefig(file, bbox_inches="tight")
	  plt.clf()
	  plt.cla()
	end
end

function gradient_descent_exact(A,b)
	n  = 100
	xs = ys=range(0,stop=5,length=n)
	zs = [ my_func(x,y) for y in ys, x in xs]
	#iterate location
	x0       = [5.,4.]
	num_iter = 10
	sols     = zeros(num_iter,2)
	x        = zeros(2)
	lev      = 0:1:40

	sols[1,:] = x0
	x = x0
	# actual gradient descent algorithm
	for i=2:num_iter
		∇f = A*x-b
		γ  = ∇f'*∇f/(∇f'*A*∇f)
	    x  = x - γ * ∇f
	    sols[i,:] = x
	end
	#plotting

	fig = plt.figure(figsize=(12,4))
	ax = fig.add_subplot(1, 1, 1)
	plt.contour(xs,ys,zs,levels=lev)             # plot the level curves
	plt.plot(sols[:,1],sols[:,2],"r-")           # plot the line joining the x_k
	plt.plot(sols[:,1],sols[:,2],"bo")           # plot the dots for x_k
	ax.set_aspect("equal")
	plt.xlim([.5,3])
	plt.ylim([.5,3])
	file = "gdm-exact.pdf"
	plt.savefig(file, bbox_inches="tight")
	plt.clf()
	plt.cla()
	return sols
end

function gradient_descent_exact_convergence(A,b,x0,tol)
	x        = x0
	∇f       = A*x-b
	# actual gradient descent algorithm
	while (  norm( ∇f ) > tol )
		γ         = ∇f'*∇f/(∇f'*A*∇f)
	    x         = x - γ * ∇f
		∇f        = A*x-b
	end
	return x
end

A=[9/8 1/4;1/4 2]
b=[9/4,4]
x0=[5,4]
tol=1e-6
x=gradient_descent_exact_convergence(A,b,x0,tol)


x=gradient_descent_exact(A,b)
iter_count = size(x,2)
data       = zeros(iter_count,5)
data[:,2:3]= x'
for i=1:iter_count
  data[i,1]=i
  data[i,4]=norm(A*x[:,i]-b)
  data[i,5]=0.5*x[:,i]'*A*x[:,i]-b'*x[:,i]
end
pretty_table(data, ["k", "x1", "x2", "gradf", "f"],
backend = :latex)
