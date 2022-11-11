import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

pair m1=(0,0); // location of the mass m1
pair m2=(1,0); // location of the mass m2
pair m3=(1,1); // location of the mass m3
pair m4=(0,1); // location of the mass m3

draw(m1--m2,black+1.1pt);
draw(m2--m3,black+1.1pt);
draw(m3--m4,black+1.1pt);
draw(m4--m1,black+1.1pt);
draw(m1--m3,red+1.3pt);

label("$d$",(0.5,0.5),1.13*SE);
label("$1$",(0.5,0.1),1.13*SE);
label("$1$",(0.9,0.5),1.13*SE);

perpendicular(m2,NW,blue);
