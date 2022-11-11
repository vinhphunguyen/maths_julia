import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 5.2cm, keepAspect=false);

real f(real x) { return sin(x)/x; }
real g(real x) { return Si(x); }

real xmax1=15;
real xmax=2pi+0.2;

path s1 = graph(f, -15, xmax1, n=201);
path s2 = graph(f,0.0001, xmax1, n=201);
pen fillpen = green;
fill((0.0001,f(0.0001))--s2 -- cycle, mediumgray);
draw(s1,black+0.95pt);

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
