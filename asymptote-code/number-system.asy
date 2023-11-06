import graph;
import geometry;

usepackage("amsmath");
usepackage("amsfonts");
usepackage("amssymb");
//usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p =black+1pt;
pen p1 =red+.7pt;

draw(shift(-0,-.0)*scale(4,3.2)*unitcircle,p);  // complex number 
draw(shift(-0,-.4)*scale(3.6,2.70067517)*unitcircle,p); // real number
draw(shift(-0,-.9)*scale(2.9,2.17505438)*unitcircle,p); // rational number
draw(shift(-0,-1.1)*scale(1.8,1.35033758)*unitcircle,p); // integer number
filldraw(shift(-0,-1.3)*scale(.8,.8)*unitcircle,lightgray+1pt); // natural number


label("$0$",shift(-1,-2)*(.5,.5));
label("$1$",shift(-0.6,-1.7)*(.5,.5));
label("$\mathbb{N}$",shift(-0.2,-1.4)*(.5,.5));

label("$-1$",shift(-1,-.6)*(.5,.5));
label("$-2$",shift(-0.4,-0.6)*(.5,.5));
label("$\mathbb{Z}$",shift(1.,-1.3)*(.5,.5));


label("$-7/8$",shift(-1.2,.3)*(.5,.5));
label("$0.3333$",shift(0.4,.2)*(.5,.5));
label("$\mathbb{Q}$",shift(1.9,-1.2)*(.5,.5));

label("$e$",shift(-2,1.2)*(.5,.5));
label("$\sqrt{2}$",shift(-1.,1.2)*(.5,.5));
label("$\pi$",shift(-.4,1.2)*(.5,.5));

label("$\mathbb{R}$",shift(0.15,1.5)*(.5,.5));

label("$\mathbb{C}$",shift(.25,2.1)*(.5,.5));
label("$i$",shift(-1,2.1)*(.5,.5));
label("$2+3i$",shift(-2,2.1)*(.5,.5));



