import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(14pt));

picture pic1, pic2;


// pic2

real theta  = 130;

pair O = (0,0);
pair A = dir(theta);
pair B = (-1,0);
pair C = (1,0);
pair M = (0,1);
pair H = (A.x,0);

real beta=degrees(atan2(A.y,A.x-B.x));
real alpha=90-beta;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

pen p = black+1.pt;
pen p1 = red+1.pt;
pen p2 = blue+1.pt;

draw(pic2,arc(O,1,-2,182),p);

draw(pic2,B--C,p);
draw(pic2,C--A--B,p);
draw(pic2,A--H,p1);
draw(pic2,O--M,p2);

label(pic2,"$O$",O+.1S);
label(pic2,"$A$",A+.1N);
label(pic2,"$B$",B+.1S);
label(pic2,"$C$",C+.1S);
label(pic2,"$H$",H+.1S);
label(pic2,"$M$",M+.1N);

perpendicular(pic2,H,NE,(1,0)--(2,0),blue);
perpendicular(pic2,A,NE,A--B,blue);

draw("$\alpha$",arc(B,0.125,0,beta),PenMargins);
draw("$\beta$",arc(C,0.25,180-alpha,180),PenMargins);

Label L1=Label("$a$",align=O,MidPoint,Fill(white));
Label L2=Label("$b$",align=O,MidPoint,Fill(white));

real yy=-0.2;
draw(L1,(B.x,yy)--(H.x,yy),Arrows(TeXHead),Bars);
draw(L2,(H.x,yy)--(C.x,yy),Arrows(TeXHead),Bars);

label(pic2,"$\text{AM}=\displaystyle\frac{a+b}{2}$",(.32,.5), blue);
label(pic2,"$\text{GM}=\displaystyle\sqrt{ab}$",(H.x+.31,.3), red);

dot(O,black+4pt);


add(pic2);

// pic1
