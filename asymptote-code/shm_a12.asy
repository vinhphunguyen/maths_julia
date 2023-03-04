import graph;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

add(shift(0,-3)*grid(4,6,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$\text{Re}$",Relative(0.99)),(-.5,0)--(4,0),black+1.pt,Arrow(TeXHead));
draw(pic1,Label("$\text{Im}$",Relative(0.99)),(0,-3)--(0,3),black+1.pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(3,2);
pair Ap=(3,-2);

draw(O--A,blue+1pt);
draw(O--Ap,blue+1pt);
draw(A--(A.x,-A.y),dashed+black+1.pt);
draw(A--(0,A.y),dashed+black+1.pt);

real alphaA=degrees(atan(A.y/A.x));

pair O = (0,0);
real y = -0.5;

Label L1=Label("$-A_2$",align=O,MidPoint,Fill(white));
Label L2=Label("$A_2$",align=O,MidPoint,Fill(white));
draw(L2,(y,0)--(y,A.y),black+.7pt,Arrows(TeXHead),Bars);
draw(L1,(y,0)--(y,-A.y),black+.7pt,Arrows(TeXHead),Bars);

draw("$\phi$",arc(O,1,0,alphaA),Arrow,PenMargins);
draw("$\phi$",arc(O,1,0,-alphaA),Arrow,PenMargins);
label("$A$",(1.5,1.5));
label("$A$",(1.5,-1.5));
label("$A_1+iA_2$",(3,2.3));
label("$A_1-iA_2=2C_1$",(3,-2.3));

dot(A,black+5pt);
dot(Ap,red+5pt);

add(pic1);
