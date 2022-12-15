import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2, pic3;


fill(pic1,unitcircle,mediumgray);
draw(pic1,unitcircle,black+1.1pt);

real theta=46, beta=72;
pair A=dir(theta);
pair B=dir(theta+10);
real r1 =.5, r2=.5;

label(pic1,"$0$",(-0.15,-0.2),black);
label(pic1,"$1$",(1.1,-0.2),black);
label(pic1,"$-1$",(-1.2,-0.2),black);
label(pic1,"$-1$",(-0.2,-1.2),black);
label(pic1,"$1$",(-0.15,1.15),black);


draw(pic1,Label("$x$",Relative(0.99)),(-1.5,0)--(1.5,0),black+.8pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.7),black+.8pt,Arrow(TeXHead));

object box2=draw(pic1,"$x^2+y^2=1$",roundbox,(.0,-1.64),FillDraw(yellow,blue));
object box2=draw(pic1,"$\pi$",box,(.5,.4),FillDraw(yellow));

add(shift(0,1.5)*pic1);

// pic2

real f(real x){return 1/x;}

path g=graph(f,0.36,3);
path g2=graph(f,1,exp(1));
path ff=(1,0)--(1,1)--g2--(exp(1),1/exp(1))--(exp(1),0)--cycle;

fill(pic2,ff,mediumgray);
draw(pic2,g,black+1pt);

draw(pic2,(1,1)--(1,0),dashed+black+.8pt);
draw(pic2,(1,1)--(0,1),dashed+black+.8pt);
draw(pic2,(exp(1),1/exp(1))--(exp(1),0),dashed+black+.8pt);

label(pic2,"$0$",(-0.15,-0.2),black);
label(pic2,"$1$",(1,-0.2),black);
label(pic2,"$1$",(1.7,.3),black);
object box2=draw(pic2,"$e$",box,(exp(1),-0.2),FillDraw(yellow));
label(pic2,"$1$",(-0.2,1),black);

draw(pic2,Label("$x$",Relative(0.99)),(-.25,0)--(3.2,0),black+.8pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.25)--(0,3.25),black+.8pt,Arrow(TeXHead));

object box2=draw(pic2,"$xy=1$",roundbox,(1.6,2.3),FillDraw(yellow,blue));

add(shift(3,0)*pic2);



//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
