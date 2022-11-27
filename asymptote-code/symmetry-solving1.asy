import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(13cm); // size of the image

picture pic1, pic2;

draw(unitcircle,blue+1.2pt);

pair p1 = dir(45);
pair p2 = (p1.x,-p1.y);
pair p3 = (-p1.x,p1.y);
pair p4 = (-p1.x,-p1.y);

draw(pic1,p1--p2--p4--p3--cycle,black+1.2pt);
draw(pic1,(1,1)--(-1,1)--(-1,-1)--(1,-1)--cycle,red+1.2pt);

add(pic1);

draw(pic2,unitcircle,blue+1.2pt);
draw(pic2,p1--p2--p4--p3--cycle,black+1.2pt);
draw(pic2,(1,1)--(-1,1)--(-1,-1)--(1,-1)--cycle,red+1.2pt);

draw(pic2,(0,0)--(p1.x,0),black+.8pt);
draw(pic2,(0,0)--p1,black+.8pt);
draw(pic2,(0,0)--(0,1),black+.8pt);

label(pic2,"$x$",(0.35,-0.15));
label(pic2,"$x$",(p1.x-0.1,p1.y/2));
label(pic2,"$x\sqrt{2}$",(.25,0.5));

add(shift(2.2,0)*pic2);
