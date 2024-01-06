using Plots
using LaTeXStrings
using PrettyTables
using PyCall
using DataFrames
using CSV
using Distributions
using StatsBase
using Random


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
	width_pt = 468.
	inches_per_pt = 1 / 72.27
	golden_ratio = 0.75
	fig_width_in = width_pt * inches_per_pt # Figure width in inches
	fig_height_in = fig_width_in * golden_ratio
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end


function do_plot(N,bin_wdith,filename,density,sum)
    faces = 1:6

    if sum == 1
      dice  = [ rand(faces) + rand(faces) for _ in 1:N ]
    else
      dice  = [ rand(faces) * rand(faces) for _ in 1:N ]
    end

    xmin = minimum(dice)
	xmax = maximum(dice)

	n    = Int( floor( (xmax-xmin)/bin_wdith ) )

	fig , ax = plt.subplots(1, 1, figsize=set_size())
	if sum == 1
	  ax.hist(dice,bins=range(2, 13), align="left", rwidth=0.9,density=density)
	else
	  ax.hist(dice,bins=range(1, 36), align="left", rwidth=0.9,density=density)
	end

	#sns.histplot(data=dice, binwidth=1.2,stat="density", ax=ax)
	#ax.hist(train[!,:Father],bins=n,density=density)

	#sns.histplot(data=train[!,:Father], stat="probability", ax=ax)
	#sns.ecdfplot(data=train[!,:Father], ax=ax)

    plt.xlabel("Product of two dice")
    plt.ylabel("Frequency")

	# ax.spines["right"].set_visible(false)
	# ax.spines["top"].set_visible(false)
	# ax.xaxis.set_ticks_position("bottom")
	# #ax.xaxis.set_major_formatter(mpl.ticker.FormatStrFormatter("%d"))
	#ax.set_xticks([1,2,3,4,5,6,7,8,9,10,11,12])
	# ax.set_yticks([0,0.25,0.5])

	# fig.text(0.9, 0.05, L"$x$")
 #    fig.text(0.1, 0.9, L"$P_X(x)$")


	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
    ax.set_ylim(bottom=0)
	plt.savefig(filename,bbox_inches="tight")
end


# do_plot(50,1.1,"CLT_n50_prod.pdf",1,0)
# do_plot(1000,1.1,"CLT_n1000_prod.pdf",1,0)
# do_plot(5000,1.1,"CLT_n5000_prod.pdf",1,0)
# do_plot(10000,1.1,"CLT_n10000_prod.pdf",1,0)

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

function do_plot3(n,N,width,filename)
	dist = Uniform(1.,2.)
	#dist = Exponential(1.)
	μ    = mean(dist)
	σ    = std(dist)
    norm = Normal(μ,σ/sqrt(n))

    Random.seed!(1234)
	data = [mean(rand(dist,n)) for _ in 1:N]
	lb   = minimum(data)
	ub   = maximum(data)
	nb   = Int( floor( (ub-lb)/width ) )


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
# do_plot3(5,N,0.02,"CLT_Exponential5.pdf")
# do_plot3(10,N,0.02,"CLT_Exponential10.pdf")
#do_plot3(30,N,0.01,"CLT_Exponential30.pdf")



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

generate_cdf_std_normal_table()
