using PrettyTables
using Plots
using LaTeXStrings
using PyCall
using LinearAlgebra
using Random
using Distributions
using Statistics
using QuadGK



mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")
sns = pyimport("seaborn")

sns.set_style("ticks") # dark_background,

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 24
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 24
rcParams["legend.fontsize"] = 24
rcParams["xtick.labelsize"] = 24
rcParams["ytick.labelsize"] = 24

function set_size()
  width_pt = 468 / 1.5
  inches_per_pt = 1 / 72.27
  golden_ratio = 0.75
  fig_width_in = width_pt * inches_per_pt # Figure width in inches
  fig_height_in = fig_width_in * golden_ratio
  fig_dim = (fig_width_in, fig_height_in)
  return fig_dim
end

Random.seed!(1234)

# Monte Carlo method for computing pi
# simple, long implementation

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

function monte_carlo_experiment1()
  data = zeros(5,2)
  data[:,1] = [100 200 400 800 5600]

  for i=1:size(data,1)
    data[i,2],pts1,pts2 = monte_carlo_pi(Int(data[i,1]))
  end
  #xx,pts1,pts2 = monte_carlo_pi(Int(data[5,1]))
  # pretty_table(data, ["n", "S1"],formatters = ft_printf("%5.8f"))
  # pretty_table(data, ["n", "S1"], backend = :latex,formatters = ft_printf("%5.8f",[2]))
  ta = 0:0.01:1
  circle = zeros(length(ta))
  for i = 1:length(ta)
    x = ta[i]
    circle[i] = sqrt(1 - x^2)
  end

  fig = figure(figsize=(8, 8))
  ax = fig.add_subplot(1, 1, 1)
  ax[:tick_params]("both", labelsize=24)

  #spine placement data centered
  # ax.spines["left"].set_position(("data", 0.0))
  # ax.spines["bottom"].set_position(("data", 0.0))
  # ax.spines["right"].set_color("none")
  # ax.spines["top"].set_color("none")


  # plt.plot(ta,circle,color="red")
  # plt.plot(pts1[:,1],pts1[:,2],"ro")
  # plt.plot(pts2[:,1],pts2[:,2],"bs")
  # plt.savefig("plot-MC-circle-pi.pdf",bbox_inches="tight")
end

# monte carlo pi version 2
# shorter
#####
function monte_carlo_pi_version2(n)
  Random.seed!()
  points1  = [(rand(),rand()) for _ in 1:n]
  points2  = filter(x -> norm(x) <= 1., points1)
  return (4*(length(points2)/n),points1,points2) # return a tuple (
end

function monte_carlo_experiment2()
  xx,pts1,pts2 = monte_carlo_pi_version2(100000)
  println(xx)
end

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

#theory sum (-1)^k/k!, k=0,...,n

p=0.
for k=0:n
	p += (-1)^k / factorial(k)
end
display(p)
# Monte Carlo computing definit integral of f(X) over [a,b]
# using uniform distribution to make N x_i over [a,b]
# then compute the average of f(x_i) over [a,b]

function MC_definite_integral_uniform(f,a,b,N)
  #x  = a .+ (b-a)*rand(N)
  #fx = f.(x)
  sum_fx = 0.0
  for _ in 1:N
    x = a + (b - a) * rand()
    sum_fx += f(x)
  end
  return ((b-a)*sum_fx/N)
end

f(x) = sqrt(1-x^2)
a = 0.0
b = 1.0
N = 10^6
pii = MC_definite_integral_uniform(f, a, b, N)
#println(pii*4)

# function to estimate the error in computing pi using monte carlo method
# using MC_definite_integral(f, a, b, N) 
function MC_definite_integral_error(f,a,b,N1,N2)
  col1 = N1:1000:N2
  table = zeros(length(col1), 2)
  table[:, 1] = col1
  data = [4*MC_definite_integral(f,a,b,N) for N in col1] .- pi

  table[:,2] = data
  pretty_table(table, header=["X", "0.00"], backend=Val(:latex))
end

#MC_definite_integral_error(f, 0, 1, 1000, 100000)

# function to compute the mean and standard variance of MC_definite_integral
# over N experiments

