using PrettyTables
using PyPlot
using LaTeXStrings
using PyCall
using LinearAlgebra
using Random
using Distributions
using Statistics

Random.seed!(1234)

function monte_carlo_pi(n)
  inside  = 0
  points1 = zeros(n,2)
  points2 = Array{Float64}(undef, 0, 2)
  Random.seed!()
  for i=1:n
    x     = rand()
    y     = rand()
    points1[i,1] = x
    points1[i,2] = y
    if ( x^2 + y^2 <= 1. )
      inside += 1
      points2 = [points2;[x y]]
    end
  end
  return (4*(inside/n),points1,points2) # return a tuple (pi,points1,points2)
                                        # points1/2: for plotting only
end


data = zeros(5,2)
data[:,1] = [100 200 400 800 5600]

for i=1:size(data,1)
  data[i,2],pts1,pts2 = monte_carlo_pi(Int(data[i,1]))
end


xx,pts1,pts2 = monte_carlo_pi(Int(data[5,1]))

# pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
# pretty_table(data, ["n", "S1"], backend = :latex,formatters = ft_printf("%5.8f",[2]))


plt = pyimport("matplotlib.pyplot")


# #rcParams = PyPlot.PyDict(PyPlot.matplotlib."rcParams")
# rcParams = PyDict(matplotlib["rcParams"])
# rcParams["font.size"] = 15
# rcParams["axes.labelsize"] = 10
# rcParams["xtick.labelsize"] = 8
# rcParams["ytick.labelsize"] = 8
# rcParams["legend.fontsize"] = 8
# rcParams["text.usetex"] = true
# rcParams["font.family"] = "serif"
#

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

ta    = 0:0.01:1
circle= zeros(length(ta))


for i=1:length(ta)
	x     = ta[i]
	circle[i] = sqrt(1-x^2)
end

fig = figure(figsize=(8,8))
ax = fig.add_subplot(1, 1, 1)
ax[:tick_params]("both",labelsize=24)

#spine placement data centered
# ax.spines["left"].set_position(("data", 0.0))
# ax.spines["bottom"].set_position(("data", 0.0))
# ax.spines["right"].set_color("none")
# ax.spines["top"].set_color("none")


plt.plot(ta,circle,color="red")
plt.plot(pts1[:,1],pts1[:,2],"ro")
plt.plot(pts2[:,1],pts2[:,2],"bs")
plt.savefig("plot-MC-circle-pi.pdf",bbox_inches="tight")


#####

function monte_carlo_pi_version2(n)
  Random.seed!()
  points1  = [(rand(),rand()) for _ in 1:n]
  points2  = filter(x -> norm(x) <= 1., points1)
  return (4*(length(points2)/n),points1,points2) # return a tuple (
end

xx,pts1,pts2 = monte_carlo_pi_version2(Int(data[5,1]))
println(xx)
#xx,pts1,pts2 = monte_carlo_pi(Int(data[5,1]))
#println(xx)

fig = figure(figsize=(8,8))
ax = fig.add_subplot(1, 1, 1)
ax[:tick_params]("both",labelsize=24)

plt.plot(ta,circle,color="red")
plt.plot(first.(pts1),last.(pts1),"ro")
plt.plot(first.(pts2),last.(pts2),"bs")
plt.savefig("plot-MC-circle-pi2.pdf",bbox_inches="tight")

# MOnte Carlo secretary problem: envelope and business card

function MC_secretary_prob(n,N)
  function envelop()
	  # make a permutation of [1:n]
  	  envelopes = shuffle!(collect(1:n))
	  # compare envelop[i] with i for i =1:n, store in an array
	  # this array contains [0 ... 1], it has at least 1 if there is a match
	  # thus if sum(this array) == 0: return 1 (all is missed)
	  return sum([envelopes[i] == i for i in 1:n]) == 0
  end
  data = [envelop() for _ in 1:N]
  return sum(data)/N
end

N = 10^6
n = 6

dat = MC_secretary_prob(n,N)
display(dat)

# theory sum (-1)^k/k!, k=0,...,n

# p=0.
# for k=0:n
# 	p += (-1)^k / factorial(k)
# end

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
