using PrettyTables
using Plots
using LaTeXStrings



function fx(x) 
  sin(x)+cos(x)
end

function der_fx(x) 
  cos(x)-sin(x)
end


# integral of y=x^2, x^3, x^4 from 0 to 1
# using Simpson quadrature
data = zeros(4,4)
for i=1:size(data,1)
  h  = 1/2^(i+1)
  f1 = (fx(h)-fx(0.))/h
  f2 = (fx(0)-fx(-h))/h
  f3 = (fx(h)-fx(-h))/(2*h)
  data[i,1] = h
  data[i,2] = abs(f1-der_fx(0))
  data[i,3] = abs(f2-der_fx(0))
  data[i,4] = abs(f3-der_fx(0))
end

#pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["Deltax", "f1", "f2", "f3"], backend = :latex,formatters = ft_printf("%3.4f"))

x=-pi:0.02:pi
f=zeros(length(x))
for i=1:length(x)
f[i]=sin(x[i]) + cos(x[i])
end

pyplot()
p1=plot(x,f,legend=false,xlabel=L"x",ylabel=L"\sin x+ \cos x",size=(350,250))
savefig(p1,"plot-sinx-p-cosx.pdf")


