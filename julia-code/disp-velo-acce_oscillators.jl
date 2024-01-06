using PrettyTables
using Plots
using LaTeXStrings

omega0=2*pi
x0    = 1.0
v0    = 0.0

B       = x0

ta    = 0:0.01:3
xx    = zeros(length(ta))
vv    = zeros(length(ta))
ac    = zeros(length(ta))

for i=1:length(ta)
	t     = ta[i]
	xx[i] =  B*cos(omega0*t)
	vv[i] = -omega0*B*sin(omega0*t)
	ac[i] = -omega0^2*B*cos(omega0*t)
end

pyplot()
pf=plot(ta,xx,legend=false,xlabel=L"t",ylabel=L"x(t)")
ph=plot(ta,vv,legend=false,color="red", xlabel=L"t",ylabel=L"\dot{x}(t)")
pt=plot(ta,ac,legend=false,color="red", xlabel=L"t",ylabel=L"\ddot{x}(t)")
plot(pf, ph, pt, layout = (3, 1), legend = false,size=(450,450))

savefig("disp-velo-acc.pdf")

#### coupled oscillation
omega0=3*pi
x0    = 1.0
eps   = 0.1

B       = x0

ta    = 0:0.1:60
x1    = zeros(length(ta))
x2    = zeros(length(ta))

for i=1:length(ta)
	t     = ta[i]
	x1[i] =  B*cos(eps*t)*cos(omega0*t)
	x2[i] =  B*sin(eps*t)*sin(omega0*t)
end

pyplot()
pf=plot(ta,x1,legend=false,xlabel=L"t",ylabel=L"x_1(t)")
ph=plot(ta,x2,legend=false,color="red", xlabel=L"t",ylabel=L"x_2(t)")
plot(pf, ph, layout = (2, 1), legend = false,size=(450,450))

savefig("beats.pdf")