import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(18cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2, pic3; 

real f1(real x) {return x;}
real f2(real x) {return x*x;}
real f3(real x) {return sin(x)*sin(x);}

pen pp = dashed + black + .9pt;

fill(pic1,(0,0)--(1,0)--(1,0.5)--(0,0.5)--cycle,cyan);
draw(pic1,(1,0.5)--(0,0.5),black);
draw(pic1,(1,1)--(1,0),pp);

draw(pic1, graph(f1,0,1,2),red+1.1pt);

label(pic1, "$y=x$",(1,1.6));

draw(pic1, (1,0)--(1,-0.08), black+.9pt);
draw(pic1, (-0.08,1/2)--(0,1/2), black+.9pt);
draw(pic1, (-0.08,1)--(0,1), black+.9pt);
draw(pic1, (1/2,0)--(1/2,1/2), pp);

label(pic1, "$0$",   (0.1,-0.25), black+.9pt);
label(pic1, "$1$",   (1,-0.25), black+.9pt);
label(pic1, "$c$",   (1/2,-0.25), black+.9pt);
label(pic1, "$1/2$", (-0.25,1/2), red+.9pt);
label(pic1, "$1$", (-0.25,1), black+.9pt);

dot(pic1,(0.5,0.5),black+4pt);

draw(pic1,Label("$\text{x}$",Relative(1)),(-.5,0)--(2.,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$\text{y}$",Relative(1)),(0,-.5)--(0,2),black+1.2pt,Arrow(TeXHead));

add(pic1);

// pic2
fill(pic2,(-1,0)--(1,0)--(1,1/3)--(-1,1/3)--cycle,cyan);
draw(pic2,(-1,1/3)--(1,1/3),black);

draw(pic2, graph(f2,-1,1,100),red+1.1pt);

label(pic2, "$y=x^2$",(1,1.6));

draw(pic2, (1/sqrt(3),1/3)--(1/sqrt(3),0), pp);
draw(pic2, (-1/sqrt(3),1/3)--(-1/sqrt(3),0), pp);

draw(pic2, (-0.08,1)--(0,1), black+.9pt);
draw(pic2, (1,0)--(1,-0.08), black+.9pt);
draw(pic2, (-1,0)--(-1,-0.08), black+.9pt);

label(pic2, "$0$", (0.1,-0.25), black+.9pt);
label(pic2, "$1$", (1,-0.25), black+.9pt);
label(pic2, "$-1$", (-1,-0.25), black+.9pt);
label(pic2, "$1/3$", (-0.25,1/3+0.1), red+.9pt);
label(pic2, "$1$", (-0.25,1), black+.9pt);
label(pic2, "$c$", (1/sqrt(3),-0.25), black+.9pt);
label(pic2, "$-c$", (-1/sqrt(3),-0.25), black+.9pt);

dot(pic2,(1/sqrt(3),1/3),black+4pt);
dot(pic2,(-1/sqrt(3),1/3),black+4pt);

draw(pic2,Label("$\text{x}$",Relative(1)),(-1.5,0)--(1.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$\text{y}$",Relative(1)),(0,-.5)--(0,2),black+1.2pt,Arrow(TeXHead));

add(shift(4,0)*pic2);

// pic3
fill(pic3,(0,0)--(pi,0)--(pi,1/2)--(0,1/2)--cycle,cyan);
draw(pic3,(0,1/2)--(pi,1/2),black);

draw(pic3, graph(f3,0,pi,100),red+1.1pt);

label(pic3, "$y=\sin^2 x$",(1,1.6));

draw(pic3, (-0.08,1)--(0,1), black+.9pt);
draw(pic3, (pi/4,-0.08)--(pi/4,0.0), black+.9pt);
draw(pic3, (3pi/4,-0.08)--(3pi/4,0.0), black+.9pt);

label(pic3, "$0$", (0.1,-0.25), black+.9pt);
label(pic3, "$c$", (pi/4,-0.25), red+.9pt);
label(pic3, "$c$", (3pi/4,-0.25), red+.9pt);
label(pic3, "$\pi$", (pi,-0.25), black+.9pt);
label(pic3, "$\pi/2$", (pi/2,-0.25), black+.9pt);
label(pic3, "$1/2$", (-0.25,1/2), red+.9pt);
label(pic3, "$1$", (-0.25,1), black+.9pt);

draw(pic3, (pi/4,1/2)--(pi/4,0), pp);
draw(pic3, (3pi/4,1/2)--(3pi/4,0), pp);

dot(pic3,(pi/4,0.5),black+4pt);
dot(pic3,(3pi/4,0.5),black+4pt);

draw(pic3,Label("$\text{x}$",Relative(1)),(-.5,0)--(pi+0.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic3,Label("$\text{y}$",Relative(1)),(0,-.5)--(0,2),black+1.2pt,Arrow(TeXHead));

add(shift(7,0)*pic3);

