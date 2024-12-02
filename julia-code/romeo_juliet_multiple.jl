using DifferentialEquations
using CairoMakie
using LinearAlgebra
using DataStructures: CircularBuffer
using LaTeXStrings

#################################
# solving ODEs 
#################################

function romeo_juliet!(du, u, p, t)
    a, b, c, d = p
    du[1] = a * u[1] + b * u[2]
    du[2] = c * u[1] + d * u[2]
end

u0 = [2.1 -5; -1.5 5;1 -5;-1 5]
tspan = [(0.0, 1), (0.0, 1.6), (0.0, 1.6), (0.0, 1.6)]
p = [1, 1.0, 4.0, -2]

# Store solutions
solutions = []

# Solve the problem for each dog's speed
for i = 1:4
    prob = ODEProblem(romeo_juliet!, u0[i,:], tspan[i], p)
    sol  = solve(prob)
    push!(solutions, sol)
end

function gen_plot(sols, filename)
    #u = sol.u
    #time = range(0, 1.2, length=300) #and then plot(time,sol.(time))

    with_theme(theme_latexfonts()) do
        fontsize_theme = Theme(fontsize=50)
        set_theme!(fontsize_theme)
        fig = Figure(resolution=(1000, 1000), fonts=(; regular="CMU Serif"))
        display(fig)
        ax = Axis(fig[1, 1], aspect=1.0, xlabel=L"$R$", ylabel=L"$J$") # aspect ratio 1:1
        #xlims!(ax, -1.1, 1.1)
        #ylims!(ax, -1.1, 1.1)
        xs = LinRange(-5, 5, 20)
        ys = LinRange(-5, 5, 20)
        us = [p[1] * x + p[2] * y for x in xs, y in ys]
        vs = [p[3] * x + p[4] * y for x in xs, y in ys]
        strength = vec(sqrt.(us .^ 2 .+ vs .^ 2))

        arrows!(xs, ys, us, vs, arrowsize=10, lengthscale=0.07, linewidth=1.3)

        colors = [:red, :blue, :green, :purple] # Define colors for each solution

        for (i, sol) in enumerate(sols)
            u = sol.u
            t = sol.t 
            time = range(0, t[length(t)], length=300)
            lines!(ax, first.(sol.(time)), last.(sol.(time)), color=colors[i], label="Solution $i", linewidth=4)
             scatter!(ax, [u0[i,1]], [u0[i, 2]], color=colors[i], marker=:circle, markersize=14, label="Initial Point $i")
        end

        # Draw y = -4x line
        xs1 = LinRange(-1, 1, 20)
        lines!(ax, xs, xs, color=:black, linewidth=3.6)
        lines!(ax, xs1, -4 .* xs1, color=:black, linewidth=3.6)


        save(filename, fig)
    end
end

gen_plot(solutions, "fix_duck.pdf")