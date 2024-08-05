using DataFrames 
using CSV
using PyCall

plt = pyimport("matplotlib.pyplot") 
sns = pyimport("seaborn")
sns.set_style("ticks")


data = DataFrame(CSV.File("benford_data.csv"))

m,n    = size(data)
counts = zeros(9)

for i = 1:m
	s = data[i,2]
	if      s[1]=='1'
      	counts[1] += 1
  	else if s[1]=='2'
  		counts[2] += 1
 	else if s[1]=='3'
  		counts[3] += 1
    else if s[1]=='4'
  		counts[4] += 1
 	else if s[1]=='5'
  		counts[5] += 1  		
 	else if s[1]=='6'
  		counts[6] += 1
 	else if s[1]=='7'
  		counts[7] += 1  		  		
 	else if s[1]=='8'
  		counts[8] += 1  
 	else 
  		counts[9] += 1  				
	end
end

display(counts[1])
