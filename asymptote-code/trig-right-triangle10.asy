import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.2pt;

pair A = (0,0);
pair B = (3,0);
pair C = (0,4);

real alpha=degrees(atan(4/3));

draw(pic2,A--B--C--cycle,p);

label(pic2,"$A$",A+0.3S);
label(pic2,"$B$",B+0.3S);
label(pic2,"$C$",C+0.25N);

label(pic2,"$3$",0.5(A+B)+0.3S);
label(pic2,"$4$",0.5(A+C)+0.25W);
label(pic2,"$5$",0.5(B+C)+0.4E);

perpendicular(A,NE,(0,0)--(1,0),blue);
draw("$\alpha$",arc(B,1.,180-alpha,180),PenMargins);

add(pic2);

// pic1
pair A = (0,0);
pair B = (6,0);
pair C = (0,8);

real alpha=degrees(atan(4/3));

draw(pic1,A--B--C--cycle,p);

label(pic1,"$A'$",A+0.3S);
label(pic1,"$B'$",B+0.3S);
label(pic1,"$C'$",C+0.25N);

label(pic1,"$6$",0.5(A+B)+0.3S);
label(pic1,"$8$",0.5(A+C)+0.3W);
label(pic1,"$10$",0.5(B+C)+0.4E);

perpendicular(pic1,A,NE,(0,0)--(1,0),blue);
draw(pic1,"$\alpha$",arc(B,1.5,180-alpha,180),PenMargins);

add(shift(4.5,0)*pic1);

