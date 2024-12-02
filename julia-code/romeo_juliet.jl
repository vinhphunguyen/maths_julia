
using DifferentialEquations
using CairoMakie
using LinearAlgebra
using Printf
#using GLMakie
using DataStructures: CircularBuffer
using LaTeXStrings

#################################
# solving ODEs 
#################################

function romeo_juliet!(du, u, p, t)
    a,b,c,d = p
    du[1]   = a * u[1] + b * u[2]
    du[2]   = c * u[1] + d * u[2]
end

u0    = [1.0, 0.0]
tspan = (0.0, 1)
p     = [1, 1.0, 4.0, -2] # 
Δt    = 0.001
prob  = ODEProblem(romeo_juliet!, u0, tspan, p)
sol   = solve(prob)

function gen_plot(sol, filename)
    u = sol.u
    time = range(0,tspan[2],length=300) #and then plot(time,sol.(time))

    with_theme(theme_latexfonts()) do
        fontsize_theme = Theme(fontsize=40)
        set_theme!(fontsize_theme)
        fig = Figure(resolution=(1000, 1000), fonts=(; regular="CMU Serif"))
        display(fig)
        ax = Axis(fig[1, 1], aspect=1.0, xlabel=L"$R$", ylabel=L"$J$") # aspect ratio 1:1
        #xlims!(ax, -1.1, 1.1)
        #ylims!(ax, -1.1, 1.1)
        xs = LinRange(-1, 1, 20)
        ys = LinRange(-1, 1, 20)
        us = [p[1] * x + p[2] * y for x in xs, y in ys]
        vs = [p[3] * x + p[4] * y for x in xs, y in ys]
        strength = vec(sqrt.(us .^ 2 .+ vs .^ 2))

        #arrows!(xs, ys, us, vs, arrowsize=10, lengthscale=0.1, linewidth=2.4)

        lines!(ax, first.(sol.(time)), last.(sol.(time)), color=:red, linewidth=4)
        #lines!(ax, time, first.(sol.(time)), color=:cyan)
        #lines!(ax, time, last.(sol.(time)), color=:purple)
        save(filename, fig)
    end
end

function write_data_to_file(sol, filename )
    t = range(0, tspan[2], length=300)
    u = copy(sol.(t))


    open(filename, "w") do file
        println(file, "t x y")
        for i in 1:length(t)
            println(file, "$(t[i]) $(first(u[i]))  $(last(u[i]))")
        end
    end
    cp(filename, "/Users/vingu/my-writings/books/mylife/data/romeo_juliet2.data";force=true)
end

gen_plot(sol,"fix_duck.pdf")
#write_data_to_file(sol, "romeo_juliet2.data")

