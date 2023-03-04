import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.2pt;
pen p1 = black+.8pt;

pair A = (0,0);
pair C = (3,0);
pair B = (1.3,2.1);

draw(pic1,A--B--C--cycle,p);

real r=0.6;
draw(pic1,C--C+r*E,p1);
draw(pic1,B--B+r*dir(180-degrees(atan2(B.y,C.x-B.x))),p1);
draw(pic1,A--A+r*dir(degrees(atan2(B.y,B.x)) -180 ),p1);

real r=0.3;

draw(pic1,"$a_1$",arc(A,r,0,degrees(atan2(B.y,B.x))),PenMargins);
draw(pic1,"$a_3$",arc(B,r,180+degrees(atan2(B.y,B.x)),360+degrees(atan2(B.y,B.x)) - degrees(atan2(B.y,B.x)) - degrees(atan2(B.y,C.x-B.x)) ),PenMargins);
draw(pic1,"$a_2$",arc(C,r,180-degrees(atan2(B.y,C.x-B.x)),180),PenMargins);

real r=.4;
markangle(A+r*dir(degrees(atan2(B.y,B.x)) -180 ),A,C,n=2,radius=4mm,Fill(yellow));
markangle(C+r*E,C,B,n=2,radius=4mm,Fill(cyan));
markangle(B+r*dir(180-degrees(atan2(B.y,C.x-B.x))),B,A,n=2,radius=4mm,Fill(green));

label(pic1,"$180^\circ-a_1$",A+(.6,-.69));
label(pic1,"$180^\circ-a_2$",C+(.6,.69));
label(pic1,"$180^\circ-a_3$",B+(-1.35,-.0));

dot(pic1, 0.5(B+C), red+3pt);
label(pic1, "$P$", 0.5(B+C) + .4E);
label(pic1, "$A$", A + .3W);
label(pic1, "$C$", B+ .3E);
label(pic1, "$B$", C + .4S);

add(pic1); 

// pic2

pair A=(0,0);
pair B=(2.3,0);
pair C=(2.3,2);
pair D=(0,2);

draw(pic2,A--B--C--D--cycle,p);

real r=0.6;
draw(pic2,A--A+r*S,p1);
draw(pic2,B--B+r*E,p1);
draw(pic2,C--C+r*N,p1);
draw(pic2,D--D+r*W,p1);

dot(pic2, 0.5(B+C), red+3pt);

perpendicular(pic2,A,NE,(0,0)--(1,0),black);
perpendicular(pic2,B,NE,B--C,black);
perpendicular(pic2,C,NE,C--D,black);
perpendicular(pic2,D,NE,D--A,black);

label(pic2,"$a_1$",A+(.43,.43));
label(pic2,"$a_2$",B+(-.43,.43));
label(pic2,"$a_3$",C+(-.43,-.43));
label(pic2,"$a_4$",D+(.43,-.43));


add(shift(5.5,0)*pic2); 

