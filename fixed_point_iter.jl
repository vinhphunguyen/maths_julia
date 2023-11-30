using PrettyTables
using Plots
using LaTeXStrings
using Printf
using PyCall

# tutorial implementation of the fixed point iteration method
# with plottiing the cobweb
# and table showing the convergence data
# Aitken extrapolation also coded.

mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")
#sns = pyimport("seaborn")

#sns.set_style("ticks") # dark_background,

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 16
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 16
rcParams["legend.fontsize"] = 16
rcParams["xtick.labelsize"] = 16
rcParams["ytick.labelsize"] = 16

# function y=2.8x(1-x)
function fx(x)
  2.8*x*(1-x)
end

# fixed point iteration method with plot the cobweb
function fixed_point_iter(f,x0,epsilon,maxIter,ta,filename)
  x  = x0
  i  = 0
  xa =   zeros(0)
  ya =   zeros(0)
  while ( true )
     i += 1
     x  = f(x0)
     append!( xa, x0)
     append!( xa, x0)
     append!( xa, x )
     append!( ya, x0)
     append!( ya, x )
     append!( ya, x )
     @printf "%i %s %0.12f\n" i  " iteration," x
     if ( ( abs(x-x0) < epsilon ) | ( i > maxIter) ) break end # if iterates are close, stop
     x0   = x
   end
   # now, do the plotting
   line     = zeros(length(ta))
   curve    = zeros(length(ta))
   for i=1:length(ta)
     t        = ta[i]
     line[i]  = t
     curve[i] = f(t)
   end

   fig = plt.figure(figsize=(6,6))
   ax = fig.add_subplot(1, 1, 1)

   #spine placement data centered
   #ax.spines["left"].set_position(("data", 0.5))
   #ax.spines["bottom"].set_position(("data", 0.0))
   ax.spines["right"].set_color("none")
   ax.spines["top"].set_color("none")
   plt.axis("on")
   #plt.axis("off")
   plt.grid(true)

   plt.plot(ta,line,color="red")        # line y=x
   plt.plot(ta,curve,color="black")     # function fx
   plt.plot(xa,ya,color="blue",linewidth=0.8)         #
   #tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
   #labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
   #plt.xticks(tick_pos, labels)
   #plt.yticks(-1:0.5:1)
   plt.savefig(filename,bbox_inches="tight")
end

function fixed_point_iter_convergence(f,x0,epsilon,maxIter,alpha)
  x  = x0
  i  = 0
  xa =  zeros(0)
  xs = zeros(0)
  append!( xa, abs(alpha-x0))
  append!( xs, x0)
  while ( true )
     i += 1
     x  = f(x0)
     append!( xa, abs(alpha-x))
     append!( xs, x)
     @printf "%i %s %0.12f\n" i  " iteration," x
     if ( ( abs(x-x0) < epsilon ) | ( i > maxIter) ) break end # if iterates are close, stop
     x0 = x
   end
   return xa,xs
end

# call the function for the function fx defined above
fixed_point_iter(fx,0.1,1e-12,100,0.6:0.01:.7,"plot-fixed-point-iterations-nice-zoom.pdf")


#fixed_point_iter(x->1+0.5*sin(x),0.,1e-12,100,0:0.1:3,"plot-fixed-point-iterations-f1.pdf")
#fixed_point_iter(x->3+2.0*sin(x),0.,1e-12,20,0:0.1:5,"plot-fixed-point-iterations-f2.pdf")

#xa,xs=fixed_point_iter_convergence(x->1+0.5*sin(x),0.,1e-7,100,1.498701133518)

#iterCount = length(xs)

# data = zeros(iterCount,5)
# data[:,1] = 0:iterCount-1
# data[:,2] = xs
# data[:,3] = xa
#
# for i=2:iterCount
#   data[i,4] = data[i,3] / data[i-1,3]
# end
#
# for i=3:iterCount
#   data[i,5] = (data[i,2] - data[i-1,2]) / (data[i-1,2] - data[i-2,2])
# end
#
# pretty_table(data, ["n", "x", "alpha-xn", "rn","xx"],formatters = ft_printf("%5.8f"))
# pretty_table(data, ["n", "x", "alpha-xn", "rn","xx"], backend = :latex,formatters = ft_printf("%5.13f"))

# Aitken extrapolation checking

# data = zeros(iterCount,4)
# data[:,1] = 0:iterCount-1
# data[:,2] = xs
# data[:,3] = xa
#
#
# for i=3:iterCount
#   λ = (data[i,2] - data[i-1,2]) / (data[i-1,2] - data[i-2,2])
#   data[i,4]=(λ/(1-λ))*(data[i,2] - data[i-1,2])
# end
#
# pretty_table(data, ["n", "x", "alpha-xn", "rn"],formatters = ft_printf("%5.8f"))
# pretty_table(data, ["n", "x", "alpha-xn", "rn"], backend = :latex,formatters = ft_printf("%5.13f"))

function fixed_point_iter_aitken_convergence(f,x0,epsilon,maxIter,alpha)
  i  = 0                                 # iteration index
  xa =  zeros(0)
  xs = zeros(0)
  append!( xa, abs(alpha-x0))
  append!( xs, x0)
  while ( true )
     i    += 1
     x1    = f(x0)
     x2    = f(x1)
     if ( abs(x1-x0) > 1e-12 )
       λ     = (x2-x1)/(x1-x0)
     else
       λ = 0.
     end
     x2hat = x2 + λ*(x2-x1)/(1.0-λ)
     @printf "%i %s %0.12f %0.12f %0.12f  %0.12f \n" i  " iteration," x1 x2 λ/(1-λ) x2hat

     if ( ( abs(x2-x2hat) < epsilon ) | ( i > maxIter) )
        append!( xa, abs(alpha-x2hat))
        append!( xs, x2hat)
        break
      end # if iterates are close, stop
      x0 = x2

   end
   return xa,xs
end

xa,xs=fixed_point_iter_aitken_convergence(x->2.8*x-2.8*x^2,0.15,1e-7,100,0.6428571428571429)

iterCount = length(xs)

data = zeros(iterCount,3)
data[:,1] = 0:iterCount-1
data[:,2] = xs
data[:,3] = xa


#pretty_table(data, ["n", "x", "alpha-xn"],formatters = ft_printf("%5.8f"))
pretty_table(data, header=["n", "x", "alpha-xn"], backend = Val(:latex),formatters = ft_printf("%5.13f"))

