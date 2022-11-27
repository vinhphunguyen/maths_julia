import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));

//add(shift(-1,-1)*grid(19,10,gray+0.2pt));

picture pic1, pic2;

pair O=(0,0);
pair A=(1,0);
pair A1=(1/3,0);
pair A2=(0,1/2);
pair A3=(1/3,1/2);
pair B=(1,1);
pair C=(0,1);

fill(pic1,O--A1--A3--A2--cycle,lightcyan);
draw(pic1,O--A--B--C--cycle,black+1pt);
draw(pic1,A1--(A1.x,B.y),black+1pt);
draw(pic1,(2/3,0)--(2/3,B.y),black+1pt);
draw(pic1,A2--(1,A2.y),black+1pt);

Label L1=Label("$1$",align=O,MidPoint,Fill(white));
Label L2=Label("$1/3$",align=O,MidPoint,Fill(white));
Label L3=Label("$1/2$",align=O,MidPoint,Fill(white));
Label L4=Label("$2/6$",align=O,MidPoint,Fill(white));

real y = -0.35;
real y1 = y/2;
draw(pic1,L1,(0,y)--(1,y),Arrows(TeXHead),Bars);
draw(pic1,L2,(0,y1)--(1/3,y1),Arrows(TeXHead),Bars);
draw(pic1,L2,(1/3,y1)--(2/3,y1),Arrows(TeXHead),Bars);
draw(pic1,L1,(y,0)--(y,1),Arrows(TeXHead),Bars);
draw(pic1,L3,(y1,0)--(y1,1/2),Arrows(TeXHead),Bars);

label(pic1,"$1/6$",(1/6,1/4));
label(pic1,"$\displaystyle\frac{1}{3}\times\frac{1}{2}=\frac{1}{6}$",(0.4,1.2));
label(pic2,"$\displaystyle\frac{2}{3}\times\frac{1}{2}=\frac{2}{6}$",(0.4,1.2));

add(pic1);

// pic2

fill(pic2,O--(2/3,0)--(2/3,1/2)--A2--cycle,lightcyan);
draw(pic2,O--A--B--C--cycle,black+1pt);
draw(pic2,(1/3,1/2)--(1/3,1),black+1pt);
draw(pic2,(2/3,0)--(2/3,B.y),black+1pt);
draw(pic2,(1/3,1/2)--(1,A2.y),black+1pt);
draw(pic2,(1/3,1/2)--(0,1/2),black+1pt);

Label L1=Label("$1$",align=O,MidPoint,Fill(white));
Label L2=Label("$1/3$",align=O,MidPoint,Fill(white));
Label L22=Label("$2/3$",align=O,MidPoint,Fill(white));
Label L3=Label("$1/2$",align=O,MidPoint,Fill(white));

real y = -0.35;
real y1 = y/2;
draw(pic2,L1,(0,y)--(1,y),Arrows(TeXHead),Bars);
draw(pic2,L22,(0,y1)--(2/3,y1),Arrows(TeXHead),Bars);
draw(pic2,L1,(y,0)--(y,1),Arrows(TeXHead),Bars);
draw(pic2,L3,(y1,0)--(y1,1/2),Arrows(TeXHead),Bars);

label(pic2,L4,(1/3,1/4));

add(shift(2.1,0)*pic2);
