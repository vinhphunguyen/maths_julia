import math;
import graph;
usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf";

defaultpen(fontsize(12pt));

unitsize(3cm,1cm);

real f1(real x) {return 1+1/x;}
real f2(real x) {return x;}

// plot the function f, from xmin to xmax
real xmin=0.15, xmax=2;
draw(graph(f1,xmin,xmax,operator..),red+linewidth(1));
draw(graph(f1,-2,-xmin,operator..),red+linewidth(1));
draw(graph(f2,-2,xmax,operator..),linewidth(1));

real xx=0.5(1+sqrt(5));
real xx1=0.5(1-sqrt(5));

pen p=blue+1pt;
pen pd=gray+.6pt;
pen pdr=red+.6pt;

dot((xx,xx),black+5pt); // plot a dot at (0,0)
dot((xx1,xx1),black+5pt); // plot a dot at (0,0)

//draw((xx,xx)--(xx,0),pd);
//draw((xx,xx)--(0,xx),pd); //d

real x0=-0.4;
pair A=(x0,f1(x0));
pair B=(A.y,f1(A.y));

draw((A.x,0)--A,pd,ArcArrow(3pt));
draw((B.x,A.y)--B,pd,ArcArrow(3pt));
draw(B--(B.y,B.y),pd,ArcArrow(3pt));
draw(A--(B.x,A.y),pd,ArcArrow(3pt));

Label xticklabel = Label("$x^\ast$", position=EndPoint);
Label xticklabel0 = Label("$x_0$", position=EndPoint);
Label xticklabel1 = Label("$x_1$", position=EndPoint); Label yticklabel0 = Label("$f(x_0)$", position=EndPoint);
Label yticklabel1 = Label("$f(x_1)$", position=EndPoint);

draw((xx,0)--(xx,0-0.05), L=xticklabel);
draw((xx1,0)--(xx1,0-0.05), L=xticklabel);


// two axes
xaxis("$x$",Arrow(TeXHead));
yaxis("$y$",-8,8,Arrow(TeXHead));
