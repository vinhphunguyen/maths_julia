using PrettyTables
using Plots
using LaTeXStrings
using PyCall
using SymPy
using BenchmarkTools # @btime function()
using SpecialFunctions

mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")
sns = pyimport("seaborn")
tools=pyimport("mpl_toolkits.axes_grid.inset_locator")

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

# ith Lagrange basis, i =1,2,3,...
function lagrange_basis_i(i,data_x,x)
  li = 1.0
  xi = data_x[i]
  for j=1:length(data_x)
    if j != i 
      xj = data_x[j]
      li *= (x-xj)/(xi-xj)
    end
  end
  return li
end

function lagrange_interpolation(data_x,data_y,x)
  fx = 0.
  for i=1:length(data_x)
    li  = lagrange_basis_i(i,data_x,x)
    fx += li * data_y[i]
  end
  return fx
end

function get_lambda(data_x)
  n = length(data_x)
  λ = ones(n)
  for i = 1:n
    xi = data_x[i]
    for j = 1:n
      if j != i 
        λ[i] *= xi - data_x[j]
      end 
    end 
    λ[i] = 1 / λ[i]
  end

  return λ
end

function lagrange_interpolation_improved(data_x,data_y,λ,x)
  n = length(data_x)
  ψ = 1.
  for i = 1:n
    xi = data_x[i]
    ψ *= x - xi
  end

  fx = 0.
  for i=1:n
    fx += λ[i] * data_y[i] / ( x - data_x[i])
  end
  return fx * ψ
end

function lagrange_interpolation_barycentric(data_x,data_y,λ,x)
  n = length(data_x)
  fx = 0.
  ws = 0.
  for i=1:n
    wi  = λ[i] / ( x - data_x[i])
    fx += wi * data_y[i] 
    ws += wi
  end
  return fx / ws
end


function plot_lagrange_interpolation()
  # data points

  data_x=[0 1 2 3 4 5 6]
  data_y=[0 0.8415 0.9093 0.1411 -0.7568 -0.9589 -0.2794]

  # points where Lagrange interpolating function is drawn
  ta    = 0:0.1:6
  func  = zeros(length(ta))

  for i=1:length(ta)
    func[i] =   lagrange_interpolation(data_x,data_y,ta[i]) 
  end

  fig = plt.figure(figsize=(8,5))
  ax = fig.add_subplot(1, 1, 1)
  plt.plot(data_x,data_y,"o",color="red")
  plt.plot(ta,func,color="blue")
  # tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
  # labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
  # plt.xticks(tick_pos, labels)
  # plt.yticks(-1:0.5:1)
  #plt.legend(loc="upper right")
  plt.savefig("plot-lagrange-interpolation1.pdf",bbox_inches="tight")
end

###################################################################
## RUNGE PHENOMENON
###################################################################

function Runge(x) 
 return 1 / ( 1 + 25 * x * x)
end

function show_Runge_phenomenon()
  xa         = -1:0.01:1
  runge      = zeros(length(xa))
  lagrange5  = zeros(length(xa))
  lagrange9  = zeros(length(xa))

  for i=1:length(xa)
    runge[i] =   Runge(xa[i]) 
  end

  data_x5  = zeros(6)
  data_y5  = zeros(6)
  data_x10 = zeros(10)
  data_y10 = zeros(10)

  # 6 samplinh points
  for i=1:6
    x          = 2*(i-1)/5 - 1
    data_x5[i] = x
    data_y5[i] = Runge(x)
  end

  # 10 samplinh points
  for i=1:10
    x          = 2*(i-1)/9 - 1
    data_x10[i] = x
    data_y10[i] = Runge(x)
  end

  for i=1:length(xa)
    lagrange5[i] =   lagrange_interpolation(data_x5,data_y5,xa[i]) 
    lagrange9[i] =   lagrange_interpolation(data_x10,data_y10,xa[i]) 
  end


  fig = plt.figure(figsize=(8,5))
  ax = fig.add_subplot(1, 1, 1)
  plt.plot(data_x5,data_y5,"o",color="red")
  plt.plot(xa,runge,color="red",label=L"$1/(1+25x^2)$")
  plt.plot(xa,lagrange5,color="blue",label="5th Lagrange")
  plt.plot(xa,lagrange9,color="black",label="9th Lagrange")
  # tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
  # labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
  # plt.xticks(tick_pos, labels)
  # plt.yticks(-1:0.5:1)
  plt.legend(loc="upper right")
  plt.savefig("plot-runge.pdf",bbox_inches="tight")
