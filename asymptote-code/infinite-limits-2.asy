import graph;
import geometry;

unitsize(2cm,4cm);
usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(18pt));

real f1(real x) { return 1/(x-1); }


real xmax=4;
real xmin=-4;

draw(graph(f1,1.5,xmax, n=103),black+2.1pt);
draw(graph(f1,xmin,0.5, n=103),black+2.1pt);

draw((1,f1(0.5))--(1,f1(1.5)),blue+1pt);

draw((2,0)--(2,f1(2)),blue);
draw((2,f1(2))--(0,f1(2)),blue);
draw((1.5,0)--(1.5,f1(1.5)),blue);
draw((0,f1(1.5))--(1.5,f1(1.5)),blue);

draw((2,-0.1)--(1.5,-.1),red,Arrow);
draw((0.2,f1(2))--(0.2,f1(2)+.5),red,Arrow);

label("$\boxed{y=\displaystyle\frac{1}{x-1}}$",(-1.,1.3),red);
label("$\boxed{x=1}$",(1.6,-1.3),blue);

label("$0$",(.1,-.1));
label("$\infty$",(.2,f1(1.5)-.3),red);


dot((2,0),black+5pt);
dot((1.5,0),black+5pt);

dot((0,f1(1.5)),red+5pt);
dot((0,f1(2)),red+5pt);


xaxis(Label("$x$"),black+1pt,Arrow(TeXHead));
yaxis(Label("$y$"),f1(0.5),f1(1.5)+.5,black+1pt,Arrow(TeXHead));
