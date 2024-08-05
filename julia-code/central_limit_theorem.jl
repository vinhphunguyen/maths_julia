using Plots, LaTeXStrings, PrettyTables
using PyCall,  DataFrames
using CSV, Distributions
using StatsBase, Random, DSP, Statistics


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

function set_size()
	width_pt = 468/1.5
	inches_per_pt = 1 / 72.27
	golden_ratio = 0.75
	fig_width_in = width_pt * inches_per_pt # Figure width in inches
	fig_height_in = fig_width_in * golden_ratio
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end

# CLT from sum of throwing n dice
function do_plot_sum_of_n_dice(n,N,bin_width,filename,density)
    Random.seed!(1234)
	faces = 1:6
    dice  = [sum(rand(faces,n))  for _ in 1:N ]
    xmin = Float64(minimum(dice))
	xmax = maximum(dice)
	#nbins = Int( floor( (xmax-xmin)/bin_width ) )
	nbins = collect(n:6n+1) .- 0.5
	fig , ax = plt.subplots(1, 1, figsize=set_size())
    ax.hist(dice, bins=nbins, rwidth=0.9, density=density, facecolor="orange", edgecolor="b", label="n=$n")
	#sns.histplot(data=dice,stat="density", ax=ax)
	#ax.hist(train[!,:Father],bins=n,density=density)
	#sns.histplot(data=train[!,:Father], stat="probability", ax=ax)
	#sns.ecdfplot(data=train[!,:Father], ax=ax)
    plt.xlabel("Sum of dices")
    plt.ylabel("Frequency")
    plt.legend()
    ax.set_ylim(bottom=0)
	plt.savefig(filename,bbox_inches="tight")
end

N = 2e4

# do_plot_sum_of_n_dice(50,N,1.1,"CLT_n50_prod.pdf",1)
# do_plot_sum_of_n_dice(1000,N,1.1,"CLT_n1000_prod.pdf",1)
# do_plot_sum_of_n_dice(5000,N,1.1,"CLT_n5000_prod.pdf",1)
# do_plot_sum_of_n_dice(10000,N,1.1,"CLT_n10000_prod.pdf",1)

function do_plot2(n,N,filename)
	train =  DataFrame(CSV.File("pennies.csv"))
	first(train,5)
    # determine the age & compute its mean/std
	age      = 2022 .- train[:,:Year]
	mean_age = mean(age)
	std_age  = std(age)

	sample_size = (5,10,20,30)
	table       = zeros(5,4)
	table[:,1]  = [1,5,10,20,30]
	table[1,2]  = mean_age
	table[1,3]  = std_age
	table[1,4]  = std_age

	for (index, value) in enumerate(sample_size)
		Random.seed!(1234)
		data = [mean(shuffle(age)[1:value]) for _ in 1:N]
		#data = [mean(rand(age,value)) for _ in 1:N]
		mean_data = mean(data)
		std_data  = std(data)
		table[index+1,2]= mean_data
		table[index+1,3]= std_data
		table[index+1,4]= std_age/sqrt(value)
    end
    pretty_table(table, ["Sample size", "mean", "Standard deviation","dd"],formatters = ft_printf("%5.8f"))
    pretty_table(table, ["Sample size", "mean", "Standard deviation","dd"], backend = :latex,formatters = ft_printf("%5.8f",[2,3]))

	# fig , ax = plt.subplots(1, 1, figsize=set_size())

	# #sns.histplot(data=age, ax=ax)
	# sns.distplot(data)
	# #sns.ecdfplot(data=train[!,:Father], ax=ax)

 #    plt.xlabel("Pennies age")
 #    plt.ylabel("Frequency")
 #    plt.savefig(filename,bbox_inches="tight")
end

#do_plot2(5,20000,"CLT_pennie_age5.pdf")

# plot the histogram of the mean of n random variables
# with distribution 'dist'
# and compare with the corresponding normal distribution
function do_plot_sum_of_n_distribution(dist,n,N,width,filename)
	μ    = mean(dist)
	σ    = std(dist)
    Random.seed!(1234)
	data = [mean(rand(dist,n)) for _ in 1:N]
	lb   = minimum(data)
	ub   = maximum(data)
	nb   = Int( floor( (ub-lb)/width ) )

    norm = Normal(μ, σ / sqrt(n))
    evalNom(z) = pdf(norm,z)
    xgrid  = 1.2:0.01:2

	fig , ax = plt.subplots(1, 1, figsize=set_size())
	ax.hist(data, bins=nb,align="left", rwidth=0.9,density=1)
	plt.plot(xgrid,evalNom.(xgrid),color="red")

    #plt.xlabel("Product of two dice")
    #plt.ylabel("Frequency")
    plt.yticks(range(0, 8, step=1))
    plt.xticks(range(1.2, 2, step=0.2))
    ax.set_ylim(bottom=0)
	plt.savefig(filename,bbox_inches="tight")
end
N = 2e4

dist = Exponential(1.)

