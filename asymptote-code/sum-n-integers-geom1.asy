import graph;
import markers;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

pair O=(0,0);
pair A=(5,0);
pair B=(5,1);
pair C=(4,2);
pair D=(3,3);
pair Ee=(2,4);
pair F=(1,5);

pen p = black+1.2pt;
pen p1 = gray+1.pt;


fill((0,0)--(4,0)--(4,1)--(0,1)--cycle,lightcyan);
fill((0,1)--(3,1)--(3,2)--(0,2)--cycle,lightcyan);
fill((0,2)--(2,2)--(2,3)--(0,3)--cycle,lightcyan);
fill((0,3)--(1,3)--(1,4)--(0,4)--cycle,lightcyan);

fill((4,0)--(5,0)--(4,1)--cycle,lightcyan);
fill((3,1)--(4,1)--(3,2)--cycle,lightcyan);
fill((2,2)--(3,2)--(2,3)--cycle,lightcyan);
fill((1,3)--(2,3)--(1,4)--cycle,lightcyan);
fill((0,4)--(1,4)--(0,5)--cycle,lightcyan);

fill((5,0)--(5,1)--(4,1)--cycle,pink);
fill((4,1)--(4,2)--(3,2)--cycle,pink);
fill((3,2)--(3,3)--(2,3)--cycle,pink);
fill((2,3)--(2,4)--(1,4)--cycle,pink);
fill((1,4)--(1,5)--(0,5)--cycle,pink);


draw(O--A,p);
draw((0,B.y)--B,p);
draw((0,C.y)--C,p);
draw((0,D.y)--D,p);
draw((0,Ee.y)--Ee,p);
draw((0,F.y)--F,p);

draw(O--(0,5),p);
draw((1,0)--F,p);
draw((2,0)--Ee,p);
draw((3,0)--D,p);
draw((4,0)--C,p);
draw((5,0)--B,p);

draw((5,0)--(0,5),p1);

real xx = -0.4;
label("$1$",(xx,4.5));
label("$2$",(xx,3.5));
label("$3$",(xx,2.5));
label("$4$",(xx,1.5));
label("$5$",(xx,0.5));

label("$O$",(0,-0.25));
label("$A$",(5.2,0.));
label("$B$",(0,5.2));














