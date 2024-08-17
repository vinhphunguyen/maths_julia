using DifferentialEquations
using CairoMakie

# Define the ODE function
function lorenz!(du, u, p, t)
    ω, v = p
    du[1] = (1 - u[1]) * v / sqrt((1 - u[1])^2 + u[2]^2) + ω * u[2]
    du[2] = -u[2] * v / sqrt((1 - u[1])^2 + u[2]^2) - ω * u[1]
end

# Initial condition
u0 = [0.0, 0.0]

# Time span
tspan = (0.0, 50)

# Duck's angular speed (should be 1)
duck_speed = 1.0

# Time step
Δt = 0.05

# Range of dog's speeds
dog_speeds = 0.1:0.1:1.0

# Store solutions
solutions = []

# Solve the problem for each dog's speed
for dog_speed in dog_speeds
    p = [duck_speed, dog_speed]
    prob = ODEProblem(lorenz!, u0, tspan, p)
    sol = solve(prob, Euler(), dt=Δt)
    push!(solutions, sol)
end

# Plotting the solutions

function generate_circle(num_points)
    theta = range(π, 2π, length=num_points)
    x = .5 .* ( 1 .+ cos.(theta) )
    y = .5 .* sin.(theta)
    return x, y
end

with_theme(theme_latexfonts()) do
    fontsize_theme = Theme(fontsize=40)
    set_theme!(fontsize_theme)
    fig = Figure(resolution = (800, 600))
    ax = Axis(fig[1, 1])

    # Plot each solution
    for (i, sol) in enumerate(solutions)
        x = first.(sol.u)
        y = last.(sol.u)
        lines!(ax, x, y, linewidth=2)
    end

    x, y = generate_circle(100)
    lines!(x, y, linestyle=:dash,) # plot the circle
    display(fig)
    save("chasing_duck_dog_speeds.pdf", fig)
end