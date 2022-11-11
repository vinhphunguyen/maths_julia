import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 5.2cm, keepAspect=false);

real f(real x) { return sqrt(x); }
real xmax1=2;
real xmax2=3, xmax=3.3;
real xmin=0;

path s1  = graph(f, xmin,xmax1, n=200);
path s2  = graph(f, xmin,xmax, n=200);
path s12  = graph(f, xmax1,xmax2, n=200);
pen fillpen = green;
fill(s1 -- (xmax1,0) -- cycle, mediumgray);
fill(s12 -- (xmax2,0) -- (xmax1,0)-- cycle, orange);

draw(s2,black+1.1pt);

arrow("$y=f(x)$",(1,f(1)),1.1N,red);

label("$x$",(xmax1,-0.15));  // draw the;abel v0y
label("$\displaystyle\int_0^x f(t)dt$",(1,0.5));  // draw the;abel v0y

draw((xmax1,f(xmax1))--(xmax1,0),black+0.9pt); // draw the dotted line showing the projections
draw((xmax1,0.5)--(xmax1+0.5,0.5),black+0.9pt,Arrow); // draw the dotted line showing the projections

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
