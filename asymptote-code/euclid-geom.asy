import graph;
import geometry;
import markers;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(16cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.2pt;

dot(pic1,(0,0),black+4pt);
label(pic1,"$P$",(0,0)+.25S);
label(pic1,"POINT",(0,-1.2));

add(pic1);

pair A = (-1,-1);
pair B = (1,1);

draw(pic2,A--B,p);

dot(pic2,(-0.5,-0.5),black+4pt);
dot(pic2,(0.5,0.5),black+4pt);

label(pic2,"LINE/SEGMENT",(0,-1.2));
label(pic2,"$P$",(-0.5,-0.5)+0.2N);
label(pic2,"$Q$",(0.5,0.5)+.2N);

Label L=Label("$s$",align=(0,0),MidPoint,Fill(white));

real r=0.5;
pair AA = r*dir(-45);
pair P1 = (-0.5,-0.5) + AA;
pair Q1 = (0.5,0.5)   + AA;

path ls = P1--Q1;
draw(pic2,L,ls,Arrows(TeXHead),Bars);

add(shift(2,0)*pic2);


pair A = (-0.3,-0.1);
pair B = (1,0);
pair C = (0.4,0.85);
fill(pic3,A--B--C--cycle,mediumgray);


markangle(pic3,"$\alpha$",B,A,C,n=1,radius=4mm,Fill(orange));

draw(pic3,A--B--C--cycle,p);

label(pic3,"$A$",A+.2S);
label(pic3,"$B$",B+.2S);
label(pic3,"$C$",C+.2N);


dot(pic3,A,black+4pt);
dot(pic3,B,black+4pt);
dot(pic3,C,black+4pt);

label(pic3,"TRIANGLE",(0.3,-1.2));

add(shift(4,0)*pic3);

fill(pic4,unitcircle,mediumgray);
draw(pic4,unitcircle,p);

draw(pic4,(0,0)--(1,0),p);
dot(pic4,(0,0),black+4pt);
dot(pic4,(1,0),black+4pt);

label(pic4,"$O$",(0,-.2));
label(pic4,"$r$",(0.5,-.2));
label(pic4,"area",(0.,.4));

label(pic4,"CIRCLE",(0,-1.2));

add(shift(6.5,0)*pic4);

