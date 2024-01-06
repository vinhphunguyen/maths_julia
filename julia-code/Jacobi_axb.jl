using LinearAlgebra
using PrettyTables

function jacobi_iterations(A,b,x0,iter_count)
    S   = Diagonal(A)
    T   = S - A
    xk  = x0
    xk1 = x0
    ϵ   = 100.

    sols = zeros(2,iter_count)

    for i=1:iter_count
        sols[:,i] = xk
        bk   = T*xk + b
        xk1  = S\bk
        ϵ    = norm(xk1-xk)
        xk   = xk1
    end
    return xk,sols
end

function gauss_seidel_iterations(A,b,x0,iter_count)
    S   = zeros(size(A))
    for j=1:size(A,2)
        for i=1:size(A,1)
            if i >= j S[i,j]=A[i,j] end
        end
    end
    T   = S - A
    xk  = x0
    xk1 = x0
    ϵ   = 100.

    sols = zeros(2,iter_count)

    for i=1:iter_count
        sols[:,i] = xk
        bk   = T*xk + b
        xk1  = S\bk
        ϵ    = norm(xk1-xk)
        xk   = xk1
    end
    return xk,sols
end

A = [2. -1.;-1. 2.]
b = [4., -2.]

ϵ  = 1e-5
x0 = zeros(2)
x,sols  = jacobi_iterations(A,b,x0,6)
x1,sols1  = gauss_seidel_iterations(A,b,[0,-1],6)

sol = [sols;sols1]'


pretty_table(sol, ["n", "S1", "S2", "dd"],formatters = ft_printf("%5.8f"))
pretty_table(sol, ["n", "S1", "S2", "dd"], backend = :latex,formatters = ft_printf("%5.12f",2:3))
