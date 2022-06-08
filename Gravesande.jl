using PrettyTables
using Plots
using LaTeXStrings
using DataFrames


#pretty_table(data, ["n", "Head"],formatters = ft_printf("%5.8f"))
#pretty_table(data, ["n", "Head"], backend = :latex,formatters = ft_printf("%5.8f",[2]))

function Gravesande_today()
Pp= BigInt(0)
n=BigInt(11429)
for k=5745:6128
#println(k)
Pp += binomial(BigInt(n),k)
end
return Pp/BigInt(2^n)
end

function next_term(n,k,old)
  return BigFloat((old * (n-k)) / ( k + 1))
end

function Gravesande()
  n =11429
  n0=5715  # middle term

  n1=5745
  n2=6128

  Cn0 = 100#binomial(BigInt(n),n0) 
  old = Cn0
  denominator = 0
  A=Vector{Int64}(undef,n-n0+1)
  B=Vector{BigFloat}(undef,n-n0+1)
  i = 1
  for k=n0-1:n-1
    #println(k)
    A[i]         = k+1
    new          = next_term(n,k,old)
    denominator += new
    old          = new
    B[i]         = new
    i +=  1
  end
  denominator *= 2 
  df = DataFrame(A=A, B=B)
  return df,denominator
end

df,denominator=Gravesande()

first(df,5)

nominator = sum(df[(df.A .>= 5745) .& (df.A .<= 6128), :B])
probability = nominator / denominator
println(denominator)
println(nominator)
println(probability)