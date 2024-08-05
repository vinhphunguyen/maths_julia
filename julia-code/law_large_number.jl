using PrettyTables
using PyPlot
using LaTeXStrings
using PyCall
using LinearAlgebra
using Random
using Distributions
using Statistics

plt = pyimport("matplotlib.pyplot")
rcParams = PyPlot.PyDict(PyPlot.matplotlib."rcParams")
font0 = Dict(
  "text.usetex" => true,
  "font.size" => 15,
  "axes.labelweight" => "bold",
  "axes.labelsize" => 16,
  "xtick.labelsize" => 8,
  "ytick.labelsize" => 8,
  "legend.fontsize" => 8,
)
merge!(rcParams, font0)

Random.seed!(1234)

N = 1000
x=rand(1:6,N)
x=cumsum(x) ./ (1:N)
xe = 3.5*ones(N)

fig = figure(figsize=(8,8))
ax = fig.add_subplot(1, 1, 1)
ax[:tick_params]("both",labelsize=24)

plt.plot(1:N,x,color="red")
plt.plot(1:N,xe,color="black")
ax.set_yticks([1,2,3,4,5,6])
plt.xlabel("numbre of trials")
plt.ylabel("average")
plt.savefig("law-weak-numbers.pdf",bbox_inches="tight")
