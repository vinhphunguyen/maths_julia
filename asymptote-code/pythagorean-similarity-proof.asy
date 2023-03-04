import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(7cm, keepAspect=true);
defaultpen(fontsize(14pt));

picture pic1, pic2;


// pic2

real theta  = 100;

pair O = (0,0);
pair C = .5dir(theta);
pair B = (-.5,0);
pair A = (.5,0);
pair H = (C.x,0);

real beta=degrees(atan2(A.y,A.x-B.x));
real alpha=90-beta;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

pen p = black+1.pt;
pen p1 = red+1.pt;
pen p2 = blue+1.pt;

draw(pic2,A--B--C--cycle,p);
draw(pic2,C--H,p1);

label(pic2,"$A$",A+.06S);
label(pic2,"$B$",B+.06S);
label(pic2,"$C$",C+.06N);
label(pic2,"$H$",H+.06S);

label(pic2,"$a$",.5(B+C)+.06W);
label(pic2,"$b$",.5(A+C)+.06E);

label(pic2,"$x$",.5(A+H)+.06S);
label(pic2,"$c-x$",.5(B+H)+.06S);


Label L1=Label("$a$",align=O,MidPoint,Fill(white));
Label L2=Label("$b$",align=O,MidPoint,Fill(white));

perpendicularmark(line(B,A),line(H,C),quarter=1);

markangle("$\alpha$",A,B,C,n=1,radius=9mm,Fill(orange));
markangle("$\alpha$",H,C,A,n=1,radius=9mm,Fill(orange));
markangle("$\beta$",B,C,H,n=2,radius=9mm,Fill(cyan));
markangle("$\beta$",C,A,B,n=2,radius=9mm,Fill(cyan));

perpendicularmark(line(B,C),line(C,A),quarter=3);

add(pic2);

// pic1
