using PrettyTables
using Plots
using LaTeXStrings
using PyCall

plt = pyimport("matplotlib.pyplot")

ta    = -4*pi:0.02:4*pi
ta2    = 0:0.02:4*pi
tana    = zeros(length(ta))
tana1   = zeros(length(ta))
xa      = zeros(length(ta))
sina    = zeros(length(ta))
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

for i=1:length(ta)
	t     = ta[i]
	tana[i] = sin(t)/t
	xa[i]    = t
	sina[i]    = sin(t)
	tana1[i]    = tan(t)
end

fig = plt.figure(figsize=(5,3))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.0))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")


plt.plot(ta,tana1,color="red",label=L"\tan x")
plt.plot(ta,xa,color="blue",label=L"x")
#plt.plot(ta,sina,color="blue",label=L"\sin x")
#ax.fill_between(ta2, 0, tana2,alpha=0.2)
#plt.plot([0],[1],color="blue", marker="o", markersize=3)
plt.ylim(-4, 4)
plt.legend(loc="upper right")
#plt.yticks(-1:0.5:4)
plt.savefig("plot-sinc3.pdf",bbox_inches="tight")

