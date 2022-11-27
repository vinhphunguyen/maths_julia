import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(12cm, keepAspect=true);
defaultpen(fontsize(16pt));

add(shift(0,-3)*grid(4,6,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$\text{Re}$",Relative(0.99)),(-.5,0)--(4,0),black+1.9pt,Arrow(TeXHead));
draw(pic1,Label("$\text{Im}$",Relative(0.99)),(0,-3)--(0,3),black+1.9pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(3,2);
pair Ap=(3,-2);

draw(O--A,blue+3pt);
draw(O--Ap,blue+3pt);
draw(A--(A.x,-A.y),dashed+black+1.5pt);
draw(A--(0,A.y),dashed+black+1.5pt);

real alphaA=degrees(atan(A.y/A.x));

pair O = (0,0);
real y = -0.5;

Label L1=Label("$-y$",align=O,MidPoint,Fill(white));
Label L2=Label("$y$",align=O,MidPoint,Fill(white));
draw(L2,(y,0)--(y,A.y),black+1pt,Arrows(TeXHead),Bars);
draw(L1,(y,0)--(y,-A.y),black+1pt,Arrows(TeXHead),Bars);

draw("$\theta$",arc(O,1,0,alphaA),Arrow,PenMargins);
draw("$\theta$",arc(O,1,0,-alphaA),Arrow,PenMargins);
label("$r$",(1.5,1.5));
label("$r$",(1.5,-1.5));
label("$z$",(3,2.3));
label("$\bar{z}$",(3,-2.3));

dot(A,black+7pt);
dot(Ap,red+7pt);

add(pic1);
