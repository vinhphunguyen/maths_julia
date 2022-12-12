import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, 6.2cm, keepAspect=false);

real f(real x) { return x != 0 ? sin(x)/x : 1.; }

real xmax1=4pi;

path s1 = graph(f, 0.03, xmax1, n=200);
path s2 = graph(f, -xmax1, xmax1, n=200);
pen fillpen = green;
fill((0.03,0)--(0.03,1)--s1 -- cycle, mediumgray);
draw(s2,red+1pt);
draw((0,0)--(xmax1,0),black+.8pt);

//arrow("$\sin(x)$",(3pi/4,0.62),N,black);
//arrow("$\sin(2x)$",(5pi/4,0.91),N,blue);

//label("$(+)$",(pi/2,.5));
//label("$(-)$",(3pi/2,-.6));

xaxis(Label("$x$",position=EndPoint, align=NE),black+.8pt,Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),black+.8pt,Arrow(TeXHead));

real y=-0.04;

ytick(Label("$1$"),(0,1));

xtick(Label("$0$"),(.1,y));
xtick(Label("$\pi$"),(pi,y));
xtick(Label("$-\pi$"),(-pi-.1,y));
xtick(Label("$2\pi$"),(2pi+.1,y));
xtick(Label("$-2\pi$"),(-2pi-.1,y));
xtick(Label("$3\pi$"),(3pi+.1,y));
xtick(Label("$-3\pi$"),(-3pi-.1,y));

import gsl;
write(Si(1.0));
