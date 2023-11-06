import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 8cm, keepAspect=true);

picture pic1, pic2, pic3;

draw(pic1, unitcircle,black+1.1pt);
draw(pic1, shift(-1,-1)*scale(2)*unitsquare,black+1.pt);
path p =polygon(4);
filldraw(rotate(45)*p, lightgray);

draw((0,0)--(1,0));
label("$1$",(0.5,-0.1));

add(pic1);


