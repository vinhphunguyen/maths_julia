using Polynomials

# integrate a polynomial from a to b
function polyint(p::Polynomial, a, b)
    pi = integrate(p)
    pi(b) - pi(a)
end

# inner product of two polynomials
polydot(p::Polynomial, q::Polynomial) = polyint(p*q, -1,1)

# Legendre polynomial of degree n
# using the Gram-Schmidt orthogonalization process

function legendre_gramschmidt(n)
    legendre = [Polynomial([1 // 1])] # first func, P_0(x) = 1
    for i = 1:n
        p = Polynomial([k == i ? 1 // 1 : 0 // 1 for k = 0:i])
        for q in legendre
            p = p - q * (polydot(q, p) // polydot(q, q))
        end
        push!(legendre, p / p(1))
    end
    return legendre
end

L = legendre_gramschmidt(4)
foreach(p -> display("text/latex", p), L)