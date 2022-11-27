import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);

picture pic1, pic2;

// pic1
draw(pic1,unitcircle,black+1.5pt);
draw(pic1,(1,0)--(0,1)--(-1,0)--(0,-1)--cycle,orange+1.5pt);
draw(pic1,(0,0)--(1,0),black+1.2pt);
draw(pic1,(0,0)--(0,1),black+1.2pt);

label(pic1,"$1$",(0.5,.1));
label(pic1,"$O$",(0.,-.1));
label(pic1,"$\pi/2$",(0.2,.35));

perpendicular(pic1,(0,0),NE,(0,0)--(1,0),blue);

add(pic1);

// pic2

real theta=degrees(pi/8);
real theta2=degrees(pi/4);

fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

draw(pic2,unitcircle,black+1.5pt);
draw(pic2,rotate(theta)*polygon(8),orange+1.5pt);

draw(pic2,(0,0)--(1,0),black+1.2pt);
draw(pic2,(0,0)--(0,1),black+1.2pt);
draw(pic2,(0,0)--dir(theta2),black+1.2pt);

pair H=extension( (0,0),(0,0)+dir(theta),(1,0),dir( theta2 ) );

draw(pic2,(0,0)--H,black+1.2pt);

perpendicular(pic2,H,NE,(1,0)--dir(degrees(pi/4)),blue);

draw(pic2,"$\pi/8$",arc((0,0),0.35,0,theta),PenMargins);
draw(pic2,"$\pi/4$",arc((0,0),0.35,theta2,theta2*2),PenMargins);

label(pic2,"$O$",(0.,-.1));
label(pic2,"$A$",(1.1,.1));
label(pic2,"$B$",dir(degrees(pi/4))+(.1,.06));
label(pic2,"$H$",H+(.15,.06));
label(pic2,"$1$",(0.5,-.1));

add(shift(2.5,0)*pic2);