end

###################################################################
## EXACTNESS FOR POLYNOMIALS
###################################################################

function quartic(x) 
 return x^4/4-2*x^3+(11/2)*x^2-6x
end

xa         = 0:0.05:4
func       = zeros(length(xa))
lagrange   = zeros(length(xa))

for i=1:length(xa)
  func[i] =   quartic(xa[i]) 
end

data_x5 = zeros(5)
data_y5 = zeros(5)


for i=1:5
  x          = 0 + 4*(i-1)/4 
  data_x5[i] = x
  data_y5[i] = quartic(x)
end


for i=1:length(xa)
  lagrange[i] =   lagrange_interpolation(data_x5,data_y5,xa[i]) 
end


fig = plt.figure(figsize=(8,5))
ax = fig.add_subplot(1, 1, 1)
plt.plot(data_x5,data_y5,"o",color="red")
plt.plot(xa,func,"ro",label=L"f(x)")
plt.plot(xa,lagrange,color="blue",label="4th Lagrange")
# tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
# labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
# plt.xticks(tick_pos, labels)
# plt.yticks(-1:0.5:1)
plt.legend(loc="upper right")
plt.savefig("plot-lagrange-exact.pdf",bbox_inches="tight")


##
## 
## 



# data points

data_x=[-sqrt(3/5) 0 sqrt(3/5)]
weight = zeros(3)

for i=1:length(data_x)
    weight[i]  = lagrange_basis_i(i,data_x,data_x[i])
end

##

function lagrange_basis(nodes,x) # l_i(x) 
    ls = ones(length(nodes))
    for i=1:length(nodes)
      xi = nodes[i]
      li = ls[i]
      for j=1:length(nodes)
        if j != i
        xj = nodes[j]
        li *= (x-xj)/(xi-xj)
        end 
      end
      ls[i] = li
    end
    return ls 
end

function chebyshev_polynomials(n,x)
  if n == 0 return 1. end
  if n == 1 return x end
  
  return 2*x*chebyshev_polynomials(n-1,x)-chebyshev_polynomials(n-2,x)
end

function plot_chebyshev()
  fig , ax = plt.subplots(1, 1, figsize=set_size())
  #ax.spines["right"].set_visible(false)
  #ax.spines["top"].set_visible(false)
  ax.xaxis.set_ticks_position("bottom")
  xgrid=-1:0.01:1.0
  n=5
  basis=zeros(n,length(xgrid))

  for (j,x) in enumerate(xgrid)
    for i = 0:n-1 
      basis[i+1,j] = chebyshev_polynomials(i,x)
    end
  end

  plt.plot(xgrid,basis[1,:],color="black","-",linewidth=1.,label=L"$T_0$")
  plt.plot(xgrid,basis[2,:],color="red","-",linewidth=1.,label=L"$T_1$")
  plt.plot(xgrid,basis[3,:],color="blue","-",linewidth=1.,label=L"$T_3$")
  plt.plot(xgrid,basis[4,:],color="cyan","-",linewidth=1.,label=L"$T_4$")
  plt.plot(xgrid,basis[5,:],color="orange","-",linewidth=1.,label=L"$T_5$")

  #plt.legend()
  plt.legend(loc="upper left", ncol=5, fontsize=6)
  plt.grid(true)
  
   # legend([l1,l2], ["b","c"], loc=1)
  plt.savefig("chebyshev1.pdf",bbox_inches="tight")
end

plot_chebyshev()

