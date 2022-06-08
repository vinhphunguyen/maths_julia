using PrettyTables
using Plots
using LaTeXStrings
using Printf
using PyCall

function fx(x) 
  2.8*x*(1-x)
end



function fixed_point_iter(f,x0,epsilon)
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

     if ( abs(x-x0) < epsilon ) break end

     x0   = x
   end
   return xa,ya
end


xa,ya=fixed_point_iter(fx,0.5,1e-12)

plt = pyimport("matplotlib.pyplot")

ta    = 0.5:0.01:0.8
line    = zeros(length(ta))
curve    = zeros(length(ta))


for i=1:length(ta)
  t     = ta[i]
  line[i] = t
  curve[i] =  2.8*t*(1-t)
end

fig = plt.figure(figsize=(6,6))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.5))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")
plt.axis("off")

plt.plot(ta,line,color="red")
plt.plot(ta,curve,color="black")
plt.plot(xa,ya,color="blue")
#tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
#labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
#plt.xticks(tick_pos, labels)
#plt.yticks(-1:0.5:1)
plt.savefig("plot-fixed-point-iterations-nice-zoom.pdf",bbox_inches="tight")

# integral of y=x^2, x^3, x^4 from 0 to 1
# # using Simpson quadrature
# data = zeros(4,4)
# for i=1:size(data,1)
#   h  = 1/2^(i+1)
#   f1 = (fx(h)-fx(0.))/h
#   f2 = (fx(0)-fx(-h))/h
#   f3 = (fx(h)-fx(-h))/(2*h)
#   data[i,1] = h
# end

# #pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
# pretty_table(data, ["Deltax", "f1", "f2", "f3"], backend = :latex,formatters = ft_printf("%3.4f"))

# x=-pi:0.02:pi
# f=zeros(length(x))
# for i=1:length(x)
# f[i]=sin(x[i]) + cos(x[i])
# end

# pyplot()
# p1=plot(x,f,legend=false,xlabel=L"x",ylabel=L"\sin x+ \cos x",size=(350,250))
# savefig(p1,"plot-sinx-p-cosx.pdf")


