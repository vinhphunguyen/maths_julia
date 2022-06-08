using Plots
using LaTeXStrings
using PyCall
using StatsBase


mpl = pyimport("matplotlib")
plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")
sns = pyimport("seaborn")

sns.set_style("ticks") # dark_background, 

rcParams = PyDict(mpl["rcParams"])
rcParams["font.size"] = 16
rcParams["text.usetex"] = 1
rcParams["font.family"] = "serif"
rcParams["axes.labelsize"] = 16
rcParams["legend.fontsize"] = 16
rcParams["xtick.labelsize"] = 16
rcParams["ytick.labelsize"] = 16

function set_size(scale=1)
	width_pt = 468.
	inches_per_pt = 1 / 72.27
	golden_ratio = 0.75
	fig_width_in  = scale * width_pt * inches_per_pt # Figure width in inches 
	fig_height_in = fig_width_in * golden_ratio 
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end

function do_plot(n)

    xs  = [0,1,2]
    ys  = [1/4,1/2,1/4]
	fig , ax = plt.subplots(1, 1, figsize=set_size())

#spine placement data centered
# ax.spines["left"].set_position(("data", 0.0))
# ax.spines["bottom"].set_position(("data", 0.0))
# ax.spines["right"].set_color("none")
# ax.spines["top"].set_color("none")

	ax.spines["right"].set_visible(false)
	ax.spines["top"].set_visible(false)
	ax.xaxis.set_ticks_position("bottom")
	#ax.xaxis.set_major_formatter(mpl.ticker.FormatStrFormatter("%d"))
	ax.set_xticks([0,1,2])
	ax.set_yticks([0,0.25,0.5])

	fig.text(0.9, 0.05, L"$x$")
    fig.text(0.1, 0.9, L"$P_X(x)$")

	plt.plot(xs,ys,color="red","o")
	plt.vlines(xs,0,ys)
	plt.ylim(bottom=0)

	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
    ax.set_ylim(bottom=0)
	plt.savefig("probability-distribution1.pdf",bbox_inches="tight")
end

function do_bar_plot(n)

    xs  = [0,1,2]
    ys  = [1/4,1/2,1/4]
	  fig , ax = plt.subplots(1, 1, figsize=set_size())

	  ax.set_xticks([0,1,2])
	  ax.set_yticks([0,0.25,0.5])

    plt.bar(xs, ys, color ="maroon", width = 0.4)
    plt.xlabel(L"$x$")
    plt.ylabel(L"$P_X(x)$")
	  plt.savefig("probability-distribution1-bar.pdf",bbox_inches="tight")
end

function do_cumulative_distribution_plot(n)

    function cdf(x)
      if x < 0 return 0. end
      if ( x < 1) && ( x >= 0) return 0.25 end
      if ( x < 2) && ( x >= 1) return 0.75 end
      if ( x >= 2) return 1.00 end
    end
    xs  = range(-1,4,n)
	  fig , ax = plt.subplots(1, 1, figsize=set_size())

	  ax.set_xticks([0,1,2,3])
	  ax.set_yticks([0,0.25,0.50,0.75,1.00])
    plt.plot(xs,map(cdf,xs),color="black",".")
    plt.scatter(0,0.,color="red",facecolors="none")
    plt.scatter(1,0.25,color="red",facecolors="none")
    plt.scatter(2,0.75,color="red",facecolors="none")
    plt.scatter(1,0.75,color="red")
    plt.scatter(2,1.00,color="red")
    plt.scatter(0,0.25,color="red")
    plt.xlabel(L"$x$")
    plt.ylabel(L"$F_X(x)$")
	  plt.savefig("probability-cfd.pdf",bbox_inches="tight")
end

function plot_binomial_distribution(n,p,filename)

    xs  = range(1,n,step=1)
    ys  = zeros(length(xs))
    ys  = zeros(length(xs))
    for i =1:n
      ys[i] = binomial(big(n),i)*(p)^(i)*(1-p)^(n-i)
    end
	fig , ax = plt.subplots(1, 1, figsize=set_size())

	ax.spines["right"].set_visible(false)
	ax.spines["top"].set_visible(false)
	ax.xaxis.set_ticks_position("bottom")
	#ax.xaxis.set_major_formatter(mpl.ticker.FormatStrFormatter("%d"))
	ax.set_xticks([0,20,40,60,80,100])
	#ax.set_yticks([0,0.25,0.5])


	fig.text(0.9, 0.05, L"$x$")
    fig.text(0.1, 0.9, L"$P_X(x)$")

	plt.plot(xs,ys,color="red","o")
	plt.vlines(xs,0,ys)
	plt.ylim(bottom=0)
	plt.xlim([0,100])

	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
	plt.savefig(filename,bbox_inches="tight")
end

