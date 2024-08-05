using PrettyTables
using Plots
using LaTeXStrings


omega0=10*pi
beta  =pi/2
x0    = 0.0
v0    = 0.0
f0    = 1000.
omega = 2*pi

omega0d = sqrt(omega0^2-beta^2)
A       = f0 / sqrt( (omega0^2-omega^2)^2 + 4*omega^2*beta)
delta   = atan(2*omega*beta/(omega0^2-omega^2))
theta   = atan( (omega*A*sin(delta)-v0-beta*(x0-A*cos(delta)))/(omega0d*(x0-A*cos(delta))) )
B       = (x0-A*cos(delta)) / cos(theta)

ta    = 0:0.01:5
xp    = zeros(length(ta))
xh    = zeros(length(ta))
ft    = zeros(length(ta))

for i=1:length(ta)
	t     = ta[i]
	xh[i] =  B*exp(-beta*t)*cos(omega0d*t+theta)
	xp[i] =  A*cos(omega*t-delta)
	ft[i] =  f0*cos(omega*t)
end

# Find the maximum value and its index
max_value, max_index = findmax(xh)

# Create a tuple array of values and their original indices
indexed_xh = [(value, index) for (index, value) in enumerate(xh)]

# Sort by value in descending order
sorted_indexed_xh = sort(indexed_xh, by=x -> x[1], rev=true)

# Now, sorted_indexed_xh[1] is the maximum, sorted_indexed_xh[2] is the second maximum, etc.
# To get the original index of the second maximum:
second_max_value, second_max_index = sorted_indexed_xh[2]
# For the third maximum:
third_max_value, third_max_index = sorted_indexed_xh[3]

# pyplot()
# pf=plot(ta,ft,legend=false,xlabel=L"t",ylabel=L"f(t)")
# ph=plot(ta,xh,legend=false,color="red", xlabel=L"t",ylabel=L"x_h(t)")
# pt=plot(ta,xh+xp,legend=false,color="red", xlabel=L"t",ylabel=L"x(t)")
# plot(pf, ph, pt, layout = (3, 1), legend = false,size=(450,450))
# savefig("driven-weakly-damped.pdf")
