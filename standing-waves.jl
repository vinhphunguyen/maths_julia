using PrettyTables
using Plots
using LaTeXStrings


c = 1.0
A = 1.0

xa    = 0:0.01:1
ta    = [1/6 1/4 3/4 5/6;
         1/12 1/8 3/8 5/12;
         1/18 1/12 3/12 5/18]

sin1    = zeros(3,length(xa),length(ta))


for n=1:3
	for i=1:length(xa)
		x     = xa[i]
		for j=1:4
			t     = ta[n,j]
			sin1[n,i,j] = A*sin(n*pi*x)*cos(n*pi*c*t)
		end
	end
end

pyplot()
p1=plot(xa,sin1[1,:,1],legend=false,xlabel=L"u_1(x,t)")
plot!(p1,xa,sin1[1,:,2],legend=false)
plot!(p1,xa,sin1[1,:,3],legend=false)
plot!(p1,xa,sin1[1,:,4],legend=false)

p2=plot(xa,sin1[2,:,1],legend=false,xlabel=L"u_2(x,t)")
plot!(p2,xa,sin1[2,:,2],legend=false)
plot!(p2,xa,sin1[2,:,3],legend=false)
plot!(p2,xa,sin1[2,:,4],legend=false)

p3=plot(xa,sin1[3,:,1],legend=false,xlabel=L"u_3(x,t)")
plot!(p3,xa,sin1[3,:,2],legend=false)
plot!(p3,xa,sin1[3,:,3],legend=false)
plot!(p3,xa,sin1[3,:,4],legend=false)

plot(p1, p2, p3, layout = (3, 1), legend = false,size=(650,450))
savefig("plot-standing-waves.pdf")



