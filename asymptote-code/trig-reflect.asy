import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(20cm, 20cm, keepAspect=true);


picture pic1, pic2, pic3;

draw(pic1,Label("$x$",Relative(0.99)),(-1.5,0)--(1.5,0),Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.5),Arrow(TeXHead));

draw(pic1,unitcircle,black+1.1pt);
dot(pic1,(1,0),red+3pt);
dot(pic1,(0,1),red+3pt);
dot(pic1,(0,-1),red+3pt);
dot(pic1,(-1,0),red+3pt);

label(pic1,"$0^{\circ}$",(1.2,0.15),red);
label(pic1,"$90^{\circ}$",(0.2,1.2),red);
label(pic1,"$180^{\circ}$",(-1.2,0.15),red);
label(pic1,"$270^{\circ}$",(-.2,-1)+.2SW,red);


real theta=50;
pair A=dir(theta);

draw(pic1,(0,0)--A);
draw(pic1,"$\alpha$",arc((0,0),0.26,0,theta),Arrow,PenMargins);
draw(pic1,"$-\alpha$",arc((0,0),0.5,0,-theta),Arrow,PenMargins);
label(pic1,"$A$",A+(0.1,0.2),blue);
label(pic1,"$A'$",(A.x,-A.y)+(0.1,-0.2),blue);

label(pic1,"$\sin (-\alpha)=\sin \alpha$",(-0.16,-1.5),blue);
label(pic1,"$\cos (-\alpha)=\cos \alpha$",(-0.16,-1.8),blue);

Label L1=Label(rotate(90)*"$\sin\alpha$",align=(0,0),MidPoint,Fill(white));
Label L2=Label(rotate(90)*"$\sin(-\alpha)$",align=(0,0),MidPoint,Fill(white));
draw(pic1,L1,(-.15,0)--(-.15,A.y),Arrows(TeXHead),Bars);
draw(pic1,L2,(-.15,0)--(-.15,-A.y),Arrows(TeXHead),Bars);

draw(pic1,A--(A.x,-A.y));
draw(pic1,A--(0,A.y));
draw(pic1,(A.x,-A.y)--(0,-A.y));

draw(pic1,(0,0)--(A.x,-A.y));

dot(pic1,A,blue+3pt);
dot(pic1,(A.x,-A.y),blue+3pt);

// pic 2

draw(pic2,Label("$x$",Relative(0.99)),(-1.5,0)--(1.5,0),Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.5),Arrow(TeXHead));

draw(pic2,unitcircle,black+1.1pt);
dot(pic2,(1,0),red+3pt);
dot(pic2,(0,1),red+3pt);
dot(pic2,(0,-1),red+3pt);
dot(pic2,(-1,0),red+3pt);

label(pic2,"$0^{\circ}$",(1.2,0.15),red);
label(pic2,"$90^{\circ}$",(0.2,1.2),red);
label(pic2,"$180^{\circ}$",(-1.2,0.15),red);
label(pic2,"$270^{\circ}$",(-.2,-1)+.2SW,red);

real theta=50;
pair A=dir(theta);
pair Ap=(-A.x,A.y);

draw(pic2,(0,0)--A);
draw(pic2,(0,0)--Ap);
draw(pic2,A--Ap);
draw(pic2,A--(A.x,0));
draw(pic2,Ap--(Ap.x,0));

draw(pic2,"$\alpha$",arc((0,0),0.26,0,theta),Arrow,PenMargins);
draw(pic2,"$\pi-\alpha$",arc((0,0),0.5,0,180-theta),Arrow,PenMargins);

label(pic2,"$A$",A+(0.1,0.2),blue);
label(pic2,"$A'$",Ap+(-0.1,0.2),blue);

label(pic2,"$\sin (\pi-\alpha)=\sin \alpha$",(-0.2,-1.5),blue);
label(pic2,"$\cos (\pi-\alpha)=-\cos \alpha$",(-0.2,-1.8),blue);

Label L1=Label(rotate(90)*"$\sin\alpha$",align=(0,0),MidPoint,Fill(white));
Label L2=Label(rotate(90)*"$\sin(-\alpha)$",align=(0,0),MidPoint,Fill(white));
draw(pic1,L1,(-.15,0)--(-.15,A.y),Arrows(TeXHead),Bars);
draw(pic1,L2,(-.15,0)--(-.15,-A.y),Arrows(TeXHead),Bars);



dot(pic2,A,blue+3pt);
dot(pic2,Ap,blue+3pt);

add(shift(3.2,0)*pic2);

// pic 2

draw(pic3,Label("$x$",Relative(0.99)),(-1.5,0)--(1.5,0),Arrow(TeXHead));
draw(pic3,Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.5),Arrow(TeXHead));

draw(pic3,unitcircle,black+1.1pt);
dot(pic3,(1,0),red+3pt);
dot(pic3,(0,1),red+3pt);
dot(pic3,(0,-1),red+3pt);
dot(pic3,(-1,0),red+3pt);

label(pic3,"$0^{\circ}$",(1.2,0.15),red);
label(pic3,"$180^{\circ}$",(-1.2,0.15),red);
label(pic3,"$270^{\circ}$",(-.2,-1)+.2SW,red);

real theta=30;
pair A=dir(theta);
pair Ap=dir(90-theta);

draw(pic3,(0,0)--A);
draw(pic3,(0,0)--Ap);
draw(pic3,A--Ap);
draw(pic3,A--(A.x,0));
draw(pic3,Ap--(0,Ap.y));
draw(pic3,(0,0)--1.5dir(90-theta));

draw(pic3,"$\alpha$",arc((0,0),0.26,0,theta),Arrow,PenMargins);
draw(pic3,"$\alpha$",arc((0,0),0.26,90-theta,90),Arrow,PenMargins);
draw(pic3,"$\pi/2-\alpha$",arc((0,0),1.4,0,90-theta),Arrow,PenMargins);

label(pic3,"$A$",A+(0.1,0.2),blue);
label(pic3,"$A'$",Ap+(-0.1,0.2),blue);

label(pic3,"$\sin (\pi/2-\alpha)=\cos \alpha$",(-0.1,-1.5),blue);
label(pic3,"$\cos (\pi/2-\alpha)=\sin \alpha$",(-0.1,-1.8),blue);

dot(pic3,A,blue+3pt);
dot(pic3,Ap,blue+3pt);

add(shift(6.2,0)*pic3);

/*
xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead)); */

add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
