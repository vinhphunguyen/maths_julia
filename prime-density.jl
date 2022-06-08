using PrettyTables
using Plots
using LaTeXStrings
using Primes





function prime_n(n)
  counter= 0
  for i=1:n
    if (  isprime(i) ) counter += 1 end
  end
  return counter
end


data = zeros(7,3)
data[:,1] = [100 1000 10000 100000 1000000 10000000 100000000] 

for i=1:size(data,1)
  data[i,2] = prime_n(Int(data[i,1]))
  data[i,3] = data[i,2]/data[i,1]
end

pretty_table(data, ["n", "S1", "s3"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["n", "S1", "S3"], backend = :latex)#,formatters = ft_printf("%d %d %5.3f",[1 2 3]))


