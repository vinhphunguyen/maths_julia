using Distributions

function simpson_quad(f,a,b,n)
    A       = 0.; deltan  = (b-a)/n; deltax6 = deltan/6
    for i=1:n
      fa  = f(a+(i-1)*deltan) 
      fb  = f(a+i*deltan) 
      fm  = f(a+i*deltan-deltan/2) 
      A  += fa + 4*fm + fb
    end
    return A*deltax6
end

const two_over_sqrt_pi = 2/sqrt(pi)
const sqrt2_inv = 1/sqrt(2)
const n = 10

function erf(z)
   
  return two_over_sqrt_pi * simpson_quad( u -> exp(-u^2),0,z,n) 
end

function cdf_normal(z)
  return 0.5(1 + erf(z*sqrt2_inv))
end

z = 0.02
println(cdf_normal(z))

normal_dist = Normal()
normalCDF(z) = cdf(normal_dist,z)
println(normalCDF(z))
