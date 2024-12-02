# Ritz method for plate bending problem
# using Symbolics, QuadGK, HCubature
# Vinh Phu Nguyen
# September 2024
# Written for Cửu Âm Chân Kinh

using QuadGK
using Symbolics
using HCubature

@variables x y

q = -1.0

psi1 = (1 - x^2)^2 * (1 - y^2)^2
psi2 = (1 - x^2)^2 * (1 - y^2)^2 * (x^2 + y^2)

dx = Differential(x)
laplace_psi1 = expand_derivatives(dx(dx(psi1)) + dy(dy(psi1)))
laplace_psi2 = expand_derivatives(dx(dx(psi2)) + dy(dy(psi2)))

k11_ = build_function(laplace_psi1 * laplace_psi1, x, y, expression=Val{false})
k12_ = build_function(laplace_psi1 * laplace_psi2, x, y, expression=Val{false})
k22_ = build_function(laplace_psi2 * laplace_psi2, x, y, expression=Val{false})

b1_ = build_function(q * psi1, x, y, expression=Val{false})
b2_ = build_function(q * psi2, x, y, expression=Val{false})

A = zeros(2,2)
b = zeros(2)

a0, b0 = -1, 1
a1, b1 = -1, 1
A[1,1]= hcubature(r -> k11_(r[1], r[2]), (a0, a1), (b0, b1))[1]
A[1,2]= hcubature(r -> k12_(r[1], r[2]), (a0, a1), (b0, b1))[1]
A[2,2]= hcubature(r -> k22_(r[1], r[2]), (a0, a1), (b0, b1))[1]

A[2,1] = A[1,2]

b[1] = hcubature(r -> b1_(r[1], r[2]), (a0, a1), (b0, b1))[1]
b[2] = hcubature(r -> b2_(r[1], r[2]), (a0, a1), (b0, b1))[1]

# solve Ac=b 

c = A\b