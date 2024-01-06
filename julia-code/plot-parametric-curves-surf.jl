using Plots
using ColorSchemes
using LinearAlgebra

import PyPlot

t=0:pi/200:7*pi
x=sin.(t)
y=cos.(t)

pyplot()
plot3d(x,y,t,lw=2,leg=false)
#savefig("helix.pdf")
