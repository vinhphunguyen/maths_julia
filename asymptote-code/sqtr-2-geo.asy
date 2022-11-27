import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(14pt));

picture pic1, pic2;


// pic2

real theta=degrees(pi/12);
real theta2=2theta;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

pen p = black+1.pt;
draw(pic2,scale(sqrt(2))*unitcircle,p);


draw(pic2,(0,0)--(2.1,0),p);
draw(pic2,(0,0)--(1,1),p);
draw(pic2,(1,0)--(1,1),p);


label(pic2,"$O$",(-0,-0.15));
label(pic2,"$A$",(1,-0.15));
label(pic2,"$B$",(1,1.2));
label(pic2,"$C$",(sqrt(2)+.1,0.2));

label(pic2,"$1$",(0.5,-0.15));
label(pic2,"$1$",(1.1,0.5));
label(pic2,"$\sqrt{2}$",(.4,0.65));
label(pic2,"$\sqrt{2}$",(sqrt(2)+0.1,-0.15),red);

perpendicular(pic2,(1,0),NE,(1,0)--(2,0),blue);

dot(pic2,(1,0),black+5pt);
dot(pic2,(2,0),black+5pt);
dot(pic2,(sqrt(2),0),red+5pt);

add(shift(0,0.2)*pic2);
