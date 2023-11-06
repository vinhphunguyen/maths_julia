import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 8cm, keepAspect=false);


draw(unitcircle,black+1.1pt);
path p =polygon(8);
//draw(p, blue+2pt);


label("$O$",(0,0),1.01*SE);
label("$A$",(1,0),1.01*NE);
label("$B$",dir(45),1.01*NE);
label("$C$",dir(2*45),1.01*N);
label("$D$",dir(3*45),1.01*NW);
label("$E$",dir(4*45),1.01*W);
label("$F$",dir(5*45),1.03*S);
label("$G$",dir(6*45),1.01*S);
label("$H$",dir(7*45),1.01*SE);
label("$r$",(.5,-.05));
label("$\alpha$",(.35,0.2));
draw((0,0)--dir(45),black+1pt);  // draw the force

pair H=extension((0,0),(0,0)+dir(22.5),(1,0),dir(45));

fill((0,0)--(1,0)--H -- cycle, mediumgray);


draw((0,0)--(1.,0),black+1pt);  // draw the force
draw((0,0)--(0.,1),black+1pt);  // draw the force

draw((0,0)--H,black+1pt);  // draw the force
label("$H$",H+0.12SW);

label("$OH=r\cos \displaystyle\frac{\alpha}{2}$",(-0.2,-0.3));
label("$AB=2r\sin \displaystyle\frac{\alpha}{2}$",(-0.2,-0.52));
label("$\alpha=\displaystyle\frac{2\pi}{n}$",(-0.2,0.4));

perpendicular(H,NE,(1,0)--dir(45),blue);
draw(rotate(22.5)*p, red+1.1pt);
draw(arc((0,0),0.35,0,45),PenMargins);
