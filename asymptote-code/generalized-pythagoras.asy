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
pen p1 = black+1.2pt;

pair A = (0,0);
pair B = (2.6,0);
pair C = (4,3);
pair D = (C.x,0);

real alpha1=degrees(atan2(C.y,C.x-B.x));
real alpha2=degrees(atan(4/3));

draw(pic2,A--B--C--cycle,p);
draw(pic2,B--D--C--cycle,p1);

label(pic2,"$A$",A+0.3S);
label(pic2,"$B$",B+0.3S);
label(pic2,"$C$",C+0.25N);
label(pic2,"$D$",D+0.3S);

label(pic2,"$c$",0.5(A+B)+0.3S);
label(pic2,"$b$",0.5(A+C)+0.35W+.1N);
label(pic2,"$a$",0.5(B+C)+0.4E);

label(pic2,rotate(90)*"$a\sin(\pi-B)$",(C.x+0.2,0.5*C.y));

perpendicular(D,NW,(0,0)--(1,0),blue);
draw(arc(B,0.5,0,alpha1),PenMargins);
draw(arc(B,0.5,alpha1,180),PenMargins);
draw(arc(B,0.52,alpha1,180),PenMargins);

add(pic2);



