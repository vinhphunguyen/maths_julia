using PrettyTables
using Plots
using LaTeXStrings

function sn(n)
	product=1.0
	for k=0:n
	 cnk      = binomial(big(n),k)
	 product *= cnk
	end
	return product
end

function square_root(S,x0,epsilon)
  x  = x0
  while (true)
    x = 0.5 * ( x + S/x )
    if (abs(x*x-S) < epsilon) break end
  end
  return x
end


# geometric series 1/2+1/4+..+1/2^n
function geometric_series(n)
  S = 0.
  for k=1:n
   S += 1/2^k
  end
  return S
end

# geometric series 1+1/2+1/3+...
function harmonic_series(n)
  S = 0.
  for k=1:n
   S += 1/k
  end
  return S
end

# data = zeros(20,2)
# for i=1:size(data,1)
#   S = geometric_series(i)
#   data[i,1] = i
#   data[i,2] = S
# end

# pretty_table(data, ["n", "S"])
# pretty_table(data, ["n", "S"], backend = :latex)

# pyplot()
# p=scatter(data[:,1],data[:,2],legend=false,grid=false,size=(250,250))
# xlabel!(L"n")
# ylabel!(L"S(n)")
# savefig(p, "myplot.pdf")
# 
data = zeros(20,2)
for i=1:size(data,1)
  S = harmonic_series(i)
  data[i,1] = i
  data[i,2] = S
end

pretty_table(data, ["n", "S"])
pretty_table(data, ["n", "S"], backend = :latex)

pyplot()
p=scatter(data[:,1],data[:,2],legend=false,grid=false,size=(250,250))
xlabel!(L"n")
ylabel!(L"S(n)")
savefig(p, "harmonic.pdf")

# integral of f(x)dx from a to b using n intervals
# using mid-point rule
function mid_point_quad(f,a,b,n)
  A       = 0.
  deltax  = (b-a)/(n)
  deltax2 = 0.5*deltax
  for i=1:n
    fxi = f(a+(2*i-1)*deltax2) 
    A  += deltax * fxi
  end
  return A
end

function trapezoidal_quad(f,a,b,n)
  A       = 0.
  deltax  = (b-a)/n
  deltax2 = 0.5*deltax
  for i=0:n
    fxi = f(a+i*deltax) 
    if i == 1 || i == n 
      c = 1.
    else
      c = 2.
    end
    A  += c * fxi
  end
  return A*deltax2
end

function simpson_quad(f,a,b,n)
  A       = 0.
  deltan  = (b-a)/n
  deltax6 = deltan/6
  for i=1:n
    fa  = f(a+(i-1)*deltan) 
    fb  = f(a+i*deltan) 
    fm  = f(a+i*deltan-deltan/2) 
    A  += fa + 4*fm + fb
  end
  return A*deltax6
end

function gauss_quad(f,a,b,n)
  A       = 0.
  deltan  = (b-a)/n
  deltax2 = deltan/2
  u1 = -1/sqrt(3)
  u2 =  -u1
  for i=1:n
    ai  = a+(i-1)*deltan
    bi  = a+i*deltan
    x1  = 0.5*(1-u1)*ai + 0.5*(1+u1)*bi
    x2  = 0.5*(1-u2)*ai + 0.5*(1+u2)*bi
    A  += f(x1) + f(x2)
  end
  return A*deltax2
end

# integral of f(x)dx from a to b using n intervals
function numerical_integration(f,a,b,n)
  A      = 0.
  deltax = (b-a)/n
  for i=1:n
    fxi = f(a+i*deltax) 
    A  += deltax * fxi
  end
  return A
end

function fx2(x) 
  x^2
end

function fx3(x) 
  x^3
end

function fx4(x) 
  x^4
end

# # integral of y=x^2 from 0 to 1
# data = zeros(4,6)
# for i=1:size(data,1)
#   ii = 10^(i-1)
#   S1 = trapezoidal_quad(fx3,0,1,ii)
#   S2 = simpson_quad(fx3,0,1,ii)
#   data[i,1] = ii
#   data[i,2] = 1/ii
#   data[i,3] = S1
#   data[i,4] = S1-1/4
#   data[i,5] = S2
#   data[i,6] = S2-1/4
# end

# #pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
# pretty_table(data, ["n", "D", "S1", "d", "S2", "d"], backend = :latex,formatters = ft_printf("%5.8f",[2,3,4,5,6]))


# integral of y=x^2, x^3, x^4 from 0 to 1
# using Simpson quadrature
data = zeros(5,3)
for i=1:size(data,2)
  ii = 10^(i-1)
  S1 = simpson_quad(fx2,0,1,ii)
  S2 = simpson_quad(fx3,0,1,ii)
  S3 = gauss_quad(fx4,0,1,ii)
  data[1,i] = ii
  data[2,i] = 1/ii
  data[3,i] = S1-1/3
  data[4,i] = S2-1/4
  data[5,i] = S3-1/5
end

#pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
pretty_table(data, ["n", "D", "S1"], backend = :latex,formatters = ft_printf("%e"))

# computing logarithm of log(1+x) using its series
# with n terms
# function logarithm(x,n)
#   A      = 0.
#   for i=1:n
#     A  += -(-1)^(i) * x^i/i
#   end
#   return A
# end

# function logarithm_better(x,n)
#   A      = 0.
#   for i=1:2:n
#     A  += x^i/i
#   end
#   return 2*A
# end

# data = zeros(1000,3)
# for i=1:size(data,1)
#   S1 = logarithm(1,i)
#   S2 = logarithm_better((exp(1)-1)/(1+exp(1)),i)
#   data[i,1] = i
#   data[i,2] = S1
#   data[i,3] = S2
# end

# pretty_table(data, ["n", "S1", "S2"])
# pretty_table(data, ["n", "S1", "S2"], backend = :latex)



# function sinx_series(x,n)
#   A      = 0.
#   for i=1:n
#     A  += (-1)^(i-1) * x^(2*i-1) / factorial(big(2*i-1))
#   end
#   return A
# end

# data = zeros(1000,2)
# for i=1:size(data,1)
#   S1 = sinx_series(pi/4,i)
#   data[i,1] = i
#   data[i,2] = S1
# end

# #pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
# pretty_table(data, ["n", "S1"], backend = :latex,formatters = ft_printf("%5.8f",[2]))


