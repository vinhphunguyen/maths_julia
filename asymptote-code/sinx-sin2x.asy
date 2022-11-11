import graph;
import geometry;
unitsize(2cm,4cm);
usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

real f1(real x) { return sin(2x); }
real f2(real x) { return cos(3x); }
real f3(real x) { return f1(x)+f2(x); }
real xmax=7*pi/2;
real xmin=0.;
draw(graph(f1,xmin,xmax, n=400),black+1.5pt,"$\sin 2x$");
draw(graph(f2,xmin,xmax, n=400),blue+1.5pt,"$\cos 3x$");
draw(graph(f3,xmin,2pi, n=400),dashed+black+1.5pt,"$\sin 2x+\cos 3x$");
draw(graph(f3,2pi,xmax, n=400),red+1.5pt,"$\sin 2x+\cos 3x$");

xaxis(Label("$x$"),Arrow(TeXHead));
yaxis(Label("$y$"),Arrow(TeXHead));
add(legend(),(6,1.5),E,UnFill);

real y=-0.9;
xtick(Label("$\pi/2$"),(pi/2,y));
xtick(Label("$3\pi/2$"),(3pi/2,y));
xtick(Label("$2\pi$"),(2pi,y));
xtick(Label("$5\pi/2$"),(5pi/2,y));
xtick(Label("$3\pi$"),(3pi,y));
xtick(Label("$7\pi/2$"),(7pi/2,y));

dot((2pi,0),red+9pt);
