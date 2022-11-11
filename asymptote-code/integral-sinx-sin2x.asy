import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 5.2cm, keepAspect=false);

real f(real x) { return sin(x); }
real g(real x) { return sin(2x); }

real xmax1=2pi;
real xmax=2pi+0.2;

path s12 = graph(f, 0, xmax1, n=200);
pen fillpen = green;
fill(s12 -- cycle, mediumgray);
draw(s12,black+0.95pt);
draw(graph(g, 0, xmax1, n=200),blue+0.95pt);

arrow("$\sin(x)$",(3pi/4,0.62),N,black);
arrow("$\sin(2x)$",(5pi/4,0.91),N,blue);

label("$(+)$",(pi/2,.5));
label("$(-)$",(3pi/2,-.6));

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));

real y=-0.08;

xtick(Label("$0$"),(3pi/16,y));
xtick(Label("$\frac{\pi}{2}$"),(pi/2,y));
xtick(Label("$\pi$"),(pi,y));
xtick(Label("$\frac{3\pi}{2}$"),(3pi/2-.1,y));
xtick(Label("$2\pi$"),(2pi+.1,y));

import gsl;
write(Si(1.0));
