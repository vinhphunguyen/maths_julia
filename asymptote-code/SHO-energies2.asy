import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

real k = 1;
real m = 2;
real omega0 = sqrt(k/m);
real T = 2pi/omega0;
real A = 1;
real phi = 0.;

pair F(real t) {
    return ( A*cos(omega0*t-phi), -A*omega0*sin(omega0*t-phi) );
}

path g = graph(F, 0, T,n=200);
draw(g, red+1.2pt);


xaxis("$x$",BottomTop,LeftTicks);
yaxis("$\dot{x}$",LeftRight,RightTicks(trailingzero));
