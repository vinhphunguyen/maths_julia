import graph;
usepackage("amsmath");
usepackage("empheq");
usepackage("color");
usepackage("mtpro2");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

//add(shift(0,0)*grid(6,4,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$\text{x}$",Relative(0.999)),(-.5,0)--(3.2,0),black+1.pt,Arrow(TeXHead));
draw(pic1,Label("$\text{y}$",Relative(0.999)),(0,-.5)--(0,3),black+1.pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(3,2);

draw(O--A,black+1pt);
draw(A--(A.x,0),dashed+black+1.pt);
draw(A--(0,A.y),dashed+black+1.pt);

real alphaA=degrees(atan(A.y/A.x));

pair O = (0,0);
real y = -0.5;

Label L1=Label("$x$",align=O,MidPoint,Fill(white));
Label L2=Label("$y$",align=O,MidPoint,Fill(white));
draw(L1,(0,y)--(A.x,y),black+1.pt,Arrows(TeXHead),Bars);
draw(L2,(y,0)--(y,A.y),black+1.pt,Arrows(TeXHead),Bars);

draw("$\theta$",arc(O,1,0,alphaA),Arrow,PenMargins);
label("$r$",(1.5,1.3));
label("$P(r,\theta)$",(3,2.7));
label("$P(x,y)$",(3,2.2));

dot(A,black+7pt);

add(pic1);
