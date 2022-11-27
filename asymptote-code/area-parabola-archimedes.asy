import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(18cm,6cm, keepAspect=false);
defaultpen(fontsize(10pt));


picture pic1, pic2, pic3;

// pic 2

real alpha=20;
real r = 1;



real f(real x){return x^2;}

real xmax =  1;
real xmin = -1;

pair O=(0,0);
pair A=(1,1);
pair B=(-1,1);
pair C1=(0.5,f(0.5));
pair C2=(-0.5,f(0.5));
pair R=(0.5,0.5);
pair Ss=(0.5,1.);

path f1=graph(f,xmin,xmax,operator ..);

fill(pic1,O--A--B--cycle,lightcyan);
fill(pic1,O--C1--A--cycle,lightgreen);
fill(pic1,O--C2--B--cycle,lightgreen);

draw(pic1,O--A--B--cycle,black+1pt);
draw(pic1,O--C1--A--cycle,black+1pt);
draw(pic1,O--C2--B--cycle,black+1pt);

draw(pic1,f1,red+1.2pt);
draw(pic1,(-1,1)--(1,1),blue+1.2pt);

draw(pic1,A--(A.x,0),dashed+gray+1pt);
draw(pic1,B--(B.x,0),dashed+gray+1pt);
draw(pic1,C1--(C1.x,0),dashed+gray+1pt);
draw(pic1,C2--(C2.x,0),dashed+gray+1pt);

label(pic1,"$\Delta_1$",(0.2,0.54));
label(pic1,"$\Delta_2$",(0.5,0.4));
label(pic1,"$\Delta_3$",(-0.5,0.4));
label(pic1,"$y=1$",(0.23,1.05));

label(pic1,"$O$",(0,-0.04));
label(pic2,"$O$",(0,-0.04));

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelA = Label("$0.5$", position=EndPoint);
Label ticklabelB = Label("$1.0$", position=EndPoint);
Label ticklabelC = Label("$-0.5$", position=EndPoint);
Label ticklabelD = Label("$-1.0$", position=EndPoint);

draw((A.x,0), xtick, L=ticklabelB, black+.4pt);
draw((C1.x,0), xtick, L=ticklabelA, black+.4pt);
draw((C2.x,0), xtick, L=ticklabelC, black+.4pt);
draw((B.x,0), xtick, L=ticklabelD, black+.4pt);

// axes
draw(pic1,Label("$x$",Relative(0.99)),(-1.4,0)--(1.4,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,.0)--(0,1.2),black+1.2pt,Arrow(TeXHead));

add(pic1);

// pic 2

fill(pic2,O--C1--R--cycle,lightcyan);
fill(pic2,A--C1--R--cycle,lightgreen);

draw(pic2,f1,red+1.2pt);

draw(pic2,O--A--B--cycle,black+1pt);
draw(pic2,O--C1--A--cycle,black+1pt);
draw(pic2,O--C2--B--cycle,black+1pt);

draw(pic2,C1--R--cycle,black+1pt);

draw(pic2,f1,red+1.2pt);
draw(pic2,(-1,1)--(1,1),blue+1.2pt);

draw(pic2,A--(A.x,0),dashed+gray+1pt);
draw(pic2,B--(B.x,0),dashed+gray+1pt);
draw(pic2,C1--(C1.x,0),dashed+gray+1pt);
draw(pic2,C2--(C2.x,0),dashed+gray+1pt);


label(pic2,"$Q$",C1+.1E);
label(pic2,"$R$",R+.1N);
label(pic2,"$B$",A+.1E);

// axes
draw(pic2,Label("$x$",Relative(0.99)),(-1.4,0)--(1.4,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,.0)--(0,1.2),black+1.2pt,Arrow(TeXHead));

dot(pic2,C1,red+3pt);
dot(pic2,R,red+3pt);

add(shift(3,0)*pic2);

// pic 3

path f1=graph(f,0,xmax,operator ..);

fill(pic3,O--C1--R--cycle,lightcyan);
fill(pic3,A--C1--R--cycle,lightgreen);

draw(pic3,f1,red+1.2pt);

draw(pic3,O--A--B--cycle,black+1pt);
draw(pic3,O--C1--A--cycle,black+1pt);

draw(pic3,C1--R--cycle,black+1pt);

draw(pic3,f1,red+1.2pt);
draw(pic3,(-1,1)--(1,1),blue+1.2pt);

draw(pic3,A--(A.x,0),dashed+gray+1pt);
draw(pic3,B--(B.x,0),dashed+gray+1pt);
draw(pic3,C1--(C1.x,0),dashed+gray+1pt);


label(pic3,"$Q$",C1+.1E);
label(pic3,"$R$",R+.1N);
label(pic3,"$B$",A+.1E);

// axes
draw(pic3,Label("$x$",Relative(0.99)),(0,0)--(1.4,0),black+1.2pt,Arrow(TeXHead));
draw(pic3,Label("$y$",Relative(0.99)),(0,.0)--(0,1.2),black+1.2pt,Arrow(TeXHead));

dot(pic3,C1,red+3pt);
dot(pic3,R,red+3pt);

add(shift(6,0)*pic3);

