import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(14pt));

picture pic1, pic2, pic3;

draw(pic1,Label("$x$",Relative(0.99)),(-1.25,0)--(1.25,0),Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1.25)--(0,1.25),Arrow(TeXHead));

draw(pic1,unitcircle,black+1.1pt);

real theta=46, beta=72;
pair A=dir(theta);
pair B=dir(theta+10);
real r1 =.5, r2=.5;

draw(pic1,(0,0)--A,black+1.2pt);
draw(pic1,(0,0)--B,black+1.2pt);
draw(pic1,A--A+r1*dir(90+theta),gray+1.2pt);
draw(pic1,A--A+r2*dir(-90+theta),gray+1.2pt);

perpendicular(pic1,A,SE,A--A+r2*dir(-90+theta),blue);


draw(pic1,"$x$",       arc((0,0),0.26,0,theta),PenMargins);
draw(pic1,arc((0,0),0.5,theta,theta+10),PenMargins);

label(pic1,"$dx$",(0.5,0.3),red);
label(pic1,"$A$",A+(0.1,0.1),blue);
label(pic1,"$C$",B+(-0.16,0.),blue);
label(pic1,"$O$",(-0.1,-0.1),blue);
label(pic1,"tangent to circle at $A$",(1.3,1.0));

Label L1=Label(rotate(90)*"$\sin x$",align=(0,0),MidPoint,Fill(white));
Label L11=Label(rotate(90)*"$\Delta y$",align=(0,0),MidPoint,Fill(white));
Label L2=Label("$\cos x$",align=(0,0),MidPoint,Fill(white));
Label L21=Label("$\Delta x$",align=(0,0),MidPoint,Fill(white));

draw(pic1,L1,(-.15,0)--(-.15,A.y),Arrows(TeXHead),Bars);
draw(pic1,L2,(0,-0.15)--(A.x,-.15),Arrows(TeXHead),Bars);

draw(pic1,A--(0,A.y),dashed+gray+.8pt);
draw(pic1,A--(A.x,0),dashed+gray+.8pt);


dot(pic1,A,blue+3pt);
dot(pic1,B,blue+3pt);


add(pic1);

pair O=(0,0);
pair A=dir(theta);
pair C=A+0.5*dir(90+theta);
pair B=(A.x,C.y);

draw(pic2,O--A,black+1pt);
draw(pic2,A--B--C--cycle,black+1pt);
draw(pic2,A--(A.x,0)--O,black+1pt);

label(pic2,"$O$",O+(-0.1),blue);
label(pic2,"$A$",A+(0.1,0.),blue);
label(pic2,"$B$",B+(0.1,0.1),blue);
label(pic2,"$C$",C+(0,0.1),blue);

draw(pic2,"$x$",       arc((0,0),0.26,0,theta),PenMargins);
draw(pic2,"$x$",       arc(A,0.21,90,90+theta),PenMargins);

perpendicular(pic2,A,NE,A--C,blue);


add(shift(1.2,-1)*pic2);


//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
