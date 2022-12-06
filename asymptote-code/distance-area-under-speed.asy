import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

size(14cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf

picture pic1, pic2, pic3, pic4;

pair P1 = (0,0);
pair P2 = (2,0);
pair P3 = (2,1.5);
pair P4 = (0,1.5);

pen p= black+1pt;
pen ptt= red+1.3pt;
pen pp= black+.8pt;

fill(pic1, P1--P2--P3--P4--cycle,mediumgray);
draw(pic1, P2--P3,pp);
draw(pic1, P3--P4,ptt); 


label(pic1,"$0$",(-0.25,-0.25));
label(pic1,"$2$",(2,-0.25));
label(pic1,"$20$",(-0.25,1.5));

label(pic1,"$t$",(3.1,-0.25));
label(pic1,"(hours)",(3.1,-0.5));
label(pic1,"$v$",(-0.3,3));
label(pic1,"$\left(\text{km/h}\right)$",(-0.42,2.75));

label(pic1,"$s=40(\text{km})$",(0.9,1.5/2));


draw(pic1,(-0.5,0)--(3,0),black+.6pt,Arrow(TeXHead));
draw(pic1,(0,-0.25)--(0,3),black+.6pt,Arrow(TeXHead));


add(pic1);

// pic2

pair P1 = (0,0);
pair P2 = (1,0);
pair P3 = (1,1.5);
pair P4 = (0,1.5);


fill(pic2, P1--P2--P3--P4--cycle,mediumgray);
draw(pic2, P2--P3,pp);
draw(pic2, P1--P4,pp);
draw(pic2, P3--P4,ptt); 

pair P1 = (1,0);
pair P2 = (2,0);
pair P3 = (2,2.5);
pair P4 = (1,2.5);


fill(pic2, P1--P2--P3--P4--cycle,mediumgray);
draw(pic2, P2--P3,pp);
draw(pic2, P1--P4,pp);
draw(pic2, P3--P4,ptt); 

label(pic2,"$0$",(-0.25,-0.25));
label(pic2,"$1$",(1,-0.25));
label(pic2,"$2$",(2,-0.25));
label(pic2,"$20$",(-0.25,1.5));
label(pic2,"$30$",(-0.25,2.5));

label(pic2,"$t$",(3.1,-0.25));
label(pic2,"(hours)",(3.1,-0.5));
label(pic2,"$v$",(-0.3,3));
label(pic2,"$\left(\text{km/h}\right)$",(-0.42,2.75));

label(pic2,"$20(\text{km})$",(0.5,1.5/2));
label(pic2,"$30(\text{km})$",(1.57,2.5/2));

draw(pic2,(-0.5,0)--(3,0),black+.6pt,Arrow(TeXHead));
draw(pic2,(0,-0.25)--(0,3),black+.6pt,Arrow(TeXHead));

add(shift(4.1,0)*pic2);

// pic3

pair P1 = (0,0);
pair P2 = (0.5,0);
pair P3 = (0.5,0.5);
pair P4 = (0,0.5);


fill(pic3, P1--P2--P3--P4--cycle,mediumgray);
draw(pic3, P2--P3,pp);
draw(pic3, P1--P4,pp);
draw(pic3, P3--P4,ptt); 

pair P1 = (0.5,0);
pair P2 = (1,0);
pair P3 = (1,1);
pair P4 = (0.5,1);


fill(pic3, P1--P2--P3--P4--cycle,mediumgray);
draw(pic3, P2--P3,pp);
draw(pic3, P1--P4,pp);
draw(pic3, P3--P4,ptt); 

pair P1 = (1,0);
pair P2 = (1.5,0);
pair P3 = (1.5,1.5);
pair P4 = (1,1.5);


fill(pic3, P1--P2--P3--P4--cycle,mediumgray);
draw(pic3, P2--P3,pp);
draw(pic3, P1--P4,pp);
draw(pic3, P3--P4,ptt); 

pair P1 = (1.5,0);
pair P2 = (2,0);
pair P3 = (2,2);
pair P4 = (1.5,2);


fill(pic3, P1--P2--P3--P4--cycle,mediumgray);
draw(pic3, P2--P3,pp);
draw(pic3, P1--P4,pp);
draw(pic3, P3--P4,ptt); 

label(pic3,"$0$",(-0.25,-0.25));
label(pic3,"$1$",(1,-0.25));
label(pic3,"$2$",(2,-0.25));
label(pic3,"$20$",(-0.25,1.5));
label(pic3,"$30$",(-0.25,2));

label(pic3,"$t$",(3.1,-0.25));
label(pic3,"(hours)",(3.1,-0.5));
label(pic3,"$v$",(-0.3,3));
label(pic3,"$\left(\text{km/h}\right)$",(-0.42,2.75));


draw(pic3,(-0.5,0)--(3,0),black+.6pt,Arrow(TeXHead));
draw(pic3,(0,-0.25)--(0,3),black+.6pt,Arrow(TeXHead));

add(shift(0,-3.8)*pic3);

// pic4

pair P1 = (0,0);
pair P2 = (1,0);
pair P3 = (1,1.5);
pair P4 = (0,1.5);

real f(real x) { return sqrt(x); }

path s1 = graph(f, 0, 2, n=201);
fill(pic4,s1--(2,f(2))--(2,0)--cycle,mediumgray);
draw(pic4,s1,p);

label(pic4,"$t$",(3.1,-0.25));
label(pic4,"(hours)",(3.1,-0.5));
label(pic4,"$v$",(-0.3,3));
label(pic4,"$\left(\text{km/h}\right)$",(-0.42,2.75));


draw(pic4,(-0.5,0)--(3,0),black+.6pt,Arrow(TeXHead));
draw(pic4,(0,-0.25)--(0,3),black+.6pt,Arrow(TeXHead));

add(shift(4.1,-3.8)*pic4);
