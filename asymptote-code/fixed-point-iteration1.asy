import math;
import graph;
usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf";

defaultpen(fontsize(12pt));

size(7.2cm);

real f1(real x) {return 2.8*x*(1-x);}
real f2(real x) {return x;}

// plot the function f, from xmin to xmax
real xmin=0, xmax=1;
draw(graph(f1,xmin,xmax,operator..),red+linewidth(1));
draw(graph(f2,xmin,xmax,operator..),linewidth(1));

real xx=0.64285714285714;

pen p=blue+1pt;
pen pd=gray+.6pt;
dot((xx,xx),black+5pt); // plot a dot at (0,0)
//draw((xx,xx)--(xx,0),pd);
//draw((xx,xx)--(0,xx),pd);

real x0=0.2;
pair A=(x0,f1(x0));
pair B=(A.y,f1(A.y));

draw((A.x,0)--A,pd,ArcArrow(3pt));
draw((B.x,0)--B,pd,ArcArrow(3pt));
draw(A--(B.x,A.y),pd,ArcArrow(3pt));

Label xticklabel = Label("$x^\ast$", position=EndPoint);
Label xticklabel0 = Label("$x_0$", position=EndPoint);
Label xticklabel1 = Label("$x_1$", position=EndPoint);
Label yticklabel0 = Label("$f(x_0)$", position=EndPoint);
Label yticklabel1 = Label("$f(x_1)$", position=EndPoint);
draw((xx,0)--(xx,0-0.05), L=xticklabel);
draw((x0,0)--(x0,0-0.05), L=xticklabel0);
draw((B.x,0)--(B.x,0-0.05), L=xticklabel1);
draw((0,A.y)--(0-0.05,A.y), L=yticklabel0);
draw((0,B.y)--(0-0.05,B.y), L=yticklabel1);

label("$y=f(x)$",(0.98,0.6));
label("$y=x$",(0.69,0.88));




// two axes
xaxis("$x$",Arrow(TeXHead));
yaxis("$y$",-.1,1,Arrow(TeXHead));
