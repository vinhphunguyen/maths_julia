using PrettyTables
using Plots
using LaTeXStrings
using PyCall


plt = pyimport("matplotlib.pyplot")

ta    = -2*pi:0.01:2*pi
sin1    = zeros(length(ta))
sin2    = zeros(length(ta))


for i=1:length(ta)
	t     = ta[i]
	sin1[i] = sin(t)
	sin2[i] = cos(t)
end


theta     = 0:0.001:12*pi
r         = zeros(length(theta))
x         = zeros(length(theta))
y         = zeros(length(theta))


for i=1:length(theta)
  t    = theta[i]
  r[i] = t+2*sin(2*pi*t) 
  x[i] = sin(t)*(exp(cos(t)) - 2*cos(4*t)-sin(t/12)^5)  
  y[i] = cos(t)*(exp(cos(t)) - 2*cos(4*t)-sin(t/12)^5)
end

fig = plt.figure(figsize=(6,6))
ax = fig.add_subplot(1, 1, 1,projection="polar")
ax.plot(theta, r,linewidth=2,color="red")
#ax.plot(x, y,linewidth=1.4)
#ax.set_rmax(12)
#ax.set_rticks([0.5, 1, 1.5, 2])  # Less radial ticks
#ax.set_rlabel_position(-22.5)  # Move radial labels away from plotted line
ax.grid(true)
plt.legend(loc="upper right")
plt.savefig("plot-polar-rose.pdf",bbox_inches="tight")