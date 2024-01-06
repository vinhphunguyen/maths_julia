using PrettyTables
using Plots
using LaTeXStrings
using PyCall



plt = pyimport("matplotlib.pyplot")
pat = pyimport("matplotlib.patches")

function do_plot(f,a,b,n)

	ta      = a:0.001:b
	sin1    = zeros(length(ta))


	for i=1:length(ta)
		t     = ta[i]
		sin1[i] = f(t)
	end

	fig = plt.figure(figsize=(5,5))
	ax = fig.add_subplot(1, 1, 1)

#spine placement data centered
# ax.spines["left"].set_position(("data", 0.0))
# ax.spines["bottom"].set_position(("data", 0.0))
# ax.spines["right"].set_color("none")
# ax.spines["top"].set_color("none")

	ax.spines["right"].set_visible(false)
	ax.spines["top"].set_visible(false)
	ax.xaxis.set_ticks_position("bottom")

	fig.text(0.9, 0.05, L"$x$")
    fig.text(0.1, 0.9, L"$y$")

	#ax.fill_between(ta, 0, sin1)
	delta = (b-a)/n
	for i=1:n
	    x1 = a + (i-1)*delta
	    y1 = 0
	    x2 = x1 
	    x3 = x1+delta
	    y2 = f(x3) #f(x1)
	    y3 = y2
	    x4 = x3
	    y4 = 0
		verts=[x1 y1; x2 y2; x3 y3; x4 y4]
		poly = pat.Polygon(verts, facecolor="0.9", edgecolor="0.5")
		ax.add_patch(poly)
    end

	plt.plot(ta,sin1,color="red",linewidth=2)
	# plt.plot(ta,sin2,label=L"$\cos x$",color="black")
	# tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
	# labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
	# plt.xticks(tick_pos, labels)
	# plt.yticks(-1:0.5:1)
	# plt.legend(loc="upper right")
	ax.set_xticks((a, b))
    ax.set_xticklabels((L"$a$", L"$b$"))
    ax.set_yticks([])
    ax.set_ylim(bottom=0)
	plt.savefig("plot-calculus-area.pdf",bbox_inches="tight")
end

function do_plot_area(f,a,b)

	ta1     = a:0.001:10
	ta2     = a:0.001:b
	f1      = zeros(length(ta1))
	f2      = zeros(length(ta2))

	for i=1:length(ta1)
		t     = ta1[i]
		f1[i] = f(t)
	end

	for i=1:length(ta2)
		t     = ta2[i]
		f2[i] = f(t)
	end

	fig = plt.figure(figsize=(3,2))
	ax = fig.add_subplot(1, 1, 1)

	ax.spines["right"].set_visible(false)
	ax.spines["top"].set_visible(false)
	ax.xaxis.set_ticks_position("bottom")

	fig.text(0.9, 0.05, L"$x$")
    fig.text(0.1, 0.9, L"$y$")
    fig.text(0.5, 0.2, L"$y=\frac{1}{x^2}$")

	ax.fill_between(ta2, 0, f2,alpha=0.2)

	plt.plot(ta1,f1,color="red",linewidth=1.5)
	# plt.plot(ta,sin2,label=L"$\cos x$",color="black")
	# tick_pos= [-2*pi,-1.5*pi,-pi,-0.5*pi,0, pi/2, pi ,1.5*pi, 2*pi]
	# labels = [L"-2\pi",L"-3\pi/2",L"$-\pi$",L"$-\pi/2$","0", L"$\pi/2$", L"$\pi$",L"3\pi/2",L"2\pi"]
	# plt.xticks(tick_pos, labels)
	# plt.yticks(-1:0.5:1)
	# plt.legend(loc="upper right")
	ax.set_xticks((a, b))
    ax.set_xticklabels((L"1", L"9"))
    ax.set_yticks([])
    ax.set_ylim(bottom=0)
	plt.savefig("plot-improper-3.pdf",bbox_inches="tight")
end

function ff(x)
 1/x^2
end

do_plot_area(ff,1,9)

