import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf

picture pic1, pic2;

real r1=1;
real r2=1.5;
real r22=1.1;

pen p =black+1pt;
pen p1 =black+.6pt;

fill(pic1,scale(r2)*unitcircle,yellow);
fill(pic1,scale(r1)*unitcircle,white);

draw(pic1,scale(r2)*unitcircle,p);
draw(pic1,scale(r1)*unitcircle,p);

pair O=(0,0);
draw(pic1,O--r1*dir(0),p1,ArcArrow);
draw(pic1,O--r2*dir(45),p1,ArcArrow);

label(pic1,"$r$",(0.5r1,0.15));
label(pic1,rotate(45)*"$r+h$",(0.2,.52));

dot(pic1,(0,0),black+4pt);

add(pic1);

// pic2
fill(pic2,scale(r22)*unitcircle,yellow);
fill(pic2,scale(r1)*unitcircle,white);

draw(pic2,scale(r22)*unitcircle,p);
draw(pic2,scale(r1)*unitcircle,p);

pair O=(0,0);
draw(pic2,O--r1*dir(0),p1,ArcArrow);
draw(pic2,O--r22*dir(45),p1,ArcArrow);


label(pic2,"$r$",(0.5r1,0.15));
label(pic2,rotate(45)*"$r+h$",(0.2,.52));

real h=r22-r1;
fill(pic2,shift(-2,-1.5)*scale(4*r1,h)*unitsquare,yellow);
draw(pic2,shift(-2,-1.5)*scale(4*r1,h)*unitsquare,p);

dot(pic2,(0,0),black+4pt);

add(shift(3r2,0)*pic2);
