import math;
import graph;
usepackage("amsmath");

settings.outformat="pdf";

defaultpen(fontsize(12pt));

size(6cm);

real f1(real x) {return x^3-x^2;}
real f2(real x) {return x;}

// plot the function f, from xmin to xmax
real xmin=0, xmax=2;
draw(graph(f1,xmin,xmax,operator..),L=Label("$y=f(x)$", position=EndPoint),red+linewidth(1));
draw(graph(f2,xmin,xmax,operator..),L=Label("$y=x$", position=EndPoint),linewidth(1));

real xx=1.6180339887499;

dot((xx,xx),black+5pt); // plot a dot at (0,0)
draw((xx,xx)--(xx,0),dotted+gray);
draw((xx,xx)--(0,xx),dotted+gray);

Label xticklabel = Label("$x^\ast$", position=EndPoint);
Label yticklabel = Label("$f(x^\ast)=x^\ast$", position=EndPoint);
draw((xx,0)--(xx,0-0.1), L=xticklabel);
draw((0,xx)--(0-0.1,xx), L=yticklabel);

// two axes
xaxis("$x$",Arrow(TeXHead));
yaxis("$y$",Arrow(TeXHead));