function MC_definite_integral_mean_std(f,a,b,N,M,filename)
  data = [MC_definite_integral(f,a,b,N) for _ in 1:M]
  fig, ax = plt.subplots(1, 1, figsize=set_size())
  ax.hist(data, align="left", rwidth=0.9, density=1)
  plt.xlabel("Monte Carlo estimate")
  plt.ylabel("Frequency")
  #plt.yticks(range(0, 8, step=1))
  #plt.xticks(range(1.2, 2, step=0.2))
  ax.set_ylim(bottom=0)
  plt.savefig(filename, bbox_inches="tight")
  return (mean(data),std(data))
end

#MC_definite_integral_mean_std(x->sqrt(1-x^2),0.,1.,10^6,100,"MC_definite_integral.pdf")


# function to compute 2D integral over a unit circle
# using MC method


function MC_2D_integral_over_circle(f,N)
  points1 = [rand(2) for _ in 1:N] # all points inside square 
  points2 = filter(x -> norm(x) <= 1., points1)# filter out elements:x^2+y^2<=1
  area = length(points2)/N
  data = f.(points2)
  return (area*sum(data)/length(data))
end

#MC_2D_integral(x->10-x[1]^2-x[2]^2,10^8)

function MC_2D_integral(f,a,b,c,d,N)
  uniform_dist1 = Uniform(a, b)
  uniform_dist2 = Uniform(c, d)
  X             = rand(uniform_dist1, N)
  Y             = rand(uniform_dist2, N)
  area          = (b-a)*(d-c)
  return area * mean(f.(X, Y))
end

function MC_2D_integral(f, g, a, b, c, d, N)
  uniform_dist1 = Uniform(a, b)
  uniform_dist2 = Uniform(c, d)
  X             = rand(uniform_dist1, N)
  Y             = rand(uniform_dist2, N)
  area = (b - a) * (d - c)
  return area * mean(f.(X, Y) .* g.(X, Y))
end

function domain1(x,y)
  return y <= 2x^2 ? 1 : 0
end

function domain2(x, y)
  return x^2 + y^2 <= 1 ? 1 : 0
end

#MC_2D_integral((x,y)->8x+6y, 0,1,0,2,10^3)
#MC_2D_integral((x,y)->8x+6y,domain, 0,1,0,2,10^6)
#MC_2D_integral((x,y)->10-x^2-y^2,domain2, 0,1,0,1,10^6)

# MC integration with normally distributed sampling
# N = 10^3
# z = 1.1
# std_var = Normal(0, 1)
# sample = rand(std_var, N)
# Y = Int.(sample .<= z)
# println(mean(Y) - cdf(std_var, z))


function bocau(f,N,filename)
  std_var = Normal(0, 1)
  uni_var = Uniform(-4, 4)
  normal_sample  = rand(std_var, N)
  uni_sample     = rand(uni_var, N)
  sample = range(-4, 4, length=1000)

  Y = f.(normal_sample) ./ pdf(std_var, normal_sample)

  fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(2*8.63428, 6.4757))
  ax1.vlines(uni_sample, 0, f.(uni_sample), color="blue")
  ax2.vlines(normal_sample, 0, f.(normal_sample), color="blue")
  ax1.plot(sample, f.(sample),  linestyle="-", linewidth=1.2,color="red")
  ax2.plot(sample, f.(sample),  linestyle="-", linewidth=1.2, color="red")
  ax1.plot(uni_sample, zeros(N), marker="o", markersize=2, linestyle="", color="black")
  ax2.plot(normal_sample, zeros(N), marker="o", markersize=2, linestyle="", color="black")
  #ax.set_ylim(bottom=0)
  plt.savefig(filename, bbox_inches="tight")
  return mean(Y)
end

N = 10^2
pii = MC_definite_integral_uniform(x -> (1 + x^2) * exp(-x^4 / 4), -4, 4, N)
res = bocau(x->(1+x^2)*exp(-x^4/4),N,"mc_integral.pdf")

exact_res,error=quadgk(x -> (1 + x^2) * exp(-x^4 / 4), -4, 4)
println(abs(exact_res-res))
println(abs(exact_res-pii))