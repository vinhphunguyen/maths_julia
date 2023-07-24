sepimport graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(14cm, keepAspect=true);


picture pic2, pic3;

// pic 2

draw(pic2,Label("$x$",Relative(0.99)),(-1.5,0)--(1.4,0),black+1pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.5),black+1pt,Arrow(TeXHead));

draw(pic2,unitcircle,black+1.1pt);

real theta=50;
pair A=dir(theta);

draw(pic2,(0,0)--A);
draw(pic2,A--(A.x,0));
draw(pic2,A--(0,A.y));

draw(pic2,"$x$",arc((0,0),0.26,0,theta),Arrow,PenMargins);
draw(pic2,"$x$",arc((0,0),1,0,theta),red+2pt);

label(pic2,"$1$",(0.3,0.5),blue);
label(pic2,"$A$",A+(0.1,0.2),blue);
label(pic2,"$B$",(1.1,-0.14),blue);
label(pic2,"$A'$",(A.x,-0.14),blue);

label(pic2,"$\boxed{\sin x < x} $",(-0.1,-1.3),red+4pt);

Label L1=Label(rotate(90)*"$\sin x$",align=(0,0),MidPoint,Fill(white));
draw(pic2,L1,(-.15,0)--(-.15,A.y),Arrows(TeXHead),Bars);

dot(pic2,A,blue+3pt);

add(pic2);

// pic 3

draw(pic3,Label("$x$",Relative(0.99)),(-1.5,0)--(1.5,0),black+1pt,Arrow(TeXHead));
draw(pic3,Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.5),black+1pt,Arrow(TeXHead));

real theta=50;
pair A=dir(theta);
path aa1=arc((0,0),1,0,theta);

fill(pic3,(0,0)--aa1--cycle,orange);
draw(pic3,unitcircle,black+1.1pt);

draw(pic3,(0,0)--A);

pair B = extension((1,0),(1,0)+3.1dir(90),(0,0),3.1dir(theta));
draw(pic3,(1,0)--B);
draw(pic3,(0,0)--B);

path aa=arc((0,0),0.26,0,theta);
draw(pic3,"$x$",aa,Arrow,PenMargins);

label(pic3,"$1$",(0.3,0.5),blue);

label(pic3,"$A$",A+(0.,0.2),blue);
label(pic3,"$O$",(0.1,-0.2),blue);
label(pic3,"$B$",(1.1,-0.2),blue);
label(pic3,"$H$",B+(.1,0.2),blue);

Label L1=Label(rotate(90)*"$\tan x$",align=(0,0),MidPoint,Fill(white));
draw(pic3,L1,(1.15,0)--(1.15,B.y),Arrows(TeXHead),Bars);

dot(pic3,A,blue+3pt);

label(pic3,"$x/2$",(0.65,0.2),blue);

label(pic3,"$\boxed{\tan x > x} $",(-0.1,-1.3),red+4pt);

add(shift(3,0)*pic3);
