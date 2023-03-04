import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p =black+1pt;
pen p1 =black+.7pt;

draw(scale(3,2.5)*unitcircle,p);
draw(shift(-.3,-.3)*scale(2.4,2)*unitcircle,p);
draw(shift(-.6,-.6)*scale(2.,1.5)*unitcircle,p);
draw(shift(-.9,-.9)*scale(1.5,1.)*unitcircle,p);

draw(shift(-1.4,-1.2)*scale(.7)*unitsquare,p1);
draw(shift(-1.2,0.2)*scale(.65,.4)*unitsquare,p1);
draw(shift(-.7,1.14)*scale(.65,.4)*slant(.5)*unitsquare,p1);

path gg=(-.2,0)--(1,0)--(1.1,1.2)--(0,1)--cycle;
draw(shift(-.9,1.79)*scale(.5)*gg,p1);
label("quadrilateral",shift(0.15,1.5)*(.5,.5));
label("parallelogram",shift(0.1,.5)*(.5,.5));
label("rectangle",shift(-0.4,-0.1)*(.5,.5));
label("square",shift(-0.6,-1.2)*(.5,.5));



