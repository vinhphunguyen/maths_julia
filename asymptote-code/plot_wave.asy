import graph;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

//defaultpen(fontsize(12pt));

size(9cm, 4cm, keepAspect=false);

string data="wave.csv";

file in=input(data).line().csv();

string[] columnlabel=in;

real[][] A=in;
A=transpose(A);

real[] t    = A[0];
real[] ft   = A[1];
real[] freq = A[2];
real[] amp  = A[3];

write(t);

marker mark=marker(scale(1mm)*cross(6,false,r=0.35),red,Fill);

path g=graph(t,ft);
draw(g,black+1pt);

xaxis("$t$",Bottom,LeftTicks);
yaxis("$f(t)$",Left,LeftTicks);

