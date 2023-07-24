using PrettyTables
using Plots
using LaTeXStrings

f  = 3 # 3 cycles per second
f1 = .5 # 3 cycles per second


omega = 2π*f
k     = 2π*f1

ta    = 0:0.002:1
f     = zeros(length(ta))
fcos  = zeros(length(ta))
fsin  = zeros(length(ta))

for i=1:length(ta)
	t       = ta[i]
	f[i]    =  cos(omega*t)
	fcos[i] =  cos(k*t)*cos(omega*t)
	fsin[i] =  sin(k*t)*cos(omega*t)
end

xt(t) = cos(t)
yt(t) = sin(t)

pyplot()
pf=plot(ta,f,legend=false,xlabel=L"$t$",ylabel=L"$f(t)$")
ph=plot(fcos,fsin,legend=false,color="red", xlabel=L"$\cos(kt)f(t)$",ylabel=L"$\sin(kt)f(t)$",xlim=(-1, 1), ylim=(-1, 1),aspect_ratio=:equal)
plot!(xt, yt, 0, 2π, leg=false )
plot(pf, ph, layout = (2, 1), legend = false,size=(450,450))
savefig("driven-weakly-damped.pdf")
