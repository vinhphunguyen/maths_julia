using PrettyTables
using Plots
using LaTeXStrings
using PyCall
using LazyGrids

plt = pyimport("matplotlib.pyplot")


(x, y) = ndgrid(-2:0.1:2, -2:0.1:2)
#z = @. sin(x) * cos(y)  # broadcasts to 2d array
u = x
v = y

fig = plt.figure(figsize=(4,4))
ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
# ax.spines["left"].set_position(("data", 0.0))
# ax.spines["bottom"].set_position(("data", 0.0))
# ax.spines["right"].set_color("none")
# ax.spines["top"].set_color("none")

plt.quiver(x,y,u,v)

# plt.plot(ta,sin1,label=L"$\sin x$",color="red")
# plt.plot(ta,sin2,label=L"$x$",color="black")
#tick_pos= [-4*pi,-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi,4*pi]
#labels = [L"-4\pi",L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi",L"4\pi"]
#plt.xticks(tick_pos, labels)
#plt.yticks(-1:0.5:1)
# plt.ylim(-1, 1)
# plt.legend(loc="upper right")
plt.show()
plt.savefig("plot-vector-field1.pdf",bbox_inches="tight")


############### PLOT ELECTRIC FIELDS ##############

# function E(q,xq,yq,x,y)
#   tem = ((x-xq)^2 + (y-yq)^2)^1.5
#   return (q*(x-xq)/tem,q*(y-yq)/tem)
# end
#
# function total_elec_field(charges, x,y)
#   no_of_charges = length(charges)
#   Ex = Ey = 0.
#   for i = 1:no_of_charges
#     q,xq,yq  = charges[i]
#     Exx,Eyy  = E(q,xq,yq,x,y)
#     Ex += Exx
#     Ey += Eyy
#   end
#   return Ex,Ey
# end
#
# # grid at which the electric field is evaluated/plotted
# (x, y) = ndgrid(-2:0.23:2, -2:0.23:2)
# # charges: dipole
# charges=[(1,-0.5,0),(-1,0.5,0)]
# #charges=[(1,0,0)]
# #
# u = zeros(size(x))
# v = zeros(size(x))
#
# for i=1:size(x,1)
#   xx = x[i]
#   for j=1:size(x,2)
#     yy = y[1,j]
#     u[i,j], v[i,j]=total_elec_field(charges, xx,yy)
#   end
# end
#
# fig = plt.figure(figsize=(4,4))
# ax = fig.add_subplot(1, 1, 1)
#
#
# plt.quiver(x,y,u,v)
# plt.show()

# # Electric field vector, E=(Ex, Ey), as separate components
# Ex, Ey = np.zeros((ny, nx)), np.zeros((ny, nx))
# for charge in charges:
#     ex, ey = E(*charge, x=X, y=Y)
#     Ex += ex
#     Ey += ey
