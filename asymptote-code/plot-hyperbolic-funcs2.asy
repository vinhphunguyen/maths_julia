import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, 12cm, keepAspect=true);

real f1(real x) { return  0.5exp(x); }
real f2(real x) { return  -0.5exp(-x); }
real g(real x) { return  sinh(x); }

real xmax1=2.;

path s1 = graph(f1, -xmax1, xmax1, n=200);
path s2 = graph(f2, -xmax1, xmax1, n=200);
path s3 = graph(g, -xmax1,xmax1, n=200);

draw(s1,blue+1pt);
draw(s2,blue+1pt);
draw(s3,red+1.2pt);

label("$0.5e^x$",(-2,0.5));
label("$-0.5e^{-x}$",(2,-1));
label("$\sinh x$",(1.4,.9),red);

//xlimits(-4,4);
ylimits(-4,4);

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

xaxis(RightTicks(NoZero));
yaxis(LeftTicks);

