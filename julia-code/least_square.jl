using LaTeXStrings
using LinearAlgebra
using CairoMakie

# original data 
data = [0 3.929;
        1 5.308;
        2 7.240;
        3 9.638;
        4 12.866;
        5 17.069 ]

# log data for second column
data_log = [data[:,1] log.(data[:,2])]  
# least square for linear regression     
A = [data_log[:, 1] ones(size(data_log)[1])]
b = data_log[:, 2]
x = (A'*A)\(A'*b)

# plotting
with_theme(theme_latexfonts()) do
    fontsize_theme = Theme(fontsize=40)
    set_theme!(fontsize_theme)
    fig = Figure(resolution=(1200, 600),fonts = (; regular="CMU Serif"))
    ax1 = Axis(fig[1, 2], yscale=log, xlabel=L"$t$", ylabel=L"$N$", ytickformat = "{:.2f}",
              yminorticksvisible=true, yminorgridvisible=true)

    ax2 = Axis(fig[1, 1], xlabel=L"$t$", ylabel=L"$N$", ytickformat="{:.2f}",
        xminorticksvisible=true, xminorgridvisible=true, yminorgridvisible=true)

    scatter!(ax1, data[:, 1], data[:, 2],markersize=16, color=:red)
    scatter!(ax2, data[:, 1], data[:, 2],markersize=16, color=:red)
    
    # Generate the fitted line using the linear model
    t = range(minimum(data[:, 1]), stop=maximum(data[:, 1]), length=100)
    fitted_line = exp.(x[1] .* t .+ x[2])
    lines!(ax1, t, fitted_line, label="Fitted Line", color=:red)

    display(fig)
    save("figure.pdf", fig, pdf_version="1.4")
end