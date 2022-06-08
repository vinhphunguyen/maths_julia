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
  x*cos(x)-sin(x)
end

function fxp(x) 
  -x * sin(x)
end

function newton_raphson(f,fp,x0,epsilon,iter_max)
  x  = x0
  i  = 0

   while ( true ) & ( i < iter_max )
     i    += 1
     derx = fp(x0)
     x    = x0 - f(x0)/derx

     @printf "%i %s %0.8f\n" i  " iteration," x 

     if ( abs(x-x0) < epsilon ) break end

     x0   = x
   end

   return x
end

x0a = [0.1 3*pi/2 5*pi/2 7*pi/2]
epsilon = 1e-6

data = zeros(4,2)


for i=1:length(x0a)
 x0 = x0a[i] - 0.2
 x  = newton_raphson(fx,fxp,x0,epsilon,100)
 data[i,1] = i
 data[i,2] = x
end


pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["n", "S1"], backend = :latex,formatters = ft_printf("%5.8f",[2]))


