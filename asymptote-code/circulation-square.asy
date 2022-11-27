import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2;


// pic2

real theta=40;

fill(pic2,unitsquare,mediumgray);
draw(pic2,unitsquare,black+1.pt);

pair O = (0,0);

Label Lx=Label("$\Delta x$",align=O,MidPoint,Fill(white));
Label Ly=Label("$\Delta y$",align=O,MidPoint,Fill(white));

real y1=0.4;
real y=-0.4;
draw(Lx,(0,1+y1)--(1,1+y1),Arrows(TeXHead),Bars);
draw(Ly,(1+y1,0)--(1+y1,1),Arrows(TeXHead),Bars);

draw(pic2,(0.3,0)--(0.5,0),ArcArrow);
draw(pic2,(1,0.3)--(1,0.5),ArcArrow);
draw(pic2,(0.5,1)--(0.3,1),ArcArrow);
draw(pic2,(0,0.5)--(0,0.3),ArcArrow);

draw(pic2,(0.7,0.)--(0.7,0.)+.25dir(45),red+1pt,ArcArrow(3bp));
draw(pic2,(0.5,1.)--(0.5,1.)+.25dir(45),red+1pt,ArcArrow(3bp));
draw(pic2,(1,.7)--(1,.7)+.28dir(45),red+1pt,ArcArrow(3bp));
draw(pic2,(0,.5)--(0,.5)+.25dir(45),red+1pt,ArcArrow(3bp));

pair A = (0.7,0.)+.25dir(45);
draw(pic2,A--(A.x,0),red+.6pt);
draw(pic2,"$C_x(1)$",(0.7,0.)--(A.x,0),red+1pt,ArcArrow(3bp));

pair A = (1,0.7)+.28dir(45);
draw(pic2,(1,0.7)--(1,A.y),red+1pt,ArcArrow(3bp));
draw(pic2,A--(1,A.y),red+1pt);

label(pic2,"$(1)$",(0.5,-0.2));
label(pic2,"$(2)$",(1.2,0.5));
label(pic2,"$(3)$",(.5,1.2));
label(pic2,"$(4)$",(-.2,.5));

label(pic2,"$\bm{C}$",(.7,1.1),red);
label(pic2,"$C_y(2)$",(.8,.8),red);

label(pic2,"$\displaystyle\oint \bm{C}\cdot d\bm{s}=?$",(2.1,0.5));
label(pic2,"$\displaystyle\oint \bm{C}\cdot d\bm{s}=(\Delta \times \bm{C})_z \Delta a$",(2.3,.1));

draw(pic2,arc((.5,.5),0.25,-90,90),Arrow,PenMargins);

draw(pic2,Label("$x$",Relative(0.99)),(-.5,-0.3)--(1.,-0.3),black+.6pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(-0.3,-.5)--(-0.3,1.2),black+.6pt,Arrow(TeXHead));

add (pic2);

//f
