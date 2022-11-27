import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6.5cm); // size of the image

picture pic1, pic2;

draw(unitcircle,blue+1.2pt);

pair p1 = dir(45);
pair p2 = (p1.x,-p1.y);
pair p3 = (-p1.x,p1.y);
pair p4 = (-p1.x,-p1.y);

path pp = p1--p2--p4--p3--cycle;

draw(pic1,p1--p2--p4--p3--cycle,dashed+black+1.2pt);
draw(pic1,(1,1)--(-1,1)--(-1,-1)--(1,-1)--cycle,red+1.2pt);
draw(pic1,rotate(45)*pp,black+1.2pt);

fill(pic1,(0,0)--(-1,0)--(0,-1)--cycle,mediumgray);
draw(pic1,(0,0)--(-1,0)--(0,-1)--cycle,black+1.2pt);


fill(pic1,(-1,0)--(-1,-1)--(0,-1)--cycle,green);
draw(pic1,(-1,0)--(-1,-1)--(0,-1)--cycle,black+1.2pt);

label(pic1,"$O$",(0.05,0));

draw(pic1,"$45^{\circ}$", arc((0,0),0.26,0,45),Arrow,PenMargins);

add(pic1);
