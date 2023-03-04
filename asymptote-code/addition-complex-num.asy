import graph;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;


void plot_label(pair A, pair B, pair C, string s, real l, pen c)
{
	pair AB=B-A;
	AB=AB/length(AB);
	real alpha=degrees(acos(AB.x));
	if ( AB.y < 0 ) alpha = -alpha;
	pair normal=(-AB.y,AB.x);
	if (dot(normal,C-.5(A+B)) > 0 ) normal *= -1;
	label(rotate(alpha)*s,.5(A+B)+l*normal,c);
}

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));

add(shift(0,0)*grid(11,10,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$\text{Re}$",Relative(0.99)),(-.5,0)--(11,0),black+1.pt,Arrow(TeXHead));
draw(pic1,Label("$\text{Im}$",Relative(0.99)),(0,-.5)--(0,10),black+1.pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(7,3);
pair B=(3,6);
pair C=(10,9);

draw(O--A,blue+1pt,ArcArrow);
draw(O--B,red+1pt,ArcArrow);
draw(A--C,black+1.pt);
draw(B--C,black+1.pt);
draw(O--C,orange+1.1pt,ArcArrow);


real alphaA=degrees(atan(A.y/A.x));
real alphaB=degrees(atan(B.y/B.x));
real alphaC=degrees(atan(C.y/C.x));

Label La=Label("$\boldsymbol{a}=7+3i$",align=(0,0),MidPoint);
Label Lb=Label("$\boldsymbol{b}=3+6i$",align=(0,0),MidPoint);
Label Lab=Label("$\boldsymbol{a}+\boldsymbol{b}$",align=(0,0),MidPoint);

plot_label(O,A,B,"$\boldsymbol{a}=7+3i$",.6,blue);
plot_label(O,B,C,"$\boldsymbol{b}=3+6i$",.5,red);
plot_label(O,C,B,"$\boldsymbol{a}+\boldsymbol{b}$",.4,orange);

label("$\boldsymbol{a}+\boldsymbol{b}=10+9i$",(3,8),red);


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
