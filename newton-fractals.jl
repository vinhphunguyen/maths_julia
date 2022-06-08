using PrettyTables
using LaTeXStrings
using Gadfly, ColorSchemes
using PyPlot
import Cairo, Fontconfig
using PyCall


plt = pyimport("matplotlib.pyplot")

TOL = 1e-8

function newton_0(z0,f,fprime;max_iter=1000)
  roots = ComplexF64[]
  z     = z0
  for i=1:max_iter
    dz = f(z)/fprime(z)
    if abs(dz) < TOL 
       return roots 
    end
    z -= dz
    push!(roots,z)
  end
  return 0
end

function newton(z0,f,fprime;max_iter=1000)
  z = z0
  counter = 0
  for i=1:max_iter
    dz = f(z)/fprime(z)
    counter += 1
    if abs(dz) < TOL 
       return z,counter
    end
    z -= dz
  end
  return 0,0
end

function get_root_index(roots,r)
    i    = 0
	for i=1:length(roots) 
	  if isapprox(roots[i],r) 
	     return i 
	  end
	end
	if i == 0
	  push!(roots,r)
	  return length(roots)
	end
end

function plot_newton_fractal(f,fprime;n=200,domain=(-1,1,-1,1))
  roots = ComplexF64[]
  m     = zeros(n,n)

  xmin,xmax,ymin,ymax = domain
  xarrays = range(xmin,xmax,length=n)
  yarrays = range(ymin,ymax,length=n)
  for (ix,x) in enumerate(xarrays)
    for (iy,y) in enumerate(yarrays)
       z0 = x + y * im
       r,counter  = newton(z0,f,fprime)
       if r  != 0
	       ir = get_root_index(roots,r)
	        # println("$roots")
	        # println("$r")
	        # println("$ir")
	       m[iy,ix] = ir #- 0.99*log(counter)
       end
    end
  end

  nroots = length(roots)
  return roots,m
end

f(z)      = z^12-1
fprime(z) = 12*z^11


domain=(-2,2,-2,2)

roots,m = plot_newton_fractal(f,fprime,n=2000,domain=domain)

c = plt.imshow(m, cmap ="hot", interpolation ="nearest", origin ="lower")
plt.colorbar(c)
plt.axis("off")
plt.show()
plt.savefig("plot-NR1.pdf",bbox_inches="tight")
# using Gadfly, not so happy with it
# myplot=spy(m,Scale.ContinuousColorScale(p -> get(ColorSchemes.sunset, p)))
# draw(PDF("myplot.pdf", 3inch, 3inch), myplot)

##
## { item_description }
##
f(z)      = sin(z)-1
fprime(z) = cos(z)
z0  = pi/2-0.5 - 0.5im
rs  = newton_0(z0,f,fprime)


#pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
pretty_table(rs, ["Deltax"], backend = :latex)






