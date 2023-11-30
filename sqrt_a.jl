using Printf
using PrettyTables
using PyPlot
using LaTeXStrings
using Printf
using PyCall

function square_root(a,x0,epsilon)
  xa =   zeros(0)
  append!( xa, x0)
  x = x0 # x is for x_{n+1} in our formula
  n = 0
  while (true) # do the iterations, a loop without knowing the # of iterations
      x = 0.5 * ( x + a/x )
      append!( xa, x)
      n = n + 1
      if (abs(x*x-a) < epsilon) break end 
  end # if x is accurate enough, stop end
  return (xa,n) 
end

a       = 2
epsilon = 1e-12
x0      = 12

# get the square root of a 
xn, n = square_root(a,x0,epsilon)

data = zeros(length(xn),4)

for i=1:size(data,1)
  x = xn[i]
  e1 = x-sqrt(a)
  e2 = e1/sqrt(a)
  data[i,1] = i-1
  data[i,2] = x
  data[i,3] = e1
  data[i,4] = e2
end

pretty_table(data, backend = Val(:latex), header= ["n", "x", "e1", "e2"], formatters = ft_printf("%5.10f",2:4))


