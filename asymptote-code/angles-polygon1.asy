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
pair C = (3,0);
pair B = (1.3,2.1);

draw(pic1,A--B--C--cycle,p);

real r=0.3;
draw(pic1,"$a_1$",arc(A,r,0,degrees(atan2(B.y,B.x))),PenMargins);
draw(pic1,"$a_3$",arc(B,r,180+degrees(atan2(B.y,B.x)),360+degrees(atan2(B.y,B.x)) - degrees(atan2(B.y,B.x)) - degrees(atan2(B.y,C.x-B.x)) ),PenMargins);
draw(pic1,"$a_2$",arc(C,r,180-degrees(atan2(B.y,C.x-B.x)),180),PenMargins);

add(pic1); 

// pic2

pair A=(0,0);
pair B=(2.3,0);
pair C=(2.3,2);
pair D=(0,2);

draw(pic2,A--B--C--D--cycle,p);

perpendicular(pic2,A,NE,(0,0)--(1,0),black);
perpendicular(pic2,B,NE,B--C,black);
perpendicular(pic2,C,NE,C--D,black);
perpendicular(pic2,D,NE,D--A,black);

label(pic2,"$a_1$",A+(.43,.43));
label(pic2,"$a_2$",B+(-.43,.43));
label(pic2,"$a_3$",C+(-.43,-.43));
label(pic2,"$a_4$",D+(.43,-.43));


add(shift(3.5,0)*pic2); 

// pic3

pair A=(0.2,0.4);
pair B=(2.3,0);
pair C=(2.9,2);
pair D=(1.5,2.5);
pair G=(.5,1.8);

draw(pic3,A--B--C--D--G--cycle,p);

label(pic3,"$a_1$",A+(.43,.2));
label(pic3,"$a_2$",B+(-.3,.3));
label(pic3,"$a_3$",C+(-.43,-.2));
label(pic3,"$a_4$",D+(.0,-.23));
label(pic3,"$a_5$",G+(.23,-.23));

add(shift(6.5,-0.3)*pic3); 