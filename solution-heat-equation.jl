using PrettyTables
using Plots
using LaTeXStrings


kappa = 1.0

xa    = 0:0.01:1
ta    = [0. 0.008 0.05]

sin1  = zeros(length(xa),length(ta))


for i=1:length(xa)
	x     = xa[i]
	for j=1:length(ta)
		t     = ta[j]
		sin1[i,j] =  exp(-(2*pi)^2*t)*sin(2*pi*x) + 
		       (1/3)*exp(-(4*pi)^2*t)*sin(4*pi*x) + 
		       (1/5)*exp(-(6*pi)^2*t)*sin(6*pi*x) +
		       (1/7)*exp(-(8*pi)^2*t)*sin(8*pi*x) 
	end
end

pyplot()
p1=plot(xa,sin1[:,1],label=L"t=0")
plot!(p1,xa,sin1[:,2],label=L"t=0.005")
plot!(p1,xa,sin1[:,3],label=L"t=0.05")


plot(p1,xlabel=L"x",ylabel=L"\theta(x,t)",size=(350,250))
savefig("plot-heat-equation.pdf")



