import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 5.2cm, keepAspect=false);

real f(real x) { return 1/x; }
real xmin=0.5, xmax=6.2;
real a=1, b=2;
real aa=3, bb=6;

path s  = graph(f, xmin,xmax, n=200);
path s1 = graph(f, a ,b, n=200);
path s2 = graph(f, aa,bb, n=200);

pen fillpen = green;
fill((a,0)--(a,f(a))--s1 -- (b,0) -- cycle, green);
fill((aa,0)--(aa,f(aa))--s2 -- (bb,0) -- cycle, orange);

draw(s,black+0.95pt);

arrow("$f(x)=1/x$",(a,f(a)+0.3),NNE,red);

label("$a$",(a,-0.1));  // draw the;abel v0y
label("$b$",(b,-0.1));  // draw the;abel v0y
label("$\alpha a$",(aa,-0.1));  // draw the;abel v0y
label("$\alpha b$",(bb,-0.1));  // draw the;abel v0y

label("equal areas",(4,1.5));  // draw the;abel v0y
label("$\alpha > 1$",(5,1.));  // draw the;abel v0y
draw((4,1.4)--(1.2,0.5),Arrow); // draw the dotted line showing the projections
draw((4,1.4)--(4.2,0.2),Arrow); // draw the dotted line showing the projections


draw((a,0)--(a,f(a)),dashed+gray); // draw the dotted line showing the projections
draw((aa,0)--(aa,f(aa)),dashed+gray); // draw the dotted line showing the projections
draw((b,0)--(b,f(b)),dashed+gray); // draw the dotted line showing the projections
draw((bb,0)--(bb,f(bb)),dashed+gray); // draw the dotted line showing the projections

xlimits(0,6.4);
xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
