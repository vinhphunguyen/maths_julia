using Printf
using PrettyTables
using PyPlot
using LaTeXStrings
using Printf
using PyCall

# Conda.add("nomkl")
# Conda.rm("mkl")
# pyimport_conda("mkl", "mkl")


function fx(x) 
  x^2 - 2
end

function fxp(x) 
  -sin(x) - 1
end

function newton_raphson(f,x0,epsilon)
  x  = x0
  i  = 0
  xa =   zeros(0)
  ya =   zeros(0)

  append!( xa, x0)
  append!( ya, 0.)

  append!( xa, x0)
  append!( ya, f(x0))

   while ( true )

     i += 1
     derx = (f(x0+1e-5)-f(x0-1e-5)) / (2e-5) 
     x    = x0 - f(x0)/derx

    append!( xa, x)
    append!( ya, 0.)

    append!( xa, x)
    append!( ya, f(x))

     @printf "%i %s %0.8f\n" i  " iteration," x 

     if ( abs(x-x0) < epsilon ) break end

     x0   = x
   end

   return (xa,ya)
end

xa,ya = newton_raphson(x->x^2-2,3.0,1e-6)



ta      = -1.0:0.01:4
curve   = zeros(length(ta))


for i=1:length(ta)
  t         = ta[i]
  curve[i]  = fx(t)
end

plt = pyimport("matplotlib.pyplot")

fig = plt.figure(figsize=(6,6))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.5))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")
#plt.axis("off")

plt.plot(ta,curve,color="red",linewidth=2)
plt.plot(xa,ya,"b--",linewidth=1)
plt.plot(xa[1:2:end],zeros(length(xa[1:2:end])),"*")
plt.savefig("plot-NR1.pdf",bbox_inches="tight")
#tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
#labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
#plt.xticks(tick_pos, labels)
#plt.yticks(-1:0.5:1)
#savefig("plot-NR.pdf")

# integral of y=x^2, x^3, x^4 from 0 to 1
# using Simpson quadrature
# data = zeros(4,4)
# for i=1:size(data,1)
#   h  = 1/2^(i+1)
#   f1 = (fx(h)-fx(0.))/h
#   f2 = (fx(0)-fx(-h))/h
#   f3 = (fx(h)-fx(-h))/(2*h)
#   data[i,1] = h
# end

#pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
#
# x=-pi:0.02:pi
# f=zeros(length(x))
# for i=1:length(x)
# f[i]=sin(x[i]) + cos(x[i])
# end

# pyplot()
# p1=plot(x,f,legend=false,xlabel=L"x",ylabel=L"\sin x+ \cos x",size=(350,250))
# savefig(p1,"plot-sinx-p-cosx.pdf")


