using SymPy
using Polylogarithms

@vars x k L q0 c1 c2 c3

phi1 = sin((pi*x)/L)
phi2 = sin((3*pi*x)/L)

y    = c1*phi1 + c2*phi2

ypp  = diff(y,x,2)
F    = 0.5*k*ypp^2-q0*y

J    = integrate(F, (x, 0, L))

J1   = diff(J,c1)
J2   = diff(J,c2)

solve([J1, J2], [c1,c2])

k11  = integrate(k*diff(phi1,x,2)*diff(phi1,x,2),(x,0,L))
k12  = integrate(k*diff(phi1,x,2)*diff(phi2,x,2),(x,0,L))
k21  = k12
k22  = integrate(k*diff(phi2,x,2)*diff(phi2,x,2),(x,0,L))

b1  = integrate(q0*phi1,(x,0,L))
b2  = integrate(q0*phi2,(x,0,L))

#x  = [k11 k12;k21 k22]/[b1 b2]

function basel(m)
	@vars x n
	f = 1/x^2 
	f1 = integrate(f,(x,1,n)) + 0.5*(f.subs(x,n)+f.subs(x,1))
	for k=1:m
		twok   = big(2 * k)
		fac    = bernoulli(twok)/factorial(twok)
		fprime = diff(f,x,twok-1) 
		f1    += fac * (fprime.subs(x,n)-fprime.subs(x,1))
	end 
	return f1
end