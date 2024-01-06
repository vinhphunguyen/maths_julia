
using PyCall
using Plots
using LaTeXStrings

mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")


rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 16
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 16
rcParams["legend.fontsize"] = 16
rcParams["xtick.labelsize"] = 16
rcParams["ytick.labelsize"] = 16

random_integers = rand(1:100000, 1000)

m      = length(random_integers)
counts = zeros(9)

for i = 1:m
	s = string(random_integers[i])
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

#display(counts)


p = bar(digits, counts, legend=false,xtickfontsize=14,ytickfontsize=14,ylim=(0,16))
title!("Số ngẫu nhiên")
xlabel!("chữ số đầu")
xticks!(1:9, [L"$1$", L"$2$", L"$3$",L"$4$",L"$5$",L"$6$",L"$7$",L"$8$",L"$9$"])
yticks!(0:2.5:15.1,[L"$0.0$", L"$2.5$", L"$5.0$", L"$7.5$", L"$10.0$", L"$12.5$", L"$15.0$"])

# Add values on top of each bar
for (i, v) in enumerate(counts)
    x = round(v, digits=1)
    latex_string = L"%$x"
    annotate!(i-0., v + .8, Plots.text(latex_string, :black, :center, 14))
end

display(p)
savefig(p, "benford-random.pdf")