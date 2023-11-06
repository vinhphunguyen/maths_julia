import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.2pt;
pen p1 = gray+1.pt;

pair A = (0,0);
pair B = (4,0);
pair C = (3,3);
pair H = (C.x,0);

real alpha1=degrees(atan2(C.y,C.x));
real alpha2=degrees(atan2(C.y,B.x-C.x));
real alpha3=180-alpha1-alpha2;

draw(pic2,A--B--C--cycle,p);
draw(pic2,C--H,p1);

label(pic2,"$B$",A+0.3S);
label(pic2,"$C$",B+0.3S);
label(pic2,"$A$",C+0.25N);
label(pic2,"$H$",(C.x,0)+0.3S);

label(pic2,"$x$",0.5(H+A)+0.3S);
label(pic2,"$y$",0.5(H+B)+0.3S);
label(pic2,"$c$",0.5(A+C)+0.35W+.1N);
label(pic2,"$b$",0.5(B+C)+0.4E);
label(pic2,"$h$",(C.x-0.3,0.5C.y) );

perpendicular((C.x,0),NW,(0,0)--(1,0),blue);

draw(arc(A,0.5,0,alpha1),PenMargins);
draw(arc(B,0.5,180-alpha2,180),PenMargins);
draw(arc(B,0.52,180-alpha2,180),PenMargins);

add(pic2);



