using PrettyTables
using Plots
using LaTeXStrings






function buffon_needle(t,l,n)
  cut = 0
  for i=1:n
    d     = rand()
    theta = 0.5*pi*rand()
    if ( 0.5*l*sin(theta) >= d ) cut += 1 end
  end
  return (2*l/t)*(n/cut) # this is pi
end

t = 2.0
l = 1.0
data = zeros(10,2)
data[:,1] = [500 3408 5000 6000 8000 10000 12000 14000 15000 20000] 

for i=1:size(data,1)
  data[i,2] = buffon_needle(t,l,data[i,1])
end

pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["n", "S1"], backend = :latex,formatters = ft_printf("%5.8f",[2]))

##
## { item_description }
##

x0 = 2.
data = zeros(6,3)
data[:,1] = [0.1 0.01 0.001 0.0001 0.00001 0.000001] 

for i=1:size(data,1)
  h         = data[i,1] 
  data[i,2] = ((x0+h)^2-x0^2)/h
  h *= -1
  data[i,3] = ((x0+h)^2-x0^2)/h
end

pretty_table(data, ["n", "S1", "S2"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["n", "S1", "S2"], backend = :latex,formatters = ft_printf("%5.12f",2:3))

