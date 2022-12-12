import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, 8cm, keepAspect=true);
defaultpen(fontsize(12pt));

real f1(real x) { return  exp(x); }
real f1p(real x) { return  exp(x); }
real g(real x) { return  log(x); }
real gp(real x) { return  1/x; }

real xmax1=4.;

path s1 = graph(f1, -5, 1.8, n=200);
path s3 = graph(g, 0.05,5, n=200);

draw(s1,blue+1pt);
draw(s3,red+1.2pt);

label("$e^x$",(2.3,6),blue);
label("$\ln x$",(4,2),red);


real sl=f1p(1);
real alpha=atan(sl);
real r=0.9;
draw((1,f1(1)-0.5)--(1,f1(1)-0.5)+(r*cos(alpha),r*sin(alpha)),ArcArrow);



real sl=gp(2);
real alpha=atan(sl);
real r=1;
draw((2,g(2)-0.3)--(2,g(2)-0.3)+(r*cos(alpha),r*sin(alpha)),ArcArrow);


//xlimits(-4,4);
ylimits(-3,4);

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

