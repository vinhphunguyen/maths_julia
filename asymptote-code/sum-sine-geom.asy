import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(18pt));
size(24cm, keepAspect=true);

picture pic2, pic3;

// pic 2

real alpha=20;
real r = 1;

pair O=(0,0);
pair P1=r*dir(alpha);
pair P2=P1+r*dir(2alpha);
pair P3=P2+r*dir(3alpha);
pair A=(r/2)*dir(alpha);
pair B=P1+(r/2)*dir(2alpha);

pair center=extension(A,A+4dir(alpha+90),B,B+4dir(90+2alpha));
real rr=sqrt( (center.x)^2 + (center.y)^2);

draw(pic2,arc(center,rr,-90,5),red+1.2pt);

draw(pic2,O--P1--P2--P3,black+1.9pt);
draw(pic2,P1--(P1.x,0),black+1.2pt);
draw(pic2,P2--(P2.x,0),black+1.2pt);
draw(pic2,P3--(P3.x,0),black+1.2pt);
draw(pic2,P3--O,red+1.9pt);

real xx=P3.x+0.3;

real beta=degrees(atan(P3.y/P3.x));

draw(pic2,center--O,dashed+blue+1.4pt);
draw(pic2,center--P1,dashed+blue+1.4pt);
draw(pic2,center--P2,dashed+blue+1.4pt);
draw(pic2,center--P3,dashed+blue+1.4pt);
draw(pic2,(xx,0)--(xx,2),blue+1.9pt);
draw(pic2,P1--(xx,P1.y),black+1.2pt);
draw(pic2,P2--(xx,P2.y),black+1.2pt);
draw(pic2,P3--(xx,P3.y),black+1.2pt);


draw(pic2,Label("$\alpha$",MidPoint,Fill(white)),arc(O,0.26,0,alpha),black+1.2pt);
draw(pic2,Label("$\beta$",MidPoint,Fill(white)),arc(O,0.36,alpha,beta),black+1.2pt);

label(pic2,"$P_1$",P1+(0.,0.12),blue);
label(pic2,"$P_2$",P2+(0.,0.17),blue);
label(pic2,"$P_3$",P3+(0.,0.17),blue);
label(pic2,"$O$",(-0.2,0.12),blue);
label(pic2,"$d$",(1.2,1.2),red);
label(pic2,"$1$",(0.8,0.2),blue);
label(pic2,"$H$",(P3.x,-0.15),blue);
label(pic2,"$\boxed{P_3H=d\sin(\alpha+\beta)}$",(.5*P3.x,P3.y+0.8),red);

Label L1=Label("$\cos \alpha$",align=O,MidPoint,Fill(white));
Label L2=Label("$\cos 2\alpha$",align=O,MidPoint,Fill(white));
Label L3=Label("$\cos 3\alpha$",align=O,MidPoint,Fill(white));

real y=-0.3;
draw(L1,(0,y)--(P1.x,y),Arrows(TeXHead),Bars);
draw(L2,(P1.x,y)--(P2.x,y),Arrows(TeXHead),Bars);
draw(L3,(P2.x,y)--(P3.x,y),Arrows(TeXHead),Bars);

Label L1=Label("$\sin \alpha$",align=O,MidPoint,Fill(white));
Label L2=Label("$\sin 2\alpha$",align=O,MidPoint,Fill(white));
Label L3=Label("$\sin 3\alpha$",align=O,MidPoint,Fill(white));

real xxx=xx+.5;
draw(L1,(xxx,0)--(xxx,P1.y),Arrows(TeXHead),Bars);
draw(L2,(xxx,P1.y)--(xxx,P2.y),Arrows(TeXHead),Bars);
draw(L3,(xxx,P2.y)--(xxx,P3.y),Arrows(TeXHead),Bars);

// dots
dot(pic2,O,blue+6pt);
dot(pic2,P1,blue+6pt);
dot(pic2,P2,blue+6pt);
dot(pic2,P3,blue+6pt);
dot(pic2,center,red+6pt);

// axes

//xlimits(-.2,3.2);
draw(pic2,Label("$x$",Relative(0.99)),(-.2,0)--(3.2,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.2)--(0,3.2),black+1.2pt,Arrow(TeXHead));
