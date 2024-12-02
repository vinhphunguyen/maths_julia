# Function approximation using L2 projection
# Application of the best approximation theorem in Linear Algebra to functions
# using Symbolics, QuadGK, HCubature
# Vinh Phu Nguyen
# September 2024
# Written for Cửu Âm Chân Kinh

using QuadGK, Symbolics
@variables x
⊗(f, g) = quadgk(x -> f(x) * g(x), -1, 1)[1]
d(f, g) = sqrt( quadgk(x -> (f(x) - g(x))^2, -1, 1)[1] )
function func(x) return exp(x) end
# basis of the approximate function space (Legendre polynomials)
basis_functions = [1, x, x^2 - 1 / 3]
n = length(basis_functions)
coeffs = zeros(n)
for i = 1:n
    psi_i = build_function(basis_functions[i], x, expression=Val{false})
    a = psi_i ⊗ psi_i
    b = func  ⊗ psi_i
    coeffs[i] = b / a
end

g_ = 
sum([coeffs[i] * basis_functions[i] for i = 1:n])
g = build_function(g, x, expression=Val{false})

d(func, g)



