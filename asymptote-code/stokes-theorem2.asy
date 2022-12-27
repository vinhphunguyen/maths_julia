import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2;


// pic2

real theta=40;

fill(pic2,unitsquare,mediumgray);
fill(pic2,shift(1.05,0)*unitsquare,mediumgray);
draw(pic2,unitsquare,black+1.pt);
draw(pic2,shift(1.05,0)*unitsquare,black+1.pt);

pair O = (0,0);

draw(pic2,(0.3,0)--(0.5,0),ArcArrow);
draw(pic2,(1,0.3)--(1,0.5),ArcArrow);
draw(pic2,(1.05,0.7)--(1.05,0.5),ArcArrow);
draw(pic2,(0.5,1)--(0.3,1),ArcArrow);
draw(pic2,(0,0.5)--(0,0.3),ArcArrow);

draw(pic2,(0.7,0.)--(0.7,0.)+.25dir(45),red+1pt,ArcArrow(3bp));
draw(pic2,(0.5,1.)--(0.5,1.)+.25dir(45),red+1pt,ArcArrow(3bp));
draw(pic2,(1,.7)--(1,.7)+.28dir(45),red+1pt,ArcArrow(3bp));
draw(pic2,(0,.5)--(0,.5)+.25dir(45),red+1pt,ArcArrow(3bp));

//pair A = (0.7,0.)+.25dir(45);
//draw(pic2,A--(A.x,0),red+.6pt);
//draw(pic2,"$C_x(1)$",(0.7,0.)--(A.x,0),red+1pt,ArcArrow(3bp));

pair A = (1,0.7)+.28dir(45);
draw(pic2,(1,0.7)--(1,A.y),red+1pt,ArcArrow(3bp));
draw(pic2,A--(1,A.y),red+1pt);

label(pic2,"$(1)$",(0.5,-0.2));
label(pic2,"$(2)$",(.9,0.5));
label(pic2,"$(3)$",(.5,1.2));

label(pic2,"$\bm{C}$",(.7,1.1),red);
label(pic2,"$C_y(2)$",(.8,.8),red);

draw(pic2,arc((.5,.5),0.25,-90,90),Arrow,PenMargins);
draw(pic2,shift(1,0)*arc((.5,.5),0.25,-90,90),Arrow,PenMargins);

draw(pic2,Label("$x$",Relative(0.99)),(-.5,-0.3)--(2.,-0.3),black+.6pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(-0.3,-.5)--(-0.3,1.2),black+.6pt,Arrow(TeXHead));

draw(pic2,(1.05,0.4)--(1.05,0.2),blue+1pt,ArcArrow(3bp));
label(pic2,"$C_y(2)$",(1.3,.2),blue);

add (pic2);

//f
