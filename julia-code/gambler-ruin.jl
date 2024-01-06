using PrettyTables
using Plots
using LaTeXStrings


function get_P(i,p,N)

 if isapprox(p,0.5) P = i/N 
 else
    qp = BigFloat((1.0-p)/p)
    P  = (1.0-qp^i)/(1.0-qp^N)
 end
 return P 
end 



function gen_table(initial_money,games,N)
  num_rows = length(initial_money) + 1
  num_cols = length(games) + 1
  data     = zeros(num_rows,num_cols)
  data[2:end,1] .= initial_money
  data[1,1]     = 0  
  data[1,2:end] .= games

  for (i,ival) in enumerate(initial_money)
    for (j,jval) in enumerate(games)
      p  = jval
      i0 = ival 
      P  = get_P(i0,p,N)
      data[i+1,j+1] = P 
    end
  end

  table_labels = ["n" for _ in 1:num_cols]

  pretty_table(data, table_labels,formatters = ft_printf("%5.4f"))
  pretty_table(data, table_labels, backend = :latex,formatters = ft_printf("%5.4f",[2,3,4]))
end 

bet           = 100
N             = 10000 / bet
initial_money = (100,500,1000,5000,6000,9000,9990)./bet
games         = (0.5,0.493,0.474)
gen_table(initial_money,games,N)

