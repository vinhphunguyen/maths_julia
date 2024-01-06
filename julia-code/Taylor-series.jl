using PrettyTables
using Plots
using LaTeXStrings
using PyCall

plt = pyimport("matplotlib.pyplot")

function taylor_log(x,n)
  f = 0.
  for i=1:n
    f += (-1)^(i+1) * x^i/i
  end
  return f
end

function taylor_exp(x,n)
  f = 0.
  for i=1:n
    f += x^(i-1)/factorial(i-1)
  end
  return f
end

function taylor_remainder_exp(x,n)
  return exp(x) - taylor_exp(x,n)
end


ta    = -1.5:0.01:1.5
ta1   = -1.:0.01:1.5
f     = zeros(length(ta1))
T4    = zeros(length(ta))
T7    = zeros(length(ta))
T9    = zeros(length(ta))
T15   = zeros(length(ta))


# for i=1:length(ta1)
# 	t     = ta1[i]
# 	f[i]  = log(1+t)
# end

# for i=1:length(ta)
# 	t     = ta[i]
# 	T4[i] = taylor_log(t,4)
# 	T7[i] = taylor_log(t,7)
# 	T9[i] = taylor_log(t,11)
# 	T15[i] = taylor_log(t,16)
# end

# fig = plt.figure(figsize=(5,7))
# ax = fig.add_subplot(1, 1, 1)

# #spine placement data centered
# ax.spines["left"].set_position(("data", 0.0))
# ax.spines["bottom"].set_position(("data", 0.0))
# ax.spines["right"].set_color("none")
# ax.spines["top"].set_color("none")
# ax.grid(true, which="both")

# plt.plot(ta1,f,label=L"$\ln(1+x)$",color="red")
# plt.plot(ta,T4,label=L"$T_4(x)$",color="black")
# plt.plot(ta,T7,label=L"$T_7(x)$",color="blue")
# plt.plot(ta,T9,label=L"$T_{11}(x)$",color="cyan")
# plt.plot(ta,T15,label=L"$T_{16}(x)$",color="orange")
# #tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
# #labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
# #plt.xticks(tick_pos, labels)
# #plt.yticks(-1:0.5:1)
# plt.ylim(-4, 2)
# plt.legend(loc="lower right")
# plt.savefig("plot-Taylor-log.pdf",bbox_inches="tight")


ta    = -1.5:0.01:1.5
f     = zeros(length(ta))
T4    = zeros(length(ta))
T7    = zeros(length(ta))
T9    = zeros(length(ta))
T15   = zeros(length(ta))


# for i=1:length(ta)
# 	t      = ta[i]
# 	f[i]   = exp(t)
# 	T4[i]  = taylor_exp(t,2)
# 	T7[i]  = taylor_exp(t,3)
# 	T9[i]  = taylor_exp(t,4)
# 	T15[i] = taylor_exp(t,5)
# end


for i=1:length(ta)
	t      = ta[i]
	f[i]   = exp(t)
	T4[i]  = taylor_remainder_exp(t,2)
	T7[i]  = taylor_remainder_exp(t,3)
	T9[i]  = taylor_remainder_exp(t,4)
	T15[i] = taylor_remainder_exp(t,5)
end

fig = plt.figure(figsize=(5,7))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
ax.spines["left"].set_position(("data", 0.0))
ax.spines["bottom"].set_position(("data", 0.0))
ax.spines["right"].set_color("none")
ax.spines["top"].set_color("none")
ax.grid(true, which="both")

#plt.plot(ta,f,label=L"$\exp(x)$",color="red")
plt.plot(ta,T4,label=L"$R_1(x)$",color="black")
plt.plot(ta,T7,label=L"$R_2(x)$",color="blue")
plt.plot(ta,T9,label=L"$R_{3}(x)$",color="cyan")
plt.plot(ta,T15,label=L"$R_{4}(x)$",color="orange")
#tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
#labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
#plt.xticks(tick_pos, labels)
#plt.yticks(-1:0.5:1)
plt.ylim(0, 2)
plt.legend(loc="upper right")
plt.savefig("plot-Taylor-exp-remainder.pdf",bbox_inches="tight")

t = 2.0
l = 1.0
data = zeros(4,5)
data[:,1] = [0.2 0.5 1.0 1.5] 

for i=1:size(data,1)
  t= data[i,1]
  data[i,2] = taylor_remainder_exp(t,2)
  data[i,3] = taylor_remainder_exp(t,3)
  data[i,4] = taylor_remainder_exp(t,4)
  data[i,5] = taylor_remainder_exp(t,5)
end

pretty_table(data, ["x", "R1", "R2", "R3", "R4"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["x", "R1", "R2", "R3", "R4"], backend = :latex,formatters = ft_printf("%5.8f",[2]))

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




