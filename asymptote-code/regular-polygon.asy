import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(14cm, keepAspect=true);

picture pic1, pic2;


// pic2

pen p = black+1pt;
draw(pic1,polygon(3),p);
dot(pic1,(0,0),red+3pt);
draw(pic1,unitcircle,blue+.8pt);

real x=1;//0.5/cos(pi/6);
pair A=x*dir(-30);
draw(pic1,"$\alpha$",arc(A,.4,120,180),black+.9pt);
//dot(pic1,A,blue+3pt);
add(shift(0,-0.)*pic1);

pair A=x*dir(-45);
pair B=x*dir(45);
pair C=x*dir(45+90);
pair D=x*dir(-45-90);
draw(pic2,shift(2,0)*polygon(4),p);
dot(pic2,shift(2,0)*A,blue+3pt);
dot(pic2,shift(2,0)*B,blue+3pt);
dot(pic2,shift(2,0)*C,blue+3pt);
dot(pic2,shift(2,0)*D,blue+3pt);
label(pic2,"vertex",shift(2,0)*A+.25S);
label(pic2,"edge",shift(2,0)*(.5B+.5C)+.25N);

draw(pic2,shift(4,0)*polygon(5),p);
draw(pic2,shift(6.5,0)*polygon(6),p);
draw(pic2,shift(9,0)*polygon(7),p);

add(pic2);
