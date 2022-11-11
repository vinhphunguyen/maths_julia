import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(14cm, 14cm, keepAspect=true);


picture pic1, pic2;

draw(pic1,Label("$x$",Relative(0.99)),(-1.5,0)--(1.5,0),Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1.5)--(0,1.5),Arrow(TeXHead));

draw(pic1,unitcircle,black+1.1pt);
dot(pic1,(1,0),red+3pt);
dot(pic1,(0,1),red+3pt);
dot(pic1,(0,-1),red+3pt);
dot(pic1,(-1,0),red+3pt);

label(pic1,"$1$",(1.2,0.15),red);
label(pic1,"$1$",(0.2,1.2),red);
label(pic1,"$-1$",(-1.2,0.15),red);
label(pic1,"$-1$",(-.2,-1)+.2SW,red);

label(pic1,"$\boxed{x^2+y^2}$",(.5,-1.5),red);
label(pic1,"$\boxed{\sin^2 t+\cos^2 t=1}$",(.1,1.9),red);

real theta=50;
pair A=dir(theta);
draw(pic1,(0,0)--A);
draw(pic1,"$t$",arc((0,0),0.26,0,theta),Arrow,PenMargins);
dot(pic1,A,blue+3pt);

path aa=arc((0,0),1,0,theta);
fill(aa--(0,0)--cycle,mediumgray);

label(pic1,"$(\sin t,\cos t)$",A+(.4,.2),red);

arrow(pic1,"$\text{area}=t/2$",(.5,.25),S,red);

// pic 2
draw(pic2,Label("$x$",Relative(0.99)),(-1.5,0)--(1.7,0),Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-1.5)--(0,1.5),Arrow(TeXHead));

real x(real t) {return cosh(t);}
real x1(real t) {return -cosh(t);}
real y(real t) {return sinh(t);}

real t = 0.8;
pair A=(x(t),y(t));
path sss=graph(x,y,0,t);
fill(pic2,sss--A--(0,0)--cycle,mediumgray);


draw(pic2,graph(x,y,-1,1),black+1.1pt);
draw(pic2,graph(x1,y,-1,1),black+1.1pt);
dot(pic2,(1,0),red+3pt);
dot(pic2,(-1,0),red+3pt);

label(pic2,"$(1,0)$",(1.3,0.2),red);
label(pic2,"$(-1,0)$",(-1.4,0.2),red);


label(pic2,"$(\cosh t,\sinh t)$",A+(.2,.5),red);

draw(pic2,(0,0)--A);
draw(pic2,A--(A.x,0));
draw(pic2,A--(0,A.y));
dot(pic2,A,blue+3pt);


label(pic2,"$\boxed{x^2-y^2=1}$",(.9,-1.5),red);
label(pic2,"$\boxed{\cosh^2 t-\sinh^2 t=1}$",(.1,1.9),red);

arrow(pic2,"$\text{area}=t/2$",(.5,0.25),S,red);

add(shift(3.6,0)*pic2);
add(pic1);

/*
xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead)); */

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
