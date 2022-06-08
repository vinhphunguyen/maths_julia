using PrettyTables
using Plots
using LaTeXStrings

function ff(x)
 digits_x = digits(x)   # get the digits of x and put in array
 return sum(digits_x)^2
end

function fff(x,n)
   xa =        zeros(0)
   ya =        zeros(0)

	for i = 1:n
	    append!( xa,      i)
		x = ff(x)
        append!( ya,      x)
	end
	return (x,xa,ya)
end

x = big(2)^2006 # have to use big integer as 2^2006 is very big
x,xa,ya=fff(x,20)

data = [xa ya]

pretty_table(data, ["n", "fn"],formatters = ft_printf("%5.8f"))

data = zeros(100,2)
for i=1:100
data[i,1] = 4+9*i
data[i,2] = 7+9*i
end

pretty_table(data, ["n", "fn"],formatters = ft_printf("%5.8f"))