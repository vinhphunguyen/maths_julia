using SymPy
@vars x
# derivatives and plot
f = 1 / ( 1 + 25 * x * x)
f2 = diff(f,x,2)
f6 = diff(f,x,6)
# 2nd derivative of f
# 6th derivative of f
xgrid=-1:0.01:1.0
yh6=[f6.subs(x,xi) for xi in xgrid] # evaluate f6 at xgrid plt.plot(xgrid,yh6,color="black","-",linewidth=1.,label="6th derivative") # integrals
a = 0.
b = 1.
J = integrate(f, (x, a, b)) # integral of f, from a to b
# limits
limit(sin(x)/x, x, 0)
limit( (x+1/x)^x, x,oo )
# series expansion
x0=0.
f.series(x, x0, 5)
# partial fraction decomposition apart(f)

g=1-0.5*x^2-0.125*x^4-0.0625*x^6-0.0390625*x^8
gg=expand(g^2)

function atanx(x,n)
    s = 0.
    for i =0:n
       ss = (-1)^(i)
       s += ( x^(2*i+1) / (2*i+1) ) * ss;
    end
    return s
end

n = 10

pii = 4. * ( 4. * atanx(1/5,n) - atanx(1/239,n) )

G=6.673e-11
R=6.37e6
M=5.972e24

g=G*M/R^2

@vars L d h n

J = (2*h)/(d*L)*integrate( x*sin(n*pi*x/L), (x, 0, d)) + (2*h)/(L*(L-d))*integrate( (L-x)*sin(n*pi*x/L), (x, d, L))
