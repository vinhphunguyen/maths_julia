import Base: +, -, *, /
import Base: sin, cos

struct Dual{T<:Real} <: Real
  val::T
  der::T
end

# to make Dual(3) work
Dual(x) = Dual(x, one(x))
# to print a Dual
Base.show(io::IO, d::Dual) = print(io, d.val, " + ", d.der, "ϵ")

# operator overloading for +/-/x/:
a::Dual   + b::Dual   = Dual(a.val + b.val, a.der + b.der)
a::Dual   + b::Number = Dual(a.val + b, a.der)
b::Number + a::Dual   = a+b
a::Dual - b::Dual     = Dual(a.val - b.val, a.der - b.der)
a::Dual - b::Number   = Dual(a.val - b, a.der)
b::Number - a::Dual   = Dual(b - a.val, -a.der)
# (fg)' = f'g + fg'
a::Dual * b::Dual = Dual(a.val * b.val, a.der * b.val + a.val * b.der)
a::Dual * b::Number = Dual(a.val * b, a.der * b)
a::Number * b::Dual = b*a
a::Dual / b::Dual = Dual(a.val / b.val, (a.der * b.val - b.der * a.val) / b.val^2)

sin(d::Dual) = Dual(sin(d.val), cos(d.val) * d.der)
cos(d::Dual) = Dual(cos(d.val), -sin(d.val) * d.der)

derive(f, x) = f(Dual(x)).der

#f(x) = 2x^2 + 1
#df(x) = derive(f, x)
#println("f(3) = ", f(3), " then f'(3) = ", df(3))
g(x) = sin(cos(x))
dg(x) = derive(g, pi/2)
println("g(3) = ", g(3), " then g'(3) = ", dg(pi/2))