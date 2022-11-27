import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 5.2cm, keepAspect=false);
defaultpen(fontsize(8pt));

real f(real x) { return 1/x; }

real xmin=1;
real xmax=6;

path s1 = graph(f, xmin-0.1, xmax, n=201);
pen fillpen = green;

filldraw((1,0)--(2,0)--(2,1)--(1,1)--cycle,mediumgray);
filldraw((2,0)--(3,0)--(3,0.5)--(2,.5)--cycle,mediumgray);
filldraw((3,0)--(4,0)--(4,f(3))--(3,f(3))--cycle,mediumgray);
filldraw((4,0)--(5,0)--(5,f(4))--(4,f(4))--cycle,mediumgray);

draw(s1,black+1.2pt);

label("$y=\displaystyle\frac{1}{x}$",(5.5,1/3));

label("$1$",(1.5,.5));
label("$1/2$",(2.5,.2));
label("$1/3$",(3.5,.1));

label("$\boxed{\displaystyle\int_1^\infty \frac{dx}{x}=\ln(\infty)=\infty}$",(4,.7),red);

real y = -0.03;
xtick(Label("$1$"),(1,y));
xtick(Label("$2$"),(2,y));
xtick(Label("$3$"),(3,y));
xtick(Label("$4$"),(4,y));
xtick(Label("$5$"),(5,y));
xtick(Label("$6$"),(6,y));

real x = 0;
ytick(Label("$1$"),(x,1));
ytick(Label("$1/2$"),(x,1/2));
ytick(Label("$1/3$"),(x,1/3));

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
