import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p =black+1pt;
pen pr =red+1pt;
pen p1 =black+.7pt;

picture pic1, pic2, pic3;

fill(pic1,unitsquare,cyan);
draw(pic1,unitsquare,p);
fill(pic1,shift(1,0)*unitsquare,cyan);
draw(pic1,shift(1,0)*unitsquare,p);
fill(pic1,shift(2,0)*unitsquare,cyan);
draw(pic1,shift(2,0)*unitsquare,p);
fill(pic1,shift(0,1)*unitsquare,cyan);
draw(pic1,shift(0,1)*unitsquare,p);
fill(pic1,shift(1,1)*unitsquare,cyan);
draw(pic1,shift(1,1)*unitsquare,p);
fill(pic1,shift(2,1)*unitsquare,cyan);
draw(pic1,shift(2,1)*unitsquare,p);

pair A=(1,1);

dot(pic1,A,red+2pt);

add(pic1);

real r = .5;

path tri=scale(r)*polygon(3);
path tri1=rotate(180)*tri;


real AB=2*r*cos(pi/6);

pair A=(0,r);
pair B=rotate(120)*A;
pair C=rotate(240)*A;

fill(pic2,tri,yellow);
draw(pic2,tri,p);
fill(pic2,shift(A-rotate(180)*B)*tri1,yellow);
draw(pic2,shift(A-rotate(180)*B)*tri1,p);
fill(pic2,shift(A-rotate(180)*C)*tri1,yellow);
draw(pic2,shift(A-rotate(180)*C)*tri1,p);
fill(pic2,shift(AB,0)*tri,yellow);
draw(pic2,shift(AB,0)*tri,p);
fill(pic2,shift(A-C)*tri,yellow);
draw(pic2,shift(A-C)*tri,p);
fill(pic2,shift(A-B)*tri,yellow);
draw(pic2,shift(A-B)*tri,p);
fill(pic2,shift(A-rotate(180)*A)*tri1,yellow);
draw(pic2,shift(A-rotate(180)*A)*tri1,p);

dot(pic2,A,red+2pt);
//dot(pic2,B,red+4pt);
//dot(pic2,C,red+4pt);

add(shift(5,0.5)*pic2);

// pic3 

path he=scale(r)*polygon(6);


real AB=2*r*sin(pi/3);

pair A = r*dir(60);
pair B = r*dir(60*2);
pair C = r*dir(60*3);
pair D = r*dir(60*4);
pair G = r*dir(60*5);
pair H = r*dir(60*6);

fill(pic3,he,orange);
draw(pic3,he,p);
fill(pic3,shift(A-C)*he,orange);
draw(pic3,shift(A-C)*he,p);
fill(pic3,shift(0,AB)*shift(A-C)*he,orange);
draw(pic3,shift(0,AB)*shift(A-C)*he,p);
fill(pic3,shift(A-G)*he,orange);
draw(pic3,shift(A-G)*he,p);
fill(pic3,shift(H-B)*he,orange);
draw(pic3,shift(H-B)*he,p);
fill(pic3,shift(3r,0)*he,orange);
fill(pic3,shift(0,AB)*shift(3r,0)*he,orange);
draw(pic3,shift(0,AB)*shift(3r,0)*he,p);
draw(pic3,shift(3r,0)*he,p);

dot(pic3,A,red+2pt);

add(shift(7.5,0.5)*pic3);