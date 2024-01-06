using DifferentialEquations, LinearAlgebra, SparseArrays
using BenchmarkTools
using Symbolics
using IncompleteLU
using WriteVTK
using Random, Distributions


# solving the reaction-diffusion equation in [0,1] x [0,1]
# using DifferentialEquations.jl
# The process is:
# 1. Finite difference to replace spatial derivatives by Finite differences
# 2. (1) gives a system of ODEs, using existing solvers to solve it


const N   = 200
const xyd = range(0, stop = 200, length = N)

#limit(a, N) = a == N + 1 ? 1 : a == 0 ? N  : a # original code
limit(a, N) = a == N + 1 ? 2 : a == 0 ? N -1 : a

function write_vtk(solution)
    for n = 1:length(solution)    
        filename = "file$n"  
        vtk_grid(filename, xyd, xyd) do vtk
            vtk["u"] = solution[n][:,:,1]
        end
    end
end

# function that defines the ODE
# u[i,j,1] =  u (the concentration u at all grid points)
# u[i,j,2] =  v (the concentration v at all grid points)
# du[i, j, 1] = du/dt discretised
# du[i, j, 2] = dv/dt discretised
# the equations are: 
#  du/dt = Da * Laplacian of u + u - u^3 - v - alpha
#  dv/dt = Db * Laplacian of v + beta* (u - v)
# Laplacian: from central difference formula
# periodic boundary conditions with limit() function

function reaction_diffusion_2d(du, u, p, t)
    Da, Db, alpha, beta, dx = p  # get the parameters stored in 'p'
    Da = Da / dx^2
    Db = Db / dx^2
    @inbounds for I in CartesianIndices((N, N))
        i, j = Tuple(I)
        x, y = xyd[I[1]], xyd[I[2]]
        ip1, im1, jp1, jm1 = limit(i + 1, N), limit(i - 1, N), 
                             limit(j + 1, N), limit(j - 1, N)
        du[i, j, 1] = Da * (u[im1, j, 1] + u[ip1, j, 1] + u[i, jp1, 1] + u[i, jm1, 1] -
                       4u[i, j, 1]) +
                       u[i, j, 1] - u[i, j, 1]^3 - u[i, j, 2] + alpha

        du[i, j, 2] = Db * (u[im1, j, 2] + u[ip1, j, 2] + u[i, jp1, 2] + u[i, jm1, 2] -
                       4u[i, j, 2]) + (u[i, j, 1] - u[i, j, 2]) * beta
    end
end

function reaction_diffusion_Gray_Scott(du, u, p, t)
    Da, Db, f, k, dx = p  # get the parameters stored in 'p'
    Da = Da / dx^2
    Db = Db / dx^2
    @inbounds for I in CartesianIndices((N, N))
        i, j = Tuple(I)
        x, y = xyd[I[1]], xyd[I[2]]
        ip1, im1, jp1, jm1 = limit(i + 1, N), limit(i - 1, N), 
                             limit(j + 1, N), limit(j - 1, N)
        du[i, j, 1] = Da * (u[im1, j, 1] + u[ip1, j, 1] + u[i, jp1, 1] + u[i, jm1, 1] -
                       4u[i, j, 1]) -
                       u[i, j, 1] * u[i, j, 2]^2 + f*(1 - u[i, j, 1] )

        du[i, j, 2] = Db * (u[im1, j, 2] + u[ip1, j, 2] + u[i, jp1, 2] + u[i, jm1, 2] -
                       4u[i, j, 2]) + 
                        u[i, j, 1] * u[i, j, 2]^2 - (f+k) * u[i,j,2]
    end
end



function rotate_array(a, angle)
    """
    Rotate a 2D array `a` by the specified angle in degrees.
    """
    rows, cols = size(a)
    rotation_matrix = [cosd(angle) -sind(angle); sind(angle) cosd(angle)]
    
    rotated_array = zeros(size(a))
    for i in 1:rows
        for j in 1:cols
            rotated_coords = round.(Int, rotation_matrix * [i - rows/2; j - cols/2] .+ [rows/2; cols/2])
            if 1 <= rotated_coords[1] <= rows && 1 <= rotated_coords[2] <= cols
                rotated_array[i, j] = a[rotated_coords[1], rotated_coords[2]]
            end
        end
    end
    return rotated_array
end

function average_rotate(a, degree)
    """
    Takes a 2D array `a` and produces the average arrays,
    having rotated it `degree` times. The resulting shape
    has approximate `degree`-fold rotational symmetry.
    """
    theta = 360 / degree
    res = zeros(size(a))
    for i=1:degree
        res +=  rotate_array(a, theta * i) 
    end
    return res/degree
