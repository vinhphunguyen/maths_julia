import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm,keepAspect=true);

real f(real x) { return x^3-6x^2+11x-6; }

real xmin=0.8, xmax=3.05;

draw(graph(f,  xmin, xmax, n=201),black+1.2pt,"$x^3-6x^2+11x-6$");

//ylimits(-2.5,4);

xaxis(Label("$x$",position=EndPoint, align=NE),black+.8pt,Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),f(xmin),f(xmax)+.3,black+.8pt,Arrow(TeXHead));

path xtick = (0,0) -- (0,-0.15cm);

Label ticklabel1 = Label("$1$", position=EndPoint);
Label ticklabel2 = Label("$2$", position=EndPoint);
Label ticklabel3 = Label("$3$", position=EndPoint);

draw((1,0), xtick, L=ticklabel1, black+.9pt);
draw((2,0), xtick, L=ticklabel2, black+.9pt);
draw((3,0), xtick, L=ticklabel3, black+.9pt);

//add(legend(),(-3,-3.2),E,UnFill);
