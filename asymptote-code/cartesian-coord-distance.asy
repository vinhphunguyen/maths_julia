import graph;
usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(6.5cm, keepAspect=true);
defaultpen(fontsize(14pt));

add(shift(0,0)*grid(5,5,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$x$",Relative(0.99)),(-.5,0)--(5,0),black+1.pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.5)--(0,5),black+1.pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(1,1);
pair B=(3,3);
pair C=(B.x,A.y);

fill(A--C--B--cycle,mediumgray);

draw(A--C--B--cycle,blue+1.6pt);
draw(A--(A.x,0),dashed+black+1.pt);
draw(A--(0,A.y),dashed+black+1.pt);
draw(B--(0,B.y),dashed+black+1.pt);
draw((B.x,A.y)--(B.x,0),dashed+black+1.pt);


path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelx3 = Label("$a_1$", position=EndPoint);
Label ticklabelx7 = Label("$a_2$", position=EndPoint);
Label ticklabely3 = Label("$b_1$", position=EndPoint);
Label ticklabely6 = Label("$b_2$", position=EndPoint);

draw((A.x,0), xtick, L=ticklabelx3, black+.9pt);
draw((B.x,0), xtick, L=ticklabelx7, black+.9pt);

draw((0,A.y), ytick, L=ticklabely3, black+.9pt);
draw((0,B.y), ytick, L=ticklabely6, black+.9pt);

label("$a_2-a_1$",(2,0.6));
label(rotate(90)*"$b_2-b_1$",(B.x+.4,2));
label(rotate(45)*"$|PQ|$",A+(.7,1.35));

perpendicular((3,1),SE,(3,1)--(2,1) );

//label("$|PQ|=\sqrt{(a_2-a_1)^2+(b_2-b_1)^2}$",(2.5,3.7),red);

label("$P$",A+(-0.4,-0.4));
label("$Q$",B+(.4,.4));
label("$H$",(3,1)+(.4,0));

dot(A,black+6pt);
dot(B,black+6pt);

add(pic1);
