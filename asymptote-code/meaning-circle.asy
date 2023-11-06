import graph;
import geometry;

usepackage("mtpro2");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);

picture pic1, pic2;
pen p = black+1pt;

fill(pic1,unitcircle,lightgray+1.1pt);
draw(pic1,unitcircle,p);
dot(pic1,(0,0),black+1pt);
dot(pic1,(1,0),black+1pt);
draw(pic1,(0,0)--(1,0));
label(pic1,"$r$",(0.5,0.2));
add(pic1);


draw(pic2,unitcircle,p);

pair O=(0,0);
pair A=(2*pi,-1);
dot(pic2,O,black+1pt);
dot(pic2,(0,-1),black+1pt);
dot(pic2,A,black+1pt);
fill(pic2,O--(0,-1)--A--cycle,lightgray+1pt);
draw(pic2,O--(0,-1)--A--cycle,p);
label(pic2,"$r$",(-0.2,-0.5));
label(pic2,"$C$",(1.2,-0.8));
add(shift(2.5,0)*pic2);
