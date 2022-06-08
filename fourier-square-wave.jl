using PrettyTables
using Plots
using LaTeXStrings


c = 1.0
A = 1.0

xa    = -pi:0.01:pi

S1    = zeros(length(xa))
S3    = zeros(length(xa))
S5    = zeros(length(xa))
S7    = zeros(length(xa))
S11    = zeros(length(xa))
S15    = zeros(length(xa))
f      = zeros(length(xa))


for i=1:length(xa)
	x     = xa[i]
	if x >= 0 f[i] = 1. end
 	S1[i] = 0.5 + (2/pi) * sin(x)
	S3[i] = 0.5 + (2/pi) * sin(x) + (2/3/pi) * sin(3*x)
	S5[i] = 0.5 + (2/pi) * sin(x) + (2/3/pi) * sin(3*x)+ (2/5/pi) * sin(5*x)
	S7[i] = 0.5 + (2/pi) * sin(x) + (2/3/pi) * sin(3*x)+ (2/5/pi) * sin(5*x)+ (2/7/pi) * sin(7*x)
	S11[i] = 0.5 + (2/pi) * sin(x) + (2/3/pi) * sin(3*x)+ (2/5/pi) * sin(5*x)+ (2/7/pi) * sin(7*x)+ (2/9/pi) * sin(9*x)+ (2/11/pi) * sin(11*x)
	S15[i] = S11[i] +  (2/13/pi) * sin(13*x) + (2/15/pi) * sin(15*x)
end

pyplot()
p1=plot(xa,S1,label=L"S_1")
plot!(p1,xa,f,color="red",label=L"f(x)")
p2=plot(xa,S3,label=L"S_3")
plot!(p2,xa,f,color="red",label=L"f(x)")
p3=plot(xa,S5,label=L"S_5")
plot!(p3,xa,f,color="red",label=L"f(x)")
p4=plot(xa,S7,label=L"S_7")
plot!(p4,xa,f,color="red",label=L"f(x)")
p5=plot(xa,S11,label=L"S_{11}")
plot!(p5,xa,f,color="red",label=L"f(x)")
p6=plot(xa,S15,label=L"S_{15}")
plot!(p6,xa,f,color="red",label=L"f(x)")
plot(p1, p2, p3,p4,p5,p6, layout = (3, 2),size=(650,450))
savefig("plot-fourier-square-wave.pdf")
