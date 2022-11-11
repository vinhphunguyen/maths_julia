import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm); // size of the image

real f(real x) { return sin(x); }

path s1  = graph(f, -pi, pi, operator..);
path s11 = graph(f, 0, pi, operator..);
path s12 = graph(f, -pi, 0, operator..);

pen fillpen = green;
fill(s11 -- (pi,0) -- cycle, green);
fill(s12 -- (-pi,0) -- cycle, red);

draw(s1,black+0.5pt);

arrow("$f(x)=\sin x$",(pi/2,1.1),NNE,red);
label("$\pi$",(pi,-0.15));  // draw the;abel v0y
label("$-\pi$",(-pi-0.19,-0.15));  // draw the;abel v0y

pair xp=(pi/3,f(pi/3));
pair xm=(-pi/3,f(-pi/3));


draw(xp--(pi/3,0),dashed+gray); // draw the dotted line showing the projections
draw(xp--(0,f(pi/3)),dashed+gray); // draw the dotted line showing the projections

label("$x^\ast$",xp+S);  // draw the;abel v0y
label("$f(x^\ast)$",(-0.8,f(pi/3))+0.2E);  // draw the;abel v0y

label("$-x^\ast$",(-pi/3,0)+0.16N);  // draw the;abel v0y
label("$f(-x^\ast)=-f(x^\ast)$",(1.8,f(-pi/3))+0.2W);  // draw the;abel v0y

draw(xm--(-pi/3,0),dashed+gray); // draw the dotted line showing the projections
draw(xm--(0,f(-pi/3)),dashed+gray); // draw the dotted line showing the projections


dot(xp,black+2pt); // plot a dot at (0,0)
dot(xm,black+2pt); // plot a dot at (0,0)

//xlimits(-3,3);
//ylimits(-20,20);


xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead)); 
