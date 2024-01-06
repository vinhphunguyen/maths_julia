using Plots
using LaTeXStrings
using PrettyTables
using PyCall
using DataFrames
using CSV
using Distributions
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

function set_size()
	width_pt = 468.
	inches_per_pt = 1 / 72.27
	golden_ratio = 0.75
	fig_width_in = width_pt * inches_per_pt # Figure width in inches 
	fig_height_in = fig_width_in * golden_ratio 
	fig_dim = ( fig_width_in , fig_height_in )
	return fig_dim
end



function do_plot(bin_wdith,filename,density)
	train =  DataFrame(CSV.File("Pearson.csv"))
	size(train) # => (367,12)
	names(train) # => 12-element Vector{String}: "Loand_ID",...
	first(train,5)

	pretty_table(first(train,5), ["Father", "Son"],formatters = ft_printf("%5.8f"))
    pretty_table(first(train,5), ["Father", "Son"], backend = :latex,formatters = ft_printf("%5.2f",[2]))

	xmin = minimum(train[!,:Father])
	xmax = maximum(train[!,:Father])

	n    = Int( floor( (xmax-xmin)/bin_wdith ) )

	fig , ax = plt.subplots(1, 1, figsize=set_size())
	#ax.hist(train[!,:Father],bins=n,normed=density)
	#ax.hist(train[!,:Father],bins=n,density=density)

	#sns.histplot(data=train[!,:Father], stat="probability", ax=ax)
	sns.ecdfplot(data=train[!,:Father], ax=ax)

    plt.xlabel("Father's height")
    plt.ylabel("Cumulative distribution function")

	# ax.spines["right"].set_visible(false)
	# ax.spines["top"].set_visible(false)
	# ax.xaxis.set_ticks_position("bottom")
	# #ax.xaxis.set_major_formatter(mpl.ticker.FormatStrFormatter("%d"))
	# ax.set_xticks([0,1,2])
	# ax.set_yticks([0,0.25,0.5])

	# fig.text(0.9, 0.05, L"$x$")
 #    fig.text(0.1, 0.9, L"$P_X(x)$")


	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
    ax.set_ylim(bottom=0)
	plt.savefig(filename,bbox_inches="tight")
	return train
end

bin_wdith = 1.0
bin_wdith = 0.5

do_plot(bin_wdith,"histogram-bin1.pdf",false)
#do_plot(bin_wdith,"histogram-bin2.pdf",true)



function do_plot_binomial(n,p,filename)

    bDist = Binomial(n,p)
    xGrid = 0:n

    bPmf  = [ pdf(bDist,i) for i in xGrid ]

	fig , ax = plt.subplots(1, 1, figsize=set_size())
	#ax.hist(train[!,:Father],bins=n,normed=density)
	#ax.hist(train[!,:Father],bins=n,density=density)

	plt.bar(xGrid, bPmf, color ="maroon", width = 0.4)
	#sns.ecdfplot(data=train[!,:Father], ax=ax)

    plt.xlabel(L"x")
    plt.ylabel("Probability")

	# ax.spines["right"].set_visible(false)
	# ax.spines["top"].set_visible(false)
	# ax.xaxis.set_ticks_position("bottom")
	# #ax.xaxis.set_major_formatter(mpl.ticker.FormatStrFormatter("%d"))
	# ax.set_xticks([0,1,2])
	# ax.set_yticks([0,0.25,0.5])

	# fig.text(0.9, 0.05, L"$x$")
 #    fig.text(0.1, 0.9, L"$P_X(x)$")


	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
    ax.set_ylim(bottom=0)
	plt.savefig(filename,bbox_inches="tight")
end

do_plot_binomial(10,0.4,"binomial-histogram-10-04.pdf")
do_plot_binomial(5,0.8,"binomial-histogram-5-08.pdf")


function do_plot_spreads(bin_wdith,filename)
	train =  DataFrame(CSV.File("Histograms.csv"))
	dropmissing!(train)
	first(train,5)

	fig , ax1 = plt.subplots(1, 1, figsize=set_size())
	#ax.hist(train[!,:Father],bins=n,normed=density)
	#ax.hist(train[!,:Father],bins=n,density=density)

	sns.histplot(data=train[!,:C], stat="count", ax=ax1)
	#sns.histplot(data=train[!,:C], stat="probability", ax=ax2)
	#sns.ecdfplot(data=train[!,:Father], ax=ax)

    #plt.xlabel("Father's height")
    #plt.ylabel("Cumulative distribution function")

	# ax.spines["right"].set_visible(false)
	# ax.spines["top"].set_visible(false)
	# ax.xaxis.set_ticks_position("bottom")
	# #ax.xaxis.set_major_formatter(mpl.ticker.FormatStrFormatter("%d"))
	ax1.set_xticks([0,20,30,40,50,60,70,80,90])
	#ax2.set_xticks([0,20,30,40,50,60,70,80,90])
	# ax.set_yticks([0,0.25,0.5])

	# fig.text(0.9, 0.05, L"$x$")
 #    fig.text(0.1, 0.9, L"$P_X(x)$")


	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
    #ax.set_ylim(bottom=0)
	plt.savefig(filename,bbox_inches="tight")
	return train
end

do_plot_spreads(1,"histogram-spread2.pdf")
