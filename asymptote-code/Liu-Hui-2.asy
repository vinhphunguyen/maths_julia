import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);


draw(unitcircle,black+0.8pt);
path p =polygon(6);
//draw(p, blue+2pt);

real theta=degrees(pi/3);

label("$O$",(0,0),1.01*SE);
label("$A$",(1,0),1.01*NE);
label("$B$",dir(theta),1.01*NE);
label("$r$",(.5,-.09));
//label("$\alpha$",(.35,0.2));
draw((0,0)--dir(theta),black+1pt);  // draw the force

pair H=extension( (0,0),(0,0)+dir(theta/2),(1,0),dir(theta) );
pair C=dir(theta/2);
label("$C$",C,1.1*E);
draw((0,0)--C,black+1pt);
draw(dir(theta)--C,black+1pt);

fill((0,0)--(1,0)--H -- cycle, mediumgray);


draw((0,0)--(1.,0),black+1pt);  // draw the force

draw((0,0)--H,black+1pt);  // draw the force
label("$H$",H+0.17S);

label("$AB=M$",(-0.2,-0.3));
label("$AC=m$",(-0.2,-0.5));
label("$OA=r$",(-0.2,-0.7));

perpendicular(H,NE,(1,0)--dir(theta),blue);
draw(p, red+1.1pt);
draw(arc((0,0),0.35,0,theta),PenMargins);
