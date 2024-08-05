using LinearAlgebra
using Plots
using LaTeXStrings
using PyCall

function eig_power(A, x0, n)
    res = x0
    x   = x0
    λ = maximum(x)
    for i = 1:n
        x = A*x
        λ = [λ maximum(x)]
        x /= maximum(x)
        res = [res x]
    end
    return res,λ
end

F = [1 1;1 0]
evals = eigvals(F)

x0 = [1, 0]
res,λ= eig_power(F, x0, 10)
