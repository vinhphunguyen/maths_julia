using Plots
using LaTeXStrings
using Printf
using LinearAlgebra
using PyCall

# Euler method to solve simple harmonic oscilation

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

function main_func()
    L = 1.
	d = L/3
	h = 0.4


	c = 0.5

	N = 8

	function An(n)
      return 2*h*L^2/(n^2*π^2*d*(L-d))*sin(d*n*π/L)
	end

	time      = 6. # 3.0 # 3 years or 3 periods
	dt        = 0.01
	stepCount = Int32(floor(time/dt))

    x         = 0:0.01:L
	u         = zeros(length(x))

	anim = @animate for n in 1:stepCount
		# the whole plot
		plot(;size=(400,400), axisratio=:equal, legend=false)
		xlims!(0,1)
		ylims!(-h,h)

        t  = n*dt
	    for (j,xs) in enumerate(x)
			s  = 0.
	        for i=1:N
	          s+= An(i)*cos(i*pi*c*t/L)*sin(i*pi*xs/L)
			end
			u[j] = s
		end

		plot!(x,u,axisratio=:equal,color="red")
		# then the control points (no joining)
		end
		#filename = string("bezier","$(Int(c)).pdf")
		#savefig(filename)

	gif(anim, "guitar_fourier.gif", fps=30)

end

function sine_wave()
	A = 1.0
	c = 1.0
	λ = 1.0

	xa = 0:0.01:3*λ
	xa2 = 0+λ:0.01:3*λ+λ
    ya  = zeros(length(xa))
    ya2 = zeros(length(xa2))

	t = 0.
	for i=1:length(xa)
		x      = xa[i]
		ya[i]  = A*sin((2*π/λ)*(x-c*t))
		tt     = 1.0
		ya2[i] = A*sin((2*π/λ)*(xa2[i]-c*tt))
	end

	fig , ax = plt.subplots(2, figsize=set_size())
	ax[1].plot(xa,ya,color="black")
	ax[2].plot(xa2,ya2,color="black")
	plt.xlabel(L"x")
	plt.ylabel(L"y(x,t)")
	#plt.ylim(bottom=0)
	custom_xlim = (0, 4)

# Setting the values for all axes.
    plt.setp(ax, xlim=custom_xlim)
	ax[1].grid()
	ax[2].grid()
	#plt.show()
	plt.savefig("sine-wave.pdf",bbox_inches="tight")
end

function beat()
	A = 1.0
	ω0 = 10.
	ϵ = 5.

	ta = 0:0.01:2*π
    xa = zeros(length(ta))
    xa1 = zeros(length(ta))
    xa2 = zeros(length(ta))

	t = 0.
	for i=1:length(ta)
		t      = ta[i]
		xa[i]  = A*sin(ϵ*t)*sin(ω0*t)
		xa1[i]  = A*sin(ϵ*t)
		xa2[i]  = A*sin(ω0*t)
	end

	fig , ax = plt.subplots(1, figsize=set_size())
	ax.plot(ta,xa1,color="black",label=L"+A\sin(\epsilon t)")
	ax.plot(ta,-xa1,color="blue",label=L"-A\sin(\epsilon t)")
	ax.plot(ta,xa,color="red",label=L"A\sin(\epsilon t)\sin(\omega_0 t)")
	plt.xlabel(L"t")
	plt.ylabel(L"x(t)")
	#plt.ylim(bottom=0)
	#custom_xlim = (0, 4)
    #plt.setp(ax, xlim=custom_xlim)
	ax.grid()
	#ax[2].grid()
	plt.legend(bbox_to_anchor=(1,0), loc="lower right",
                bbox_transform=fig.transFigure, ncol=3)
	plt.savefig("sine-wave1.pdf",bbox_inches="tight")
end

function beat1()
	A = 1.0
	ω0 = 10.
	ϵ = 1.

	ta = 0:0.01:2*π
    xa1 = zeros(length(ta))
    xa2 = zeros(length(ta))
    xa11 = zeros(length(ta))
    xa22 = zeros(length(ta))

	t = 0.
	for i=1:length(ta)
		t      = ta[i]
		xa2[i]  = A*sin(ϵ*t)*sin(ω0*t)
		xa22[i]  = A*sin(ϵ*t)
		xa1[i]  = A*cos(ϵ*t)*cos(ω0*t)
		xa11[i]  = A*cos(ϵ*t)
	end

	fig , ax = plt.subplots(2, figsize=set_size())
	ax[1].plot(ta,xa1,color="black",label=L"x_1(t)")
	ax[1].plot(ta,xa11,color="red",label=L"A\cos(\epsilon t)")
	ax[1].plot(ta,-xa11,color="red")
	ax[2].plot(ta,xa2,color="black",label=L"x_2(t)")
	ax[2].plot(ta,xa22,color="red",label=L"A\sin(\epsilon t)")
	ax[2].plot(ta,-xa22,color="red")
    ax[1].set_xlabel(L"t")
    ax[2].set_xlabel(L"t")
    ax[1].set_ylabel(L"x_1(t)")
    ax[2].set_ylabel(L"x_2(t)")
	#plt.ylim(bottom=0)
	#custom_xlim = (0, 4)
    #plt.setp(ax, xlim=custom_xlim)
	ax[1].grid()
	ax[2].grid()
	#ax[2].grid()
	#plt.legend(bbox_to_anchor=(1,0), loc="lower right",            bbox_transform=fig.transFigure, ncol=3)
	plt.savefig("beat.pdf",bbox_inches="tight")
end

function resonance_phase()
    ω0 = 0.5
	beta1 = 0.03*ω0
	beta2 = 0.3*ω0

	ta = 0:0.01:1.
    xa1 = zeros(length(ta))
    xa2 = zeros(length(ta))

	t = 0.
	for i=1:length(ta)
		t      = ta[i]
		xa1[i]  = atan(2*t*beta1,(ω0^2-t^2))
		xa2[i]  = atan(2*t*beta2,(ω0^2-t^2))
	end

	fig , ax = plt.subplots(1, figsize=set_size())
	ax.plot(ta,xa1,color="black",label=L"+A\sin(\epsilon t)")
	ax.plot(ta,xa2,color="blue",label=L"-A\sin(\epsilon t)")
	#plt.ylim(bottom=0)
	#custom_xlim = (0, 4)
    #plt.setp(ax, xlim=custom_xlim)
	ax.grid()
	ax.set_xticklabels([])
	ax.set_yticklabels([])
	#ax[2].grid()
	plt.savefig("sine-wave2.pdf",bbox_inches="tight")
end

@time main_func()
@time sine_wave()
@time beat1()
resonance_phase()
