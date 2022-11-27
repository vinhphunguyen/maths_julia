import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(15cm, keepAspect=true);
defaultpen(fontsize(16pt));

add(shift(0,0)*grid(11,10,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$\text{Re}$",Relative(0.99)),(-.5,0)--(11,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$\text{Im}$",Relative(0.99)),(0,-.5)--(0,10),black+1.2pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(7,3);
pair B=(3,6);
pair C=(10,9);

draw(O--A,blue+2pt,ArcArrow);
draw(O--B,red+2pt,ArcArrow);
draw(A--C,black+1.4pt);
draw(B--C,black+1.4pt);
draw(O--C,orange+2pt,ArcArrow);


real alphaA=degrees(atan(A.y/A.x));
real alphaB=degrees(atan(B.y/B.x));
real alphaC=degrees(atan(C.y/C.x));

Label La=Label("$\bm{a}=7+3i$",align=(0,0),MidPoint);
Label Lb=Label("$\bm{b}=3+6i$",align=(0,0),MidPoint);
Label Lab=Label("$\bm{a}+\bm{b}$",align=(0,0),MidPoint);

label(rotate(alphaA)*La,(3.2,.8),blue);
label(rotate(alphaB)*Lb,(1.66,2.55),red);
label(rotate(alphaC)*Lab,(5,4),orange);

label("$\bm{a}+\bm{b}=10+9i$",(3,8),red);


/* Label L1=Label("$y(t)$",align=O,MidPoint,Fill(white));
Label L2=Label("$x(t)$",align=O,MidPoint,Fill(white));
draw(L1,(-.15,0)--(-.15,m_pos.y),Arrows(TeXHead),Bars);
draw(L2,(0,.31)--(m_pos.x,.31),Arrows(TeXHead),Bars); */


path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelx3 = Label("$3$", position=EndPoint);
Label ticklabelx7 = Label("$7$", position=EndPoint);
Label ticklabelx10 = Label("$10$", position=EndPoint);
Label ticklabely3 = Label("$3$", position=EndPoint);
Label ticklabely6 = Label("$6$", position=EndPoint);
Label ticklabely9 = Label("$9$", position=EndPoint);

draw((3,0), xtick, L=ticklabelx3, black+.9pt);
draw((7,0), xtick, L=ticklabelx7, black+.9pt);
draw((10,0), xtick, L=ticklabelx10, black+.9pt);

draw((0,3), ytick, L=ticklabely3, black+.9pt);
draw((0,6), ytick, L=ticklabely6, black+.9pt);
draw((0,9), ytick, L=ticklabely9, black+.9pt);

add(pic1);
