import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(15cm, keepAspect=true);
defaultpen(fontsize(20pt));

add(shift(0,0)*grid(6,4,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$\text{Re}$",Relative(0.99)),(-.5,0)--(6,0),black+1.9pt,Arrow(TeXHead));
draw(pic1,Label("$\text{Im}$",Relative(0.99)),(0,-.5)--(0,4),black+1.9pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(3,2);

draw(O--A,blue+3pt);
draw(A--(A.x,0),dashed+black+1.9pt);
draw(A--(0,A.y),dashed+black+1.9pt);

real alphaA=degrees(atan(A.y/A.x));

pair O = (0,0);
real y = -0.5;

Label L1=Label("$a$",align=O,MidPoint,Fill(white));
Label L2=Label("$b$",align=O,MidPoint,Fill(white));
draw(L1,(0,y)--(A.x,y),black+1.9pt,Arrows(TeXHead),Bars);
draw(L2,(y,0)--(y,A.y),black+1.9pt,Arrows(TeXHead),Bars);

draw("$\theta$",arc(O,1,0,alphaA),Arrow,PenMargins);
label("$r$",(1.5,1.5));
label("$P(a+bi)$",(4,2));
label("$P(r\cos\theta+ir\sin\theta)$",(4.5,1.5));

dot(A,black+7pt);

add(pic1);
