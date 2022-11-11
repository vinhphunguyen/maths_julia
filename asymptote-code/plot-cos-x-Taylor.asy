import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm,keepAspect=true);

real f(real x) { return cos(x); }
real t1(real x) { return 1-x^2/2; }
real t2(real x) { return 1-x^2/2+x^4/24; }
real t3(real x) { return 1-x^2/2+x^4/24-x^6/720; }

real xmin=-4, xmax=4;
real xmin1=-2.4, xmax1=2.4;

draw(graph(f,  xmin, xmax, n=201),black+1.2pt,"$\cos x$");
draw(graph(t1, xmin1, xmax1, n=201),red+1.2pt,"$ 1-x^2/2$");
draw(graph(t2, xmin, xmax, n=201),blue+1.2pt,"$1-x^2/2+x^4/4!$");
draw(graph(t3, xmin, xmax, n=201),orange+1.2pt,"$1-x^2/2+x^4/4!-x^6/6!$");

ylimits(-2.5,4);

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),-2.5,4.3,Arrow(TeXHead));

add(legend(),(-3,-3.2),E,UnFill);
