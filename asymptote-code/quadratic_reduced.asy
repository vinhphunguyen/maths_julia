import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=false);

real f(real x) { return x^2-4x+3; }
real g(real x) { return x^2-1; }

real xmin=-8;
real xmax=8;

path s1 = graph(f, xmin, xmax, n=201);
path s2 = graph(g, xmin, xmax, n=201);
draw(s1,black+0.95pt,"$x^2-4x+3$");
draw(s2,red+0.95pt,"$u^2-1$");


xaxis("$x$",BottomTop,LeftTicks);
yaxis("$y$",LeftRight,RightTicks);

add(legend(),(-3,55.5),E,UnFill);
