using DataFrames 
using CSV
using PyCall
using Plots
using LaTeXStrings

plt = pyimport("matplotlib.pyplot") 


data = DataFrame(CSV.File("benford_data.csv"))

m,n    = size(data)
counts = zeros(9)
#data.population = convert.(String, data.population)


for i = 1:m
	s = string(data[i,2])
	if     s[1]=='1'
      	counts[1] += 1
  	elseif s[1]=='2'
  		counts[2] += 1
 	elseif s[1]=='3'
  		counts[3] += 1
    elseif s[1]=='4'
  		counts[4] += 1
 	elseif s[1]=='5'
  		counts[5] += 1  		
 	elseif s[1]=='6'
  		counts[6] += 1
 	elseif s[1]=='7'
  		counts[7] += 1  		  		
 	elseif s[1]=='8'
  		counts[8] += 1  
 	else 
  		counts[9] += 1  				
	end
end

counts /= m
counts *= 100
digits = [1,2,3,4,5,6,7,8,9]

display(counts)

y_ticks_latex = [L"$0$", L"$10$", L"$20$", L"$30$"]

p = bar(digits, counts, legend=false,xtickfontsize=14,ytickfontsize=14)
title!("Luật Benford")
xlabel!("chữ số đầu")
xticks!(1:9, [L"$1$", L"$2$", L"$3$",L"$4$",L"$5$",L"$6$",L"$7$",L"$8$",L"$9$"])
yticks!(0:10:30,y_ticks_latex)

# Add values on top of each bar
for (i, v) in enumerate(counts)
    x = round(v, digits=1)
    latex_string = L"%$x"
    annotate!(i-0., v + 1, Plots.text(latex_string, :black, :center, 14))
end

display(p)
savefig(p, "benford.pdf")
