import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(15cm, keepAspect=true);
defaultpen(fontsize(21pt));

add(shift(0,0)*grid(5,6,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$\text{Re}$",Relative(0.99)),(-.5,0)--(5,0),black+1.6pt,Arrow(TeXHead));
draw(pic1,Label("$\text{Im}$",Relative(0.99)),(0,-.5)--(0,6),black+1.6pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(2,2);
pair B=(4,4);
pair C=(B.x,A.y);

fill(A--C--B--cycle,mediumgray);

draw(A--B,blue+2pt);
draw(A--C--B--cycle,blue+2pt);
draw(A--(A.x,0),dashed+black+2pt);
draw(A--(0,A.y),dashed+black+2pt);
draw(B--(0,B.y),dashed+black+2pt);
draw((B.x,A.y)--(B.x,0),dashed+black+2pt);


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

label("$a_2-a_1$",(3,1.8));
label(rotate(90)*"$b_2-b_1$",(B.x+.2,3));
label(rotate(45)*"$|z_1-z_2|$",A+(.7,1.35));

label("$|z_1-z_2|=\sqrt{(a_2-a_1)^2+(b_2-b_1)^2}$",(2.5,4.7),red);

label("$z_1$",A+(-0.2,-0.2));
label("$z_2$",B+(.2,.2));

dot(A,black+6pt);
dot(B,black+6pt);

add(pic1);