# do_plot_sum_of_n_distribution(dist,5,N,0.02,"CLT_Exponential5.pdf")
# do_plot_sum_of_n_distribution(dist,10,N,0.02,"CLT_Exponential10.pdf")
# do_plot_sum_of_n_distribution(dist,30,N,0.01,"CLT_Exponential30.pdf")

# table for the CDF of the normal distribution 
function generate_cdf_std_normal_table()
	dist = Normal()
	ϕ(z) = cdf(dist,z)
	decimals = (.0,.01,.02,.03,.04,.05,.06,.07,.08,.09)
	main     = 0:0.1:3.4
	table    = zeros(length(main),length(decimals)+1)
	table[:,1] = main
	for (j, jval) in enumerate(decimals)
		for (i, ival) in enumerate(main)
		  z    = ival + jval
		  phiz = ϕ(z)
		  table[i,j+1] = phiz
		end
	end
    pretty_table(table, ["X", "0.00", "0.01","0.02","0.03","0.04","0.05","0.06","0.07","0.08","0.09"],formatters = ft_printf("%5.4f"))
    pretty_table(table, ["X", "0.00", "0.01","0.02","0.03","0.04","0.05","0.06","0.07","0.08","0.09"], backend = :latex,formatters = ft_printf("%5.4f"))
end

#generate_cdf_std_normal_table()

function do_plot_sum_of_n_dice_exact(filename)
    fig, ax = plt.subplots(1, 1, figsize=set_size())
    a = [0, 1, 1, 1, 1, 1, 1,0]
	b2 = (1/6^2) * conv(a,a)
	b3 = (1/6^3) * conv(conv(a,a),a)
	b4 = (1/6^4) * conv(conv(conv(a,a),a),a)
    xgrid2 = 0:6*2+2
    xgrid3 = 0:6*3+3
    xgrid4 = 0:6*4+4
    #plt.plot(xgrid, evalNom.(xgrid), color="red")
    plt.plot(xgrid2, b2, color="black",label="2 dice")
    plt.plot(xgrid3, b3, color="red",label="3 dice")
    plt.plot(xgrid4, b4, color="blue",label="4 dice")
    plt.xlabel("Sum of dices")
    plt.ylabel("Frequency")
	plt.legend()
    ax.set_ylim(bottom=0)
    plt.savefig(filename, bbox_inches="tight")
end
#do_plot_sum_of_n_dice_exact("sum_n_dice_exact.pdf") 

function plot_law_of_large_number( N, filename)
    Random.seed!(1234)
    faces = 1:6
    sdice = [rand(faces) for _ in 1:N]
    sdice = cumsum(sdice)
	dice  = [ sdice[i]/i for i in 1: N]
	xgrid = 1:N
    fig, ax = plt.subplots(1, 1, figsize=set_size())
    plt.plot(xgrid, dice, color="black")
	plt.xlabel(L"n")
    plt.ylabel("Mean value")
	plt.axhline(y=3.5, color="red", linestyle="-")
    ax.set_ylim(bottom=2)
    plt.savefig(filename, bbox_inches="tight")
end
N = 6000
plot_law_of_large_number(N, "law_large_number.pdf")

# plot two binomial distributions with same expected value but 
# different variance on the same plot using distributions.jl 

function plot_2_binomial(filename)
	fig, ax = plt.subplots(1, 1, figsize=set_size())
	μ1 = 0.; σ1  = 1.0
	μ2 = 3.5; σ2 = 4.0
	normal1=Normal(μ1,σ1)
	normal2=Normal(μ2,σ2)	
	# Generate random samples from the binomial distribution
	samples1 = rand(normal1, 1000)
	samples2 = rand(normal2, 1000)
    ax.hist(samples1, bins=20, density=1, facecolor="orange", edgecolor="b", label="n=$n1")
    ax.hist(samples2, bins=30, align="left", alpha=0.7, density = 1, facecolor="yellow", edgecolor="b", label="n=$n1")
	plt.savefig(filename, bbox_inches="tight")
end
function do_plot_sum_of_n_distribution(dist, n, N, width, filename)
    μ = mean(dist)
    σ = std(dist)
    Random.seed!(1234)
    data = [mean(rand(dist, n)) for _ in 1:N]
    lb = minimum(data)
    ub = maximum(data)
    nb = Int(floor((ub - lb) / width))

    norm = Normal(μ, σ / sqrt(n))
    evalNom(z) = pdf(norm, z)
    xgrid = 1.2:0.01:2

    fig, ax = plt.subplots(1, 1, figsize=set_size())
    ax.hist(data, bins=nb, align="left", rwidth=0.9, density=1)
    plt.plot(xgrid, evalNom.(xgrid), color="red")

    #plt.xlabel("Product of two dice")
    #plt.ylabel("Frequency")
    plt.yticks(range(0, 8, step=1))
    plt.xticks(range(1.2, 2, step=0.2))
    ax.set_ylim(bottom=0)
    plt.savefig(filename, bbox_inches="tight")
end

