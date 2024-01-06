using PrettyTables
using Plots
using LaTeXStrings
using PyCall

plt = pyimport("matplotlib.pyplot")


# ta    = -8:0.1:8
# sin1    = zeros(length(ta))
# sin2    = zeros(length(ta))


# for i=1:length(ta)
# 	t     = ta[i]
# 	sin1[i] = t^2 -4*t + 3
# 	sin2[i] = t^2+3-4
# end

# pyplot()
# p1=plot(ta,sin1,label=L"x^2-4x+3",xlabel=L"x",ylabel=L"y",xticks = -8:2:8)
# plot!(p1,ta,sin2,label=L"u^2-1",xlabel=L"x",ylabel=L"y")
# plot(p1,size=(450,300.666666667))
# savefig("quadratic.pdf")


ta    = -4*pi:0.01:4*pi
sin1    = zeros(length(ta))
sin2    = zeros(length(ta))


for i=1:length(ta)
	t     = ta[i]
	sin1[i] = sin(t)
	sin2[i] = t
end

fig = plt.figure(figsize=(12,4))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.0))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")


plt.plot(ta,sin1,label=L"$\sin x$",color="red")
plt.plot(ta,sin2,label=L"$x$",color="black")
#tick_pos= [-4*pi,-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi,4*pi]
#labels = [L"-4\pi",L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi",L"4\pi"]
#plt.xticks(tick_pos, labels)
#plt.yticks(-1:0.5:1)
plt.ylim(-1, 1)
plt.legend(loc="upper right")
plt.savefig("plot-sinx-x-100.pdf",bbox_inches="tight")



ta    = -4*pi:0.01:4*pi
sin1    = zeros(length(ta))
sin2    = zeros(length(ta))


for i=1:length(ta)
	t     = ta[i]
	sin1[i] = sin(t)
	sin2[i] = cos(t)
end

fig = plt.figure(figsize=(12,4))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.0))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")


plt.plot(ta,sin1,label=L"$\sin x$",color="red")
plt.plot(ta,sin2,label=L"$\cos x$",color="black")
tick_pos= [-4*pi,-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi,4*pi]
labels = [L"-4\pi",L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi",L"4\pi"]
plt.xticks(tick_pos, labels)
plt.yticks(-1:0.5:1)
plt.legend(loc="upper right")
plt.savefig("plot-sin-cos.pdf",bbox_inches="tight")


ta    = -1*pi:0.002:3*pi
tana    = zeros(length(ta))
cota    = zeros(length(ta))
xa      = zeros(length(ta))

ya    = -5:0.5:8
xa1   = (pi/2)*ones(length(ya))
xa2   = (3*pi/2)*ones(length(ya))
xa3   = (5*pi/2)*ones(length(ya))



for i=1:length(ta)
	t     = ta[i]
	tana[i] = tan(t)
	xa[i] = t
	if abs(cos(t)) < 1e-3
	  tana[i] = NaN
    end
end

fig = plt.figure(figsize=(8,8))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.0))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")


plt.plot(ta,tana,label=L"$\tan x$",color="red")
plt.plot(ta,xa,label=L"$x$",color="blue")
plt.plot(xa1,ya,label=L"asymptotes","--c")
plt.plot(-xa1,ya,"--b")
plt.plot(xa2,ya,"--b")
plt.plot(-xa2,ya,"--b")
plt.plot(xa3,ya,"--b")
plt.plot(-xa3,ya,"--b")
tick_pos= [-2*pi,-pi,0, pi/2,pi, 3*pi/2 ,2*pi,2.5*pi]
labels = [L"-2\pi",L"$-\pi$","0", L"$\pi/2$", L"$\pi$", L"$3\pi/2$",L"2\pi",L"$5\pi/2$"]
plt.xticks(tick_pos, labels)
# plt.yticks(-1:0.5:1)
plt.ylim(-0.5, 8)
#plt.legend(loc="upper right")
plt.savefig("plot-tan-cot1.pdf",bbox_inches="tight")


ta    = -2:0.002:2
tana    = zeros(length(ta))


for i=1:length(ta)
	t     = ta[i]
	tana[i] = exp(-t^2)
end

fig = plt.figure(figsize=(5,4))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.0))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")


plt.plot(ta,tana,color="red")
plt.plot([1],[exp(-1)],color="blue", marker="o", markersize=3)
#plt.ylim(-1, 4)
#plt.yticks(-1:0.5:4)
plt.savefig("plot-lim2.pdf",bbox_inches="tight")

# ta    = -3:0.001:3
# sin1    = zeros(length(ta))
# sin2    = zeros(length(ta))
# sin3    = zeros(length(ta))
# sin4    = zeros(length(ta))