function plot_chebyshev_points()
  fig , ax = plt.subplots(1, 1, figsize=set_size())
  #ax.spines["right"].set_visible(false)
  #ax.spines["top"].set_visible(false)
  ax.xaxis.set_ticks_position("bottom")
  xgrid=-1:0.01:1.0

  circle = [sqrt(1-x^2) for x in xgrid]

  n = 16;
  theta = [(pi/n)*(k+1/2) for k in 0:n-1]


  plt.plot(xgrid,circle,color="black","-",linewidth=1.)
  plt.plot(cos.(theta),sin.(theta),color="black","o",linewidth=1.)
  plt.plot(cos.(theta),zeros(length(theta)),color="red","o",linewidth=1.,label=L"x_k")
  #for i=1:n
      plt.vlines( cos.(theta),0,sin.(theta), linewidth=0.3,color="black" )
  #end
  ax.set_aspect("equal", "box")
  plt.ylim(bottom=-0.1)
  plt.legend()
  
   # legend([l1,l2], ["b","c"], loc=1)
  plt.savefig("chebyshev_nodes_circle.pdf",bbox_inches="tight")
end

#plot_chebyshev_points()

function dd()
  fig , ax = plt.subplots(1, 1, figsize=set_size())
  #ax.spines["right"].set_visible(false)
  #ax.spines["top"].set_visible(false)
  ax.xaxis.set_ticks_position("bottom")
  xgrid=-1:0.01:1.0
  nodes=[-1. 0.1 1.]
  yh=[lagrange_basis(nodes,x) for x in xgrid]
  Ns = reduce(hcat,yh)'
  plt.plot(xgrid,Ns[:,1],color="black","-",linewidth=1.,label=L"$l_0$")
  plt.plot(xgrid,Ns[:,2],color="red","-",linewidth=1.,label=L"$l_1$")
  plt.plot(xgrid,Ns[:,3],color="black","-",linewidth=1.,label=L"$l_2$")

  plt.legend()
  
   # legend([l1,l2], ["b","c"], loc=1)
  plt.savefig("lagrange_quadratic.pdf",bbox_inches="tight")
end

function plot_symbol_objs()
@vars x

f = 1 / ( 1 + 25 * x * x)
f2  = diff(f,x,2)
f5  = diff(f,x,6)

  fig , ax = plt.subplots(1, 1, figsize=set_size())
  #ax.spines["right"].set_visible(false)
  #ax.spines["top"].set_visible(false)
  ax.xaxis.set_ticks_position("bottom")
  xgrid=-1:0.01:1.0
  nodes=[-1. 0.1 1.]
  yh2=[f2.subs(x,xi) for xi in xgrid]
  yh5=[f5.subs(x,xi) for xi in xgrid]
  #plt.plot(xgrid,yh,color="black","-",linewidth=1.,label=L"$l_0$")
  plt.plot(xgrid,yh5,color="black","-",linewidth=1.,label="6th derivative")

  plt.legend()
  
   # legend([l1,l2], ["b","c"], loc=1)
  plt.savefig("runge_derivative6.pdf",bbox_inches="tight")

end

#plot_symbol_objs()

function show_Runge_phenomenon_Chebyshev_nodes()
  xa         = -1:0.01:1
  runge      = zeros(length(xa))
  lagrange5  = zeros(length(xa))
  lagrange9  = zeros(length(xa))

  for i=1:length(xa)
    runge[i] =   Runge(xa[i]) 
  end

  data_x5  = zeros(10)
  data_y5  = zeros(10)
  data_x10 = zeros(20)
  data_y10 = zeros(20)

  # 6 sampling points
  for i=1:10
    n = 10
    x          = cos((pi/n)*(i-1/2))
    data_x5[i] = x
    data_y5[i] = Runge(x)
  end

  # 10 sampling points
  for i=1:20
    n= 20
    x          = cos((pi/n)*(i-1/2))
    data_x10[i] = x
    data_y10[i] = Runge(x)
  end

  for i=1:length(xa)
    lagrange5[i] =   lagrange_interpolation(data_x5,data_y5,xa[i]) 
    lagrange9[i] =   lagrange_interpolation(data_x10,data_y10,xa[i]) 
  end


  fig = plt.figure(figsize=(8,5))
  ax = fig.add_subplot(1, 1, 1)
  plt.plot(data_x5,data_y5,"o",color="red")
  plt.plot(xa,runge,color="red",label=L"$1/(1+25x^2)$")
  plt.plot(xa,lagrange5,color="blue",label="9th Lagrange")
  plt.plot(xa,lagrange9,color="black",label="19th Lagrange")
  # tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
  # labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
  # plt.xticks(tick_pos, labels)
  # plt.yticks(-1:0.5:1)
  plt.legend(loc="upper right")
  plt.savefig("plot-runge-chebyshev.pdf",bbox_inches="tight")