function plot_geometric_distribution(n,p,filename)

    xs  = range(1,n,step=1)
    ys  = zeros(length(xs))
    for i =1:n
      ys[i] = (1-p)^(i-1)*p
    end
	fig , ax = plt.subplots(1, 1, figsize=set_size())

	ax.spines["right"].set_visible(false)
	ax.spines["top"].set_visible(false)
	ax.xaxis.set_ticks_position("bottom")
	#ax.xaxis.set_major_formatter(mpl.ticker.FormatStrFormatter("%d"))
	ax.set_xticks(xs)
	#ax.set_yticks([0,0.25,0.5])

	fig.text(0.9, 0.05, L"$x$")
    fig.text(0.1, 0.9, L"$P_X(x)$")

	plt.plot(xs,ys,color="red","o")
	plt.vlines(xs,0,ys)
	plt.ylim(bottom=0)

	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
    ax.set_ylim(bottom=0)
	plt.savefig(filename,bbox_inches="tight")
end

#do_plot(ff,1,9,100)
#do_bar_plot(100)
#plot_geometric_distribution(14,0.3,"plot_geometric_distribution.pdf")
#do_cumulative_distribution_plot(100)

plot_binomial_distribution(20,0.4,"plot_binomial_distribution20.pdf")
plot_binomial_distribution(50,0.4,"plot_binomial_distribution50.pdf")
plot_binomial_distribution(100,0.4,"plot_binomial_distribution100.pdf")


##################################
# BIRTHDAY PROBLEM
##################################

exact_sol(n) = 1 - prod([k/365 for k in 365:-1:365-n+1])

function birthday_event(n)
  birthday_a_year      = 1:365
  birthdays_n_pers     = [rand(birthday_a_year) for _ in 1:n]
  birthdays_occurences = counts(birthdays_n_pers)
  return maximum(birthdays_occurences) > 1 
end

N = 10^5

function birthday_experiment(n)
  return sum([birthday_event(n) for _ in 1:N])/N
end

xs  = 1:50

ys1 = [exact_sol(n) for n in xs]
ys2 = [birthday_experiment(n) for n in xs]

fig , ax = plt.subplots(1, 1, figsize=set_size(1.2))

ax.spines["right"].set_visible(false)
ax.spines["top"].set_visible(false)
ax.xaxis.set_ticks_position("bottom")
#ax.xaxis.set_major_formatter(mpl.ticker.FormatStrFormatter("%d"))
#ax.set_xticks(xs)
#ax.set_yticks([0,0.25,0.5])

plt.plot(xs,ys1,color="red","o",label="exact")
plt.plot(xs,ys2,color="black",label="experiment")
plt.ylim(bottom=0)
plt.legend()
plt.xlabel(L"$n$")
plt.ylabel(L"$P(n)$")
#ax.set_xticks((a, b))
#ax.set_xticklabels((L"$a$", L"$b$"))
#ax.set_yticks([])
ax.set_ylim(bottom=0)
plt.savefig("birthday-problem.pdf",bbox_inches="tight")

println("Probability of shared birthday for 23 is: $(birthday_experiment(23))")

println("Probability of shared birthday for 50 is: $(birthday_experiment(50))")


function plot_binomial_distribution_normal(n,p,filename)

    xs  = range(1,n,step=1)
    ys  = zeros(length(xs))
    ys  = zeros(length(xs))
    for i =1:n
      ys[i] = binomial(big(n),i)*(p)^(i)*(1-p)^(n-i)
    end

    bmax = 2/sqrt(2*pi*n)
    moivre_x = [ i+n/2 for i = 0:n]
    moivre_y = [ bmax*exp(-2*i^2/n) for i = 0:n]

	fig , ax = plt.subplots(1, 1, figsize=set_size())

	ax.spines["right"].set_visible(false)
	ax.spines["top"].set_visible(false)
	ax.xaxis.set_ticks_position("bottom")
	#ax.xaxis.set_major_formatter(mpl.ticker.FormatStrFormatter("%d"))
	#ax.set_xticks([0,20,40,60,80,100])
	#ax.set_yticks([0,0.25,0.5])

	plt.bar(xs, ys, color ="blue", width = 1.)
	plt.plot(moivre_x, moivre_y, color ="red",label="normal curve")
    plt.xlabel(L"$x$")
    plt.ylabel(L"$P_X(x)$")
	plt.ylim(bottom=0)
	plt.xlim([0,n])
    plt.legend()
	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
	plt.savefig(filename,bbox_inches="tight")
end

#plot_binomial_distribution_normal(100,0.5,"binomial_vs_moivre.pdf")

function do_bar_plots(filename)

    xs  = [0]
    ys  = [1]
    xs1 = [-1, 1]
    ys1=[0.5,0.5]

    ys2=[1/4,1/4,1/4,1/4]
    xs2=[-5,-3,3,5]
	fig , ax = plt.subplots(1, 1, figsize=set_size())

	ax.set_xticks([-5,-4,-3,-2,-1,0,1,2,3,4,5])
	  #ax.set_yticks([0,0.25,0.5])

    plt.bar(xs, ys, color ="maroon", width = 0.4, label="dist1")
    plt.bar(xs1, ys1, color ="blue", width = 0.4,label="dist2")
    plt.bar(xs2, ys2, color ="red", width = 0.4,label="dist3")
    plt.xlabel(L"$x$")
    plt.ylabel(L"$P_X(x)$")
    plt.legend()
	plt.savefig(filename,bbox_inches="tight")
end

do_bar_plots("probabilities_same_ex.pdf")