# for i=1:length(ta)
# 	t     = ta[i]
# 	sin1[i] = 0.5*exp(t)
# 	sin2[i] = -0.5*exp(-t)
# 	sin3[i] = sinh(t)
# end

# fig = plt.figure(figsize=(4,8))
# ax = fig.add_subplot(1, 1, 1)

# #spine placement data centered
# ax.spines["left"].set_position(("data", 0.0))
# ax.spines["bottom"].set_position(("data", 0.0))
# ax.spines["right"].set_color("none")
# ax.spines["top"].set_color("none")

# plt.plot(ta,sin1,label=L"0.5$e^x$")
# plt.plot(ta,sin2,label=L"-0.5$e^{-x}$")
# plt.plot(ta,sin3,label=L"$\sinh(x)$",linewidth=1.5)

# plt.xlim(-2, 2)
# plt.ylim(-5, 6)
# plt.legend(loc="upper right")
# plt.grid(true)
# #plt.tight_layout()
# plt.savefig("plot-hyperbolic-funcs2.pdf",bbox_inches="tight")


ta     = -8:0.001:8
ta1    = 2:0.001:8
ta2    = -8:0.001:-2

sin1    = zeros(length(ta))
sin2    = zeros(length(ta))
sin31    = zeros(length(ta1))
sin32    = zeros(length(ta1))
sin41    = zeros(length(ta2))
sin42    = zeros(length(ta2))


for i=1:length(ta)
	t     = ta[i]
	sin1[i] = t
	sin2[i] = -t
end


for i=1:length(ta1)
	t     = ta1[i]
	sin31[i] = sqrt(t^2-4)
	sin32[i] = -sqrt(t^2-4)
end

for i=1:length(ta2)
	t     = ta2[i]
	sin41[i] = sqrt(t^2-4)
	sin42[i] = -sqrt(t^2-4)
end

fig = plt.figure(figsize=(4,4))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.0))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")

plt.plot(ta,sin1,label=L"$y=x$")
plt.plot(ta,sin2,label=L"$y=-x$")
plt.plot(ta1,sin31,color="red")
plt.plot(ta1,sin32,color="red")
plt.plot(ta2,sin41,color="blue")
plt.plot(ta2,sin42,color="blue")

# plt.xlim(-2, 2)
# plt.ylim(-5, 6)
plt.legend(loc="upper right")
plt.grid(true)
#plt.tight_layout()
plt.savefig("plot-hyperpola-rect.pdf",bbox_inches="tight")

# plot legendre polynomials

ta     = -1:0.001:1

L0    = zeros(length(ta))
L1    = zeros(length(ta))
L2    = zeros(length(ta))
L3    = zeros(length(ta))
L4    = zeros(length(ta))
L5    = zeros(length(ta))


for i=1:length(ta)
	t     = ta[i]
	L0[i] = 1
	L1[i] = t
	L2[i] = 0.5*(3*t*t-1)
	L3[i] = 0.5*(5*t*t*t-3*t)
	L4[i] = 0.125*(35*t^4-30*t^2+3)
	L5[i] = 0.125*(63*t^5-70*t^3+15*t)
end



fig = plt.figure(figsize=(4,3))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
# ax.spines["left"].set_position(("data", 0.0))
# ax.spines["bottom"].set_position(("data", 0.0))
# ax.spines["right"].set_color("none")
# ax.spines["top"].set_color("none")

plt.plot(ta,L0,label=L"$L_0$")
plt.plot(ta,L1,label=L"$L_1$")
plt.plot(ta,L2,label=L"$L_2$")
plt.plot(ta,L3,label=L"$L_3$")
plt.plot(ta,L4,label=L"$L_4$")
plt.plot(ta,L5,label=L"$L_5$")

# plt.xlim(-2, 2)
# plt.ylim(-5, 6)
plt.legend(loc="lower right",ncol = 3,fontsize="small" )
plt.grid(true)
#plt.tight_layout()
plt.savefig("plot-legendre.pdf",bbox_inches="tight")


# plot cubic Bernstein polynomials

ta     = 0:0.001:1

B0    = zeros(length(ta))
B1    = zeros(length(ta))
B2    = zeros(length(ta))
B3    = zeros(length(ta))
Bs    = zeros(length(ta))
Bp    = zeros(length(ta))
fa    = zeros(length(ta))

function ff(x)
	return sqrt(x)
end

function Bernstein_poly(f,n,t)
	s = 0.
	for k=0:n
		cnk = binomial(n,k)
		Bnk = cnk*(1-t)^(n-k)*t^k
		s += Bnk * f(k/n)
	end
	return s
end

for i=1:length(ta)
	t     = ta[i]
	B0[i] = (1-t)^3
	B1[i] = 3*t*(1-t)^2
	B2[i] = 3*t^2*(1-t)
	B3[i] = t^3
	Bs[i] = (1-t)^3 + 3*t*(1-t)^2 +  3*t^2*(1-t) + t^3
	Bp[i] = Bernstein_poly(ff,5,t)
	fa[i] = ff(t)
end



fig = plt.figure(figsize=(4,3))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
# ax.spines["left"].set_position(("data", 0.0))
# ax.spines["bottom"].set_position(("data", 0.0))
# ax.spines["right"].set_color("none")
# ax.spines["top"].set_color("none")

# plt.plot(ta,B0,label=L"$B_{0,3}$")
# plt.plot(ta,B1,label=L"$B_{1,3}$")
# plt.plot(ta,B2,label=L"$B_{2,3}$")
# plt.plot(ta,B3,label=L"$B_{3,3}$")
# plt.plot(ta,Bs,label=L"$\sum_k B_{k,3}$")

plt.plot(ta,fa,label=L"$\sqrt{t}$")
plt.plot(ta,Bp,label=L"$B_{n,f}(t)$")

# plt.xlim(-2, 2)
# plt.ylim(-5, 6)
plt.legend(loc="upper right",ncol = 3,fontsize="small" )
plt.grid(true)
#plt.tight_layout()
#plt.savefig("plot-Bernstein.pdf",bbox_inches="tight")
plt.savefig("plot-Bernstein1.pdf",bbox_inches="tight")

# ta    = 0:0.001:pi
# sin1    = zeros(length(ta))
# sin2    = zeros(length(ta))


# for i=1:length(ta)
# 	t     = ta[i]
# 	sin1[i] = sin(t)
# 	sin2[i] = sin(2*t)
# end

# pyplot()
# p1=plot(ta,sin1,label=L"\sin x",xlabel=L"x",ylabel=L"y")
# plot!(p1,ta,sin2,label=L"\sin 2x",xlabel=L"x",ylabel=L"y")
# plot(p1,size=(450,300.666666667))
# savefig("plot-sinx-sin3x-funcs.pdf")


# ta    = -6:0.001:6
# sin1    = zeros(length(ta))
# sin2    = zeros(length(ta))
# sin3    = zeros(length(ta))
# sin4    = zeros(length(ta))


# for i=1:length(ta)
# 	t     = ta[i]
# 	sin1[i] = t^2
# 	sin2[i] = t^2  + 3
# 	sin3[i] = (t-3)^2
# 	sin4[i] = (t+3)^2
# end

# pyplot()
# p1=plot(ta,sin1,legend=true,label=L"f(x)",aspect_ratio=:equal,size=(350,350))
# plot!(ta,sin2,label=L"f(x)+c")
# plot!(ta,sin3,label=L"f(x-c)")
# plot!(ta,sin4,label=L"f(x+c)")
# ylims!(0,8)
# savefig(p1,"plot-transformation-func.pdf")
# axis("tight")

# ta    = -2*pi:0.01:2*pi
# sin1    = zeros(length(ta))
# sin2    = zeros(length(ta))
# sin3    = zeros(length(ta))
# sin4    = zeros(length(ta))


# for i=1:length(ta)
# 	t     = ta[i]
# 	sin1[i] = sin(t)
# 	sin2[i] = 2*sin(t)
# end

# pyplot()
# p1=plot(ta,sin1,legend=true,label=L"\sin(x)",size=(450,250))
# plot!(ta,sin2,label=L"2\sin(x)")
# legend(bbox_to_anchor=(1.05, 1), loc=2, borderaxespad=0.0)
# #ylims!(0,8)
# savefig(p1,"plot-stretching-func1.pdf")
#

# ta    = -1:0.01:4
# sin1    = zeros(length(ta))
# sin2    = zeros(length(ta))
# sin3    = zeros(length(ta))
# sin4    = zeros(length(ta))


# for i=1:length(ta)
# 	t     = ta[i]
# 	sin1[i] = t^2 -3*t+1
# 	sin2[i] = t^2-5/4
# end

# pyplot()
# p1=plot(ta,sin1,label=L"x^2-3x+1")
# plot!(ta,sin2,label=L"x^2-5/4")
# plot!([0. ],[0. 0.],label=L"x^2-5/4")
# #legend(bbox_to_anchor=(1.05, 1), loc=2, borderaxespad=0.0)
# #plot(p1, legend = true,size=(450,450))
# #ylims!(0,8)
# savefig(p1,"plot-translation-func1.pdf")