end
 
#show_Runge_phenomenon_Chebyshev_nodes()

function ff1(pcount)
  ydata = rand(pcount)
  n     = length(ydata)
  xdata = [ cos((pi/n)*(i-1/2)) for i in 1:n]
  lag   = zeros(pcount)

  xgrid = -1:0.01:1
  for i=1:pcount
    lag[i] =   lagrange_interpolation(xdata,ydata,xgrid[i]) 
  end
end

function ff2(pcount)
  ydata = 1 .- 2 .*rand(pcount)
  n     = length(ydata)
  xdata = [ cos((pi/n)*(i-1/2)) for i in 1:n]

  xgrid = -1:0.001:1
  lag   = zeros(length(xgrid))
  λ     = get_lambda(xdata)
  for i=1:length(xgrid)
    lag[i] =   lagrange_interpolation_improved(xdata,ydata,λ,xgrid[i]) 
  end

  # fig = plt.figure(figsize=set_size())
  # ax = fig.add_subplot(1, 1, 1)
  # plt.plot(xgrid,lag,"-",color="blue",linewidth=0.9)
  # plt.plot(xdata,ydata,color="red","o",markersize=1.2)
  # # tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
  # # labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
  # # plt.xticks(tick_pos, labels)
  # # plt.yticks(-1:0.5:1)
  # plt.savefig("plot-lagrange-random.pdf",bbox_inches="tight")
end

function ff3(pcount)
  ydata = 1 .- 2 .*rand(pcount)
  n     = length(ydata)
  xdata = [ cos((pi/n)*(i-1/2)) for i in 1:n]

  xgrid = -1:0.001:1
  lag   = zeros(length(xgrid))
  λ     = get_lambda(xdata)
  for i=1:length(xgrid)
    lag[i] =   lagrange_interpolation_barycentric(xdata,ydata,λ,xgrid[i]) 
  end

  # fig = plt.figure(figsize=set_size())
  # ax = fig.add_subplot(1, 1, 1)
  # plt.plot(xgrid,lag,"-",color="blue",linewidth=0.9)
  # plt.plot(xdata,ydata,color="red","o",markersize=1.2)
  # # tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
  # # labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
  # # plt.xticks(tick_pos, labels)
  # # plt.yticks(-1:0.5:1)
  # plt.savefig("plot-lagrange-random.pdf",bbox_inches="tight")
end

function factorial_interpolation()
  xdata = 1:4
  ydata = map(factorial,xdata)


  xgrid = 1:0.01:4
  lag   = zeros(length(xgrid))
  λ     = get_lambda(xdata)
  for i=1:length(xgrid)
    lag[i] =   lagrange_interpolation_barycentric(xdata,ydata,λ,xgrid[i]) 
  end

  fig = plt.figure(figsize=set_size())
  ax = fig.add_subplot(1, 1, 1)
  plt.plot(xgrid,lag,"-",color="blue",linewidth=0.9)
  plt.plot(xdata,ydata,color="red","o")#,markersize=1.2)
  # tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
  # labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
  # plt.xticks(tick_pos, labels)
  # plt.yticks(-1:0.5:1)
  plt.savefig("plot-factorial-interpolation.pdf",bbox_inches="tight")
end

function plot_gamma()
  xgrid = 0:0.01:4

  fig = plt.figure(figsize=set_size())
  ax = fig.add_subplot(1, 1, 1)
  plt.plot(xgrid,map(gamma,xgrid),"-",color="blue",linewidth=1.2)
  # tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
  # labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
  # plt.xticks(tick_pos, labels)
  # plt.yticks(-1:0.5:1)
  plt.savefig("plot-gamma.pdf",bbox_inches="tight")
end