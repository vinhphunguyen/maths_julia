import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 5.2cm, keepAspect=false);

real f(real x) { return exp(0.3*(x-1)^2); }
real xmax=2;
real xmax1=1;

path s1  = graph(f, 0,xmax, n=200);
draw(s1,black+1.1pt);

pair P=(xmax1,f(xmax1));
pair Q=(2,f(2));

dot(P,black+5pt); // plot a dot at (0,0)
dot(Q,black+5pt); // plot a dot at (0,0)

draw(P--(xmax1,0),dashed+gray); // draw the dotted line showing the projections
draw(P--(0,f(xmax1)),dashed+gray); // draw the dotted line showing the projections

draw(P--Q,blue+1pt); // draw the dotted line showing the projections

//xlimits(-3,3);
//ylimits(-20,20);


xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
