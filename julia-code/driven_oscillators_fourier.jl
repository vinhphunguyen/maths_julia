using PrettyTables
using Plots
using LaTeXStrings

omega0  = 2*pi
T0      = omega0/2/pi
T       = 1.5*T0 # perid of the rectangular pulse
deltaT  = 0.25   # duration of the pulse
fmax    = 1.0    # amplitude of the pulse
omegaf  = 2*pi/T 

n       = 5   # number of Fourier terms -1 
an      = zeros(n)
An      = zeros(n)
an[1]   = fmax*deltaT/T

for i=1:n-1
  an[i+1] = ((2*fmax)/(pi*i))*sin((pi*i*deltaT)/T)
end

ta    = 0:0.01:3
ft    = zeros(length(ta))
xp    = zeros(length(ta))

for i=1:length(ta)
  t     = ta[i]
  #ft[i] = a0
  for j=1:n
    ft[i] += an[j]*cos(j*omegaf*t)
  end
end

pyplot()
plot(ta,ft,legend=false,xlabel=L"t",ylabel=L"f(t)")
savefig("rectangular-pulse-3terms.pdf")

# 

beta  = 0.2
x0    = 0.0
v0    = 0.0


# omega0d = sqrt(omega0^2-beta^2)
# A       = f0 / sqrt( (omega0^2-omega^2)^2 + 4*omega^2*beta)
# delta   = atan(2*omega*beta/(omega0^2-omega^2))
# theta   = atan( (omega*A*sin(delta)-v0-beta*(x0-A*cos(delta)))/(omega0d*(x0-A*cos(delta))) )
# B       = (x0-A*cos(delta)) / cos(theta)

# xp    = zeros(length(ta))
# xh    = zeros(length(ta))

for i=1:length(ta)
	t     = ta[i]
	#xh    =  B*exp(-beta*t)*cos(omega0d*t+theta)
	for j=0:n-1
	    omega = j*omegaf
      A       = an[j+1] / sqrt( (omega0^2-omega^2)^2 + 4*omega^2*beta)
      An[j+1] = A
      delta   = atan(2*omega*beta/(omega0^2-omega^2))
	    xp[i]  +=  A*cos(omega*t-delta)
    end
end

pyplot()
pf=plot(ta,xp,legend=false,xlabel=L"t",ylabel=L"f(t)")
savefig("driven-weakly-damped-rectangle-pulse.pdf")
