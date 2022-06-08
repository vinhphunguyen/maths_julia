using PrettyTables
using Plots
using LaTeXStrings


# 
function fibonacci(n)
  if ( n==0 || n==1 )
    return 1.
  else
    return fibonacci(n-2)+fibonacci(n-1)
  end
end

data = zeros(7,3)
terms = [2 3 4 5 6 19 20 21]
for i=1:size(data,1)
  n   = terms[i]
  np1 = i<8 ? terms[i+1] : 22
  S1  = fibonacci(n)
  S2  = fibonacci(np1)
  data[i,1] = n
  data[i,2] = S1
  data[i,3] = S2/S1
end

pretty_table(data, ["n", "Fn", "S"],formatters = ft_printf("%5.8f",[3]))
pretty_table(data, ["n", "Fn", "S"], backend = :latex,formatters = ft_printf("%5.8f",[3]))
fibonacci(22)

# #pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
# pretty_table(data, ["n", "S1"], backend = :latex,formatters = ft_printf("%5.8f",[2]))


