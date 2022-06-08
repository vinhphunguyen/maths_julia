using PrettyTables
using Plots
using LaTeXStrings

# check if a given integer n is a factorion
# version 1, using the digits function of Julia 
# to get the digits of n
function is_factorion_version1(n)
  s = 0
  digits_n = digits(n)
  for i=1:length(digits_n)
    s += factorial(big(digits_n[i]))
  end
  return ( s == n ) 
end


# check if a given integer n is a factorion
# version 2, do not use Julia's digit function
function is_factorion_version2(n)
  s  = 0
  n0 = n  # kepp the original number as we we modify n
  while ( n > 0 )
    x  = n % 10        # get the last digit
    s += factorial(big(x))
    n  = div(n,10)    # remove the last digit
  end
  return ( s == n0 ) 
end


N = 100000
results = []
for i=1:N
  if ( is_factorion_version2(i) ) 
     append!(results,i)
  end
end
println(results)

