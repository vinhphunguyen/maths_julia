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

add(shift(0,0)*grid(4,4,gray+0.2pt));

picture pic1;

draw(pic1,Label("$\text{Re}$",Relative(0.99)),(-.5,0)--(4,0),black+.9pt,Arrow(TeXHead));
draw(pic1,Label("$\text{Im}$",Relative(0.99)),(0,-.5)--(0,4),black+.9pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(2,3);

draw(O--A,blue+1pt);
draw(A--(A.x,0),dashed+black+.7pt);
draw(A--(0,A.y),dashed+black+.7pt);

real alphaA=degrees(atan(A.y/A.x));

pair O = (0,0);
real y = -0.5;

Label L1=Label("$a$",align=O,MidPoint,Fill(white));
Label L2=Label("$b$",align=O,MidPoint,Fill(white));
draw(L1,(0,y)--(A.x,y),black+.7pt,Arrows(TeXHead),Bars);
draw(L2,(y,0)--(y,A.y),black+.7pt,Arrows(TeXHead),Bars);

draw("$\theta$",arc(O,1,0,alphaA),Arrow,PenMargins);
label("$r$",(1.5,1.5));
label("$\small P(a+bi)$",(2.2,3.8));
label("$\small P(r\cos\theta+ir\sin\theta)$",(2.8,3.4));

dot(A,black+5pt);

add(pic1);
