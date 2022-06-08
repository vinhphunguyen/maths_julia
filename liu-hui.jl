using PrettyTables
using Plots
using LaTeXStrings

function liu_hui()
  M = 1.0
  N = 6

  print("Enter the number of iterations: ")
  iter_count = parse(Int32, readline())

  data = zeros(iter_count,2)


  for i=1:iter_count
     m   = sqrt(M^2/4 + ( 1-sqrt(1-M^2/4) )^2) 
     An  = 0.5 * N * M
     A2n =       N * m

     data[i,1] = A2n
     data[i,2] = 2*A2n-An

     M = m
     N = 2*N
  end
  println(N)
  pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
  pretty_table(data, ["n", "S1"], backend = :latex,formatters = ft_printf("%5.12f",[1,2]))
end 

liu_hui()
