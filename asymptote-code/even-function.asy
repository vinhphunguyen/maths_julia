import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 5.2cm, keepAspect=false);

real f(real x) { return x^4-8*x^2+16; }
real xmax=3;
real xmax1=2;

path s1  = graph(f, -xmax,xmax, n=200);
path s11 = graph(f, 0, xmax1, n=200);
path s12 = graph(f, -xmax1, 0, n=200);

pen fillpen = green;
fill((0,0)--(0,f(0))--s11 -- (xmax1,0) -- cycle, green);
fill(s12 -- (0,0) -- cycle, red);

draw(s1,black+0.95pt);

arrow("$f(x)=x^4-8x^2+16$",(pi/6+0.2,f(pi/6)-0.3),NNE,red);

pair xp=(pi/3,f(pi/3));
pair xm=(-pi/3,f(-pi/3));

draw(xp--(pi/3,0),dashed+gray); // draw the dotted line showing the projections
draw(xp--(0,f(pi/3)),dashed+gray); // draw the dotted line showing the projections

label("$x^\ast$",(pi/3,-0.9));  // draw the;abel v0y
label("$-x^\ast$",(-pi/3,-0.9));  // draw the;abel v0y

draw(xm--(-pi/3,0),dashed+gray); // draw the dotted line showing the projections
draw(xm--(0,f(-pi/3)),dashed+gray); // draw the dotted line showing the projections


dot(xp,black+2.8pt); // plot a dot at (0,0)
dot(xm,black+2.8pt); // plot a dot at (0,0)

//xlimits(-3,3);
//ylimits(-20,20);


xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
