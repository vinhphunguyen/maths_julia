import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 8cm, keepAspect=true);

picture pic1, pic2, pic3;

draw(pic1, unitcircle,black+1.pt);
path p =polygon(4);
filldraw(rotate(45)*p, lightgray);

add(pic1);

draw(pic2, unitcircle,black+1.pt);
path p =polygon(8);
filldraw(pic2,rotate(22.5)*p, lightgray);

add(shift(2.5,0)*pic2);

draw(pic3, unitcircle,black+1.pt);
path p =polygon(16);
filldraw(pic3,rotate(22.5/2)*p, lightgray);

add(shift(5,0)*pic3);
