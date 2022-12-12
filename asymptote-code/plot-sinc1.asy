import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, 5.2cm, keepAspect=false);

real f(real x) { return  sin(x); }
real g(real x) { return  1/x; }

real xmax1=4pi;

path s1 = graph(f, -xmax1, xmax1, n=200);
path s2 = graph(g, 0.2, xmax1, n=200);
path s3 = graph(g, -xmax1,-0.2, n=200);

draw(s1,red+0.95pt);
draw(s2,black+0.95pt);
draw(s3,black+0.95pt);

label("$1/x$",(1.9,4));
label("$\sin x$",(8,1.8),red);

//arrow("$\sin(x)$",(3pi/4,0.62),N,black);
//arrow("$\sin(2x)$",(5pi/4,0.91),N,blue);

//label("$(+)$",(pi/2,.5));
//label("$(-)$",(3pi/2,-.6));

//xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
//yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
// real[] x={-10,-5,0,5,10};
// real[] y={-4,-2,0,2,4};
// xaxis("$x$",BottomTop,LeftTicks(x));
// yaxis("$y$",LeftRight,LeftTicks(y));

//attach(legend(),point(NW),40S+30E,UnFill);


xaxis("$x$",RightTicks(NoZero));
yaxis(LeftTicks(NoZero));

import gsl;
write(Si(1.0));
