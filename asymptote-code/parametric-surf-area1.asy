import graph;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("color");

//texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(8cm, keepAspect=true);
defaultpen(fontsize(16pt));

real h=1;
real w=1;

int ny = 8, nx = 8;

real dx = w/(nx-1);
real dy = h/(ny-1);

pen p1 = red+1pt;
pen p2 = blue+1pt;

fill(scale(w,h)*unitsquare,lightgray);

pair P0=(3dx,3dy);
pair P1=(4dx,3dy);
pair P2=(4dx,4dy);
pair P3=(3dx,4dy);

fill(P0--P1--P2--P3--cycle,green);

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

Label L=Label("$(u_i,v_j)$",align=(0,0),MidPoint,Fill(lightgray));
draw(L,P0+.1S);
draw("$\Delta u$",.5(P1+P2)+.07E);
draw("$\Delta v$",.5(P0+P1)+.2N);

draw((1.1,0.5)--(1.3,0.5),ArcArrow);

dot(P0,black+4pt);

draw(Label("${u}$",Relative(0.99)),(0,0)--(1.1,0),black+1.2pt,Arrow(TeXHead));
draw(Label("${v}$",Relative(0.99)),(0,0)--(0,1.1),black+1.2pt,Arrow(TeXHead));

