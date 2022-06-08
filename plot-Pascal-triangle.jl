using PrettyTables
using Plots
using LaTeXStrings
using PyCall
using Printf


function gen_pascal_triangle(n)
  list=Any[]
  for i=1:n  # loop over the rows
    row =  Vector{Int}(undef, i)
    # fill the ith row, ith row has i numbers
    for j=1:i
      if j == 1 || j == i 
        row[j] = 1
      else
        row[j] = list[i-1][j-1]+list[i-1][j]
      end
    end
    push!(list, row)
  end
  return list
end

n=5
tri=gen_pascal_triangle(n)

for i=1:n
  for j=1:i
    @printf "%i " tri[i][j]
  end
  @printf "\n"
end

for i=1:n
  for j=1:n-i
    @printf "* " 
  end
  for j=1:i
    @printf "%i  " tri[i][j]
  end
   for j=1:n-i
    @printf "* " 
  end
  @printf "\n"
end

