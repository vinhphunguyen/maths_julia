using PrettyTables
using Plots
using LaTeXStrings



pyplot()
#p1=plot(fill(0., noX),ya,legend=false,color="black",aspect_ratio=:equal)

xa1      =  -1:0.1:1
ya1      =  -1:0.1:1
noX1     = length(xa1)
noY1     = length(ya1)

# p1=plot(fill(xa1[1], noX1),ya1,color="black",legend=false,aspect_ratio=:equal)
# for i=1:noX1
#   plot!(fill(xa1[i], noX1),ya1,color="black")
# end


# for i=1:noY1
#   plot!(xa1,fill(ya1[i], noY1),color="black")
# end

# #axis("off")
# # xlims!(-2.5,-2.3)
# # ylims!(-2.5,-2.3)
# savefig(p1,"plot-complex-func-zplane.pdf")


p1=plot(fill(0., noX1),ya1,legend=false,aspect_ratio=:equal)
for i=1:noX1
  plot!(fill(xa1[i], noX1).^2-ya1.^2,2*ya1.*fill(xa1[i], noX1),color="red")
end


for i=1:noY1
  plot!(xa1.^2-fill(ya1[i],noY1).^2,2*fill(ya1[i], noX1).*xa1,color="blue")
end

savefig(p1,"plot-complex-func-wplane.pdf")

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



