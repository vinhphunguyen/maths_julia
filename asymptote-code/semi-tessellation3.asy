import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(5cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p =black+1pt;
pen pr =red+1pt;
pen p1 =black+.7pt;

picture pic1, pic2, pic3;

real alpha=degrees(pi/6);
pair A1=dir(alpha/2);
pair A2=dir(3alpha/2);
pair A3=dir(5alpha/2);
pair A4=dir(7alpha/2);
pair A5=dir(9alpha/2);
pair A6=dir(11alpha/2);
pair A7=dir(13alpha/2);
pair A8=dir(15alpha/2);

real r=1.0;
real AB=r*cos(pi/12);

fill(pic1,polygon(12),orange+opacity(.8));
draw(pic1,polygon(12),p);

fill(pic1,shift(0,2AB)*polygon(12),orange+opacity(.8));
draw(pic1,shift(0,2AB)*polygon(12),p);

//fill(pic1,shift(A2-A8)*polygon(12),orange);
fill(pic1,shift(abs(2AB*cos(pi/6)),2AB*sin(pi/6))*polygon(12),orange+opacity(.8));
draw(pic1,shift(abs(2AB*cos(pi/6)),2AB*sin(pi/6))*polygon(12),p);

label("$a$",(0,0));
label("$b$",shift(abs(2AB*cos(pi/6)),2AB*sin(pi/6))*(0,0));
label("$b$",shift(0,2AB)*(0,0));

dot(pic1,A2,red+2pt);
dot(pic1,A3,red+2pt);

add(pic1);

