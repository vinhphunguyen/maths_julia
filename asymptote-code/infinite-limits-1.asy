import graph;
import geometry;
unitsize(2cm,4cm);
usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(18pt));

real f1(real x) { return 1/x^2; }
real xmax=3;
real xmin=-3;
real x0=.5;

draw(graph(f1,x0,xmax, n=400),black+2.1pt,"$\sin 2x$");
draw(graph(f1,xmin,-x0, n=400),black+2.1pt,"$\sin 2x$");


draw((1,0)--(1,f1(1)),blue);
draw((.7,0)--(.7,f1(.7)),blue);
draw((0,f1(1))--(1,f1(1)),blue);
draw((0,f1(.7))--(.7,f1(.7)),blue);


draw((-1,0)--(-1,f1(-1)),blue);
draw((-.7,0)--(-.7,f1(-.7)),blue);
draw((0,f1(-1))--(-1,f1(-1)),blue);
draw((0,f1(-.7))--(-.7,f1(-.7)),blue);

draw((1,-0.1)--(0.5,-.1),red,Arrow);
draw((-1,-0.1)--(-0.5,-.1),red,Arrow);

draw((0.2,f1(1))--(0.2,f1(1)+.5),red,Arrow);
draw((0.2,f1(0.7))--(0.2,f1(0.7)+.5),red,Arrow);

label("$\boxed{y=\displaystyle\frac{1}{x^2}}$",(1.3,2.8),red);
label("$0$",(.1,-.1),red);
label("$\infty$",(.2,f1(0.7)+.6),red);


dot((1,0),black+5pt);
dot((.7,0),black+5pt);
dot((-1,0),black+5pt);
dot((-.7,0),black+5pt);

dot((-1,f1(-1)),black+5pt);
dot((1,f1(1)),black+5pt);
dot((0.7,f1(.7)),black+5pt);
dot((-.7,f1(-.7)),black+5pt);

dot((0,f1(.7)),red+5pt);
dot((0,f1(1)),red+5pt);

xaxis(Label("$x$"),black+1pt,Arrow(TeXHead));
yaxis(Label("$y$"),black+1pt,Arrow(TeXHead));