# ta    = 0:0.001:1
# sin1    = zeros(length(ta))
# sin2    = zeros(length(ta))
# sin3    = zeros(length(ta))
# sin12    = zeros(length(ta))
# sin13    = zeros(length(ta))
# sin23    = zeros(length(ta))

# for i=1:length(ta)
# 	t     = ta[i]
# 	sin1[i] = sin(pi*t)
# 	sin2[i] = sin(2*pi*t)
# 	sin3[i] = sin(3*pi*t)
# 	sin12[i] = sin(pi*t)*sin(2*pi*t)
# 	sin13[i] = sin(pi*t)*sin(3*pi*t)
# 	sin23[i] = sin(2*pi*t)*sin(3*pi*t)
# end

# pyplot()
# p1=plot(ta,sin1,legend=false,xlabel=L"x",ylabel=L"\sin(\pi x)")
# p2=plot(ta,sin2,legend=false,xlabel=L"x",ylabel=L"\sin(2\pi x)")
# p3=plot(ta,sin3,legend=false,xlabel=L"x",ylabel=L"\sin(3\pi x)")
# p12=plot(ta,sin12,legend=false,xlabel=L"x",ylabel=L"\sin(\pi x)\sin(2\pi x)")
# p13=plot(ta,sin13,legend=false,xlabel=L"x",ylabel=L"\sin(\pi x)\sin(3\pi x)")
# p23=plot(ta,sin23,legend=false,xlabel=L"x",ylabel=L"\sin(2\pi x)\sin(3\pi x)")
# plot(p1, p12, p2,p13,p3,p23, layout = (3, 2), legend = false,size=(450,450))
# savefig("plot-sin-funcs.pdf")

# f0   =10.
# omega=10.
# beta =0.1*omega

# omega0a=0:0.1:20
# Asquared=zeros(length(omega0a))
# for i=1:length(omega0a)
#   omega0      = omega0a[i]
#   Asquared[i] = f0^2 / ( (omega0^2-omega^2)^2 + 4*omega^2*beta^2 )
# end

# omega0 = 10.
# beta1=0.1*omega0
# beta2=0.2*omega0
# beta3=0.3*omega0
# omegaa =0:0.1:20
# Asquared1=zeros(length(omegaa))
# Asquared2=zeros(length(omegaa))
# Asquared3=zeros(length(omegaa))

# for i=1:length(omegaa)
#   omega      = omegaa[i]
#   Asquared1[i] = f0^2 / ( (omega0^2-omega^2)^2 + 4*omega^2*beta1^2 )
#   Asquared2[i] = f0^2 / ( (omega0^2-omega^2)^2 + 4*omega^2*beta2^2 )
#   Asquared3[i] = f0^2 / ( (omega0^2-omega^2)^2 + 4*omega^2*beta3^2 )
# end

# pyplot()
# p1=plot(omega0a,Asquared,legend=false,xlabel=L"\omega_0",ylabel=L"A^2",size=(350,250))
# savefig(p1,"plot-resonance1.pdf")
# p2=plot(omegaa, Asquared1,label=L"\beta=0.1\omega_0",xlabel=L"\omega",ylabel=L"A^2",size=(350,250))
# plot!(p2,omegaa, Asquared2,label=L"\beta=0.2\omega_0",xlabel=L"\omega",ylabel=L"A^2")
# plot!(p2,omegaa, Asquared3,label=L"\beta=0.3\omega_0",xlabel=L"\omega",ylabel=L"A^2")
# savefig(p2,"plot-resonance2.pdf")

ta    = -4*pi:0.02:4*pi
ta2    = 0:0.02:4*pi
tana    = zeros(length(ta))
tana2    = zeros(length(ta2))

function sinc(x,n)
 sum = 0.0
 for i=0:n
   sum += (-1)^i * x^(2*i+1) / (2*i+1) / factorial(big(2*i+1))
 end
 return sum
end

for i=1:length(ta)
	t     = ta[i]
	#tana[i] = sin(t)/t
	tana[i] = sinc(t,20)
end

for i=1:length(ta2)
	t     = ta2[i]
	tana2[i] = sin(t)/t
end

fig = plt.figure(figsize=(5,3))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.0))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")


plt.plot(ta,tana,color="red")
#ax.fill_between(ta2, 0, tana2,alpha=0.2)
#plt.plot([0],[1],color="blue", marker="o", markersize=3)
#plt.ylim(-1, 4)
#plt.yticks(-1:0.5:4)
plt.savefig("plot-sinc.pdf",bbox_inches="tight")
