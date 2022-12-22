import graph;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(8cm, keepAspect=true);
defaultpen(fontsize(16pt));

real h=2;
real w=6;

int ny = 4, nx = 21;

real dx = w/(nx-1);
real dy = h/(ny-1);

pen p1 = red+1pt;
pen p2 = blue+1pt;

fill(scale(w,h)*unitsquare,lightgray+opacity(.6));

for (int i = 0; i < nx; ++i)
{
	real x = i*dx;
	draw((x,0)--(x,h),p1);
}

for (int i = 0; i < ny; ++i)
{
	real y = i*dy;
	draw((0,y)--(w,y),p2);
}