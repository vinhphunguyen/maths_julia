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

label(pic1,"$0^{\circ}$",(1.2,0.15),red);
label(pic1,"$90^{\circ}$",(0.2,1.2),red);
label(pic1,"$180^{\circ}$",(-1.2,0.15),red);
label(pic1,"$270^{\circ}$",(-.2,-1)+.2SW,red);

label(pic1,"$I$",(0.36,0.6),red);
label(pic1,"$II$",(-0.5,0.6),red);
label(pic1,"$III$",(-0.5,-0.5),red);
label(pic1,"$IV$",(0.5,-0.5),red);
real theta=50;
pair A=dir(theta);
draw(pic1,(0,0)--A);
draw("$\alpha$",arc((0,0),0.26,0,theta),Arrow,PenMargins);
label(pic1,"$A$",A+(0.2,0.2),blue);
dot(pic1,A,blue+3pt);


// pic 2
draw(pic2,Label("$x$",Relative(0.99)),(-1.5,0)--(1.5,0),Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-1.5)--(0,1.5),Arrow(TeXHead));

draw(pic2,unitcircle,black+1.1pt);
dot(pic2,(1,0),red+3pt);
dot(pic2,(0,1),red+3pt);
dot(pic2,(0,-1),red+3pt);
dot(pic2,(-1,0),red+3pt);

label(pic2,"$(1,0)$",(1.3,0.2),red);
label(pic2,"$(0,1)$",(0.2,1.2),red);
label(pic2,"$(-1,0)$",(-1.3,0.2),red);
label(pic2,"$(0,-1)$",(0.6,-1)+.2SW,red);

pair A=dir(theta);

fill(pic2,(0,0)--(A.x,0)--A--cycle,mediumgray);


draw(pic2,(0,0)--A);
draw(pic2,"$\alpha$",arc((0,0),0.26,0,theta),Arrow,PenMargins);
label(pic2,"$A(\cos\alpha,\sin\alpha)$",A+(0.6,0.2),blue);
label(pic2,"$\cos\alpha$",(0.3,-0.16),blue);
label(pic2,rotate(90)*"$\sin\alpha$",(-0.2,0.35),blue);
draw(pic2,A--(A.x,0));
draw(pic2,A--(0,A.y));
dot(pic2,A,blue+3pt);

add(shift(3.2,0)*pic2);

/*
xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead)); */

add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
