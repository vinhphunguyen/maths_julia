using PrettyTables
using Plots
using LaTeXStrings


c = 1.0
A = 1.0

xa    = -4:0.01:4

S1    = zeros(length(xa))
S3    = zeros(length(xa))
S5    = zeros(length(xa))
S7    = zeros(length(xa))
S11    = zeros(length(xa))
S15    = zeros(length(xa))
f      = zeros(length(xa))

function triangular_wave(x)
   xx = mod(x,2)
   if xx <= 1 
     f = xx
   elseif xx <= 2
     f = 2-xx
   end
   return f
end



pi2=pi*pi
for i=1:length(xa)
	x     = xa[i]
	xpi = x *pi
	if x < 0 f[i] = triangular_wave(-x) end
	if x > 0 f[i] = triangular_wave(x) end
 	S1[i] = 0.5 - (4/pi2) * cos(xpi)
	S3[i] = S1[i] - (4/9/pi2) * cos(3*xpi)
	S5[i] = S3[i] - (4/25/pi2) * cos(5*xpi) #- (4/49/pi2) * cos(7*xpi)
end

pyplot()
p1=plot(xa,S1,label=L"S_1")
plot!(p1,xa,f,color="red",label=L"f(x)")
p2=plot(xa,S3,label=L"S_3")
plot!(p2,xa,f,color="red",label=L"f(x)")
p3=plot(xa,S5,label=L"S_5")
plot!(p3,xa,f,color="red",label=L"f(x)")
plot(p1, p2, p3, layout = (3, 1),size=(650,450))
savefig("plot-fourier-triangular-wave.pdf")