end


#matrix = [1 2 3; 4 5 6; 7 8 9]
#println(average_rotate(matrix, 3))

function init(xyd)
    N = length(xyd)
    u = zeros(N, N, 2)
    for I in CartesianIndices((N, N))
        x = xyd[I[1]] # not used (x,y) here
        y = xyd[I[2]]
        u[I, 1] = 1. + rand(Uniform(-0.03, 0.03))
        u[I, 2] = 1. + rand(Uniform(-0.03, 0.03))
    end
    u
end

function init_with_symmetry(xyd,degree)
    N  = length(xyd)
    u  = zeros(N, N, 2)
    u0 = zeros(N, N, 2)
    for I in CartesianIndices((N, N))
        x = xyd[I[1]] # not used (x,y) here
        y = xyd[I[2]]
        u[I, 1] = randn()*0.05
        u[I, 2] = randn()*0.05
        #u[I, 1] = 1. + rand(Uniform(-0.03, 0.03))
        #u[I, 2] = 1. + rand(Uniform(-0.03, 0.03))
    end
    u0[:,:,1] = average_rotate(u[:,:,1], degree)
    u0[:,:,2] = average_rotate(u[:,:,2], degree)
    return u0
end


#initial conditions
# u0 = init(xyd)
# #u0 = init_with_symmetry(xyd,5)

# Da, Db, alpha, beta = 1., 100., -0.005, 10.
# p = (Da, Db, alpha, beta, step(xyd))
# tspan = (0.0, 50.0)

# # define the ODE problem
# du0 = copy(u0)
# jac_sparsity = Symbolics.jacobian_sparsity(
#     (du, u) -> reaction_diffusion_2d(du, u, p, 0.0), du0, u0)
# f            = ODEFunction(reaction_diffusion_2d; jac_prototype = float.(jac_sparsity))

# #prob_ode_sparse = ODEProblem(f, u0, tspan, p)
# prob_ode = ODEProblem(reaction_diffusion_2d, u0, tspan, p)

# # then solve it 
# sol = solve(prob_ode, Euler(), dt=.001,saveat = 1.);

# println("solving...done")

# post-processing
# solution = sol.u # get the solution, it is a vector of Vector{Array{Float64, 3}}
# write_vtk(solution)


# GRAY-SCOTT
# define the ODE problem
params =    [0.16 0.08 0.035 0.065;
             0.14 0.06 0.035 0.065;
             0.16 0.08 0.06  0.062;
             0.19 0.05 0.06  0.062;
             0.16 0.08 0.02  0.055;
             0.16 0.08 0.05  0.065;
             0.16 0.08 0.054 0.063;
             0.16 0.08 0.035 0.06]

Da, Db, f, k = params[end,:]

p = (Da, Db, f, k, step(xyd))
tspan = (0.0, 20000.0)

# a small region in the centre of the region is perturbed. As this perturbation spreads out, strange patterns are formed.
function init_gray_scott(xyd)
    N  = length(xyd)
    u0 = zeros(N, N, 2)
    a  = ones(Float64,N,N)
    b  = zeros(Float64,N,N)
    
    centre = div(N, 2)

    a[centre-20:centre+19, centre-20:centre+19] .= 0.5
    b[centre-20:centre+19, centre-20:centre+19] .= 0.25

    a .+= randn(N,N) * 0.05
    b .+= randn(N,N) * 0.05
    u0[:,:,1] = a
    u0[:,:,2] = b
    return u0
end


# initial conditions
u0 = init_gray_scott(xyd)

prob_ode = ODEProblem(reaction_diffusion_Gray_Scott, u0, tspan, p)

# then solve it 
sol = solve(prob_ode, Euler(), dt=.1,saveat = 100.);

println("solving...done")

# post-processing
solution = sol.u # get the solution, it is a vector of Vector{Array{Float64, 3}}
write_vtk(solution)

########################################
# other solvers: not efficient!
# function incompletelu(W, du, u, p, t, newW, Plprev, Prprev, solverdata)
#     if newW === nothing || newW
#         Pl = ilu(convert(AbstractMatrix, W), τ = 50.0)
#     else
#         Pl = Plprev
#     end
#     Pl, nothing
# end

#@btime sol = solve(prob_ode, KenCarp47(linsolve = KrylovJL_GMRES(), precs = incompletelu,
        #concrete_jac = true), save_everystep = false);
