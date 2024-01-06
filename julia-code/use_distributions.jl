using Plots
using LaTeXStrings
using PyCall
using StatsBase
using Distributions
#using Statistics

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



function do_plot(filename)

     xGrid = -5:.01:5
     normal_dist = Normal()
     normalPDF(z) = pdf(normal_dist,z)
 
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
	#ax.set_xticks([0,1,2])
	#ax.set_yticks([0,0.25,0.5])


	plt.plot(xGrid,normalPDF.(xGrid),color="red")
	plt.ylim(bottom=0)

	# filled area
	xbar = mean(normal_dist)
	sig  = std(normal_dist)
	pt1l = xbar - sig
	pt1r = xbar + sig
	pt2l = xbar - 2*sig
	pt2r = xbar + 2*sig
	pt3l = xbar - 3*sig
	pt3r = xbar + 3*sig
	#plt.plot([pt1l,pt1l],[0,normalPDF(pt1)],color="blue")
	#plt.plot([pt1r,pt1r],[0,normalPDF(pt2)],color="blue")
	a   = range(pt1l,pt1r,step=0.01)
	b1l = range(pt2l,pt1l,step=0.01)
	b1r = range(pt1r,pt2r,step=0.01)
	b2l = range(pt3l,pt2l,step=0.01)
	b2r = range(pt2r,pt3r,step=0.01)

	plt.fill_between(a, normalPDF.(a), color="yellow", alpha=1.)
	plt.fill_between(b1l, normalPDF.(b1l), color="orange", alpha=1.)
	plt.fill_between(b1r, normalPDF.(b1r), color="orange", alpha=1.)
	plt.fill_between(b2l, normalPDF.(b2l), color="orange", alpha=.5)
	plt.fill_between(b2r, normalPDF.(b2r), color="orange", alpha=.5)

	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
	plt.savefig(filename,bbox_inches="tight")
end

function do_plot2(filename)

     xGrid        = -5:.01:7
     normal_dist1 = Normal(0,1)
     normal_dist2 = Normal(2,2)
     normalPDF1(z) = pdf(normal_dist1,z)
     normalPDF2(z) = pdf(normal_dist2,z)
 
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
	#ax.set_xticks([0,1,2])
	#ax.set_yticks([0,0.25,0.5])

	xbar1 = mean(normal_dist1)
	xbar2 = mean(normal_dist2)

	plt.plot(xGrid,normalPDF1.(xGrid),color="red",label=L"N(0,1)")
	plt.plot(xGrid,normalPDF2.(xGrid),color="blue",label=L"N(2,2)")
	plt.plot([xbar1, xbar1],[0, normalPDF1(xbar1)],"b
		--",linewidth=0.8)
	plt.plot([xbar2 ,xbar2],[0, normalPDF2(xbar2)],"b--",linewidth=0.8)
	plt.ylim(bottom=0)
	plt.legend()

	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
	plt.savefig(filename,bbox_inches="tight")
end

function do_plot3(filename)

     xGrid        = -7:.01:7
     normal_dist1 = Normal(0,2)
     normalPDF1(z) = pdf(normal_dist1,z)
     normalCDF1(z) = cdf(normal_dist1,z)
 
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
	#ax.set_xticks([0,1,2])
	#ax.set_yticks([0,0.25,0.5])

	xbar1 = mean(normal_dist1) + 1*std(normal_dist1)

	plt.plot(xGrid,normalPDF1.(xGrid),color="red",label=L"N(0,1)")
	plt.plot([xbar1, xbar1],[0, normalPDF1(xbar1)],"b--",linewidth=0.8)


     a   = range(-7,xbar1,step=0.01)

	plt.fill_between(a, normalPDF1.(a), color="yellow", alpha=1.)

	plt.ylim(bottom=0)
	ax.set_xticks([])
	ax.set_yticks([])
	#plt.legend()

	#ax.set_xticks((a, b))
    #ax.set_xticklabels((L"$a$", L"$b$"))
    #ax.set_yticks([])
	plt.savefig(filename,bbox_inches="tight")
end

#do_plot("68_95_99_rule.pdf")
#do_plot2("normal_dist_scaling.pdf")
do_plot3("normal_CDF1.pdf")