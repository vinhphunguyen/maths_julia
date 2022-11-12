import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(16pt));

size(18cm, keepAspect=true);

picture pic1, pic2;


draw(pic1,Label("$x$",Relative(0.99)),(-.5,0)--(3.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.5)--(0,2.5),black+1.2pt,Arrow(TeXHead));

fill(pic1,(0,0)--(3,0)--(3,2)--cycle,mediumgray);


draw(pic1,(0,0)--(3,2),red+1.6pt,Arrow);
draw(pic1,(3,2)--(3,0),black+1.1pt);
draw(pic1,(3,2)--(0,2),black+1.1pt);

//label(pic1,"$x+2y=2$",(1.2,1));

Label L1=Label("$a_1$",align=(0,0),MidPoint,Fill(white));
Label L2=Label("$a_2$",align=(0,0),MidPoint,Fill(white));
draw(pic1, L1, (0,-0.26)--(3,-0.26),black+1.1pt,Arrows(TeXHead),Bars);
draw(pic1, L2, (-0.26,0)--(-0.26,2),black+1.1pt,Arrows(TeXHead),Bars);

label(pic1,"$\norm{\bm{a}}=\sqrt{a_1^2+a_2^2}$",(2,2.5));

// pic 2

pair P=(2,-2);
pair a=extension(P,P+3.1dir(45),(0,0),(5,0));
pair b=extension(P,P+dir(180),(0,0),(-2.5,-2.5));

fill(pic2,(0,0)--P--(2,2)--cycle,mediumgray);
fill(pic2,(0,0)--P--b--cycle,mediumgreen);

draw(pic2,Label("$y$",Relative(0.99)),(0,0)--(4.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$z$",Relative(0.99)),(0,0)--(0,3.5),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$x$",Relative(0.99)),(0,0)--(-2.5,-2.5),black+1.2pt,Arrow(TeXHead));

label(pic2,"$O$",(-0.20,0.));
label(pic2,"$a_1$",(-1.2,-0.9));
label(pic2,"$a_2$",(3,0.2));
label(pic2,"$a_2$",(0.7,-2.2));
label(pic2,"$a_3$",(2.2,0.7));
label(pic2,"$\bm{a}$",(1,1.2));
label(pic2,"$\sqrt{a_1^2+a_2^2}$",(.3,-1.2));

draw(pic2,(0,0)--(2,2),red+1.6pt,Arrow);
draw(pic2,(2,2)--(2,0),black+1.1pt);
draw(pic2,(2,2)--(0,2),black+1.1pt);

draw(pic2,(2,2)--P,black+1.1pt);
draw(pic2,a--P,black+1.1pt);
draw(pic2,b--P,black+1.1pt);
draw(pic2,(0,0)--P,black+1.1pt);

label(pic2,"$\norm{\bm{a}}=\sqrt{a_1^2+a_2^2+a_3^2}$",(1.8,2.5));

add(shift(5,0)*pic2);

add(pic1);
