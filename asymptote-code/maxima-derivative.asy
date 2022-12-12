import graph;
import geometry;
import gsl;
import BezierLib;

usepackage("amsmath");
usepackage("mtpro2");

size(10cm, 8cm,keepAspect=false);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


real f(real x) { return  x^4/4-2x^3+5.5x^2-6x; }
real fp(real x) { return  x^3-6x^2+11x-6; }
real fpp(real x) { return  3x^2-12x+11; }

real xmin=-0.2;
real xmax=4.32;

path s   = graph(f, xmin, xmax, n=201);
path sp  = graph(fp, 0.5, 3.6, n=201);
path spp = graph(fpp, 1, 3, n=201);


pair pmax1=(1,f(1));
pair pmax2=(2,f(2));
pair pmax3=(3,f(3));

pair A=(1,0);
pair B=(2,0);
pair C=(3,0);

fill((0,0)--A--pmax1--(0,pmax1.y)--cycle,mediumgray);
fill(A--B--(B.x,pmax3.y)--(A.x,pmax3.y)--cycle,lightcyan);
fill(B--C--pmax3--(B.x,pmax3.y)--cycle,mediumgray);

draw(Label("$x$",Relative(0.99)),(xmin,0)--(xmax+.9,0),black+.9pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,-4)--(0,4.2),black+.9pt,Arrow(TeXHead));

draw(s,black+1pt);
draw(sp,red+1pt);
draw(spp,blue+1pt);

label("$f(x)$",(4.6,2));
label("$f'(x)$",(3.9,2.8),red);
label("$f''(x)$",(1,2.8),blue);

label("$1$",(1,0.4),black);
label("$2$",(2,0.4),black);
label("$3$",(3,0.4),black);

label("$f''(1)>0$",(1,pmax1.y-0.5),black);
label("$f''(2)<0$",(2,pmax2.y+0.5),black);

label("tangent",(3.5,pmax3.y-0.5),black);


real sl=fp(1/4);
real alpha=atan(sl);
real r=0.5;
draw((1/4,f(1/4)+0.3)--(1/4,f(1/4)+0.3)+(r*cos(alpha),r*sin(alpha)),ArcArrow);


real sl=fp(1.25);
real alpha=atan(sl);
real r=0.5;
draw((1.25,f(1.25)+0.3)--(1.25,f(1.25)+0.3)+(r*cos(alpha),r*sin(alpha)),ArcArrow);

real a =0.4;
draw((pmax1.x-a,pmax1.y)--(pmax1.x+a,pmax1.y),orange+.7pt);
draw((pmax2.x-a,pmax2.y)--(pmax2.x+a,pmax2.y),orange+.7pt);
draw((pmax3.x-a,pmax3.y)--(pmax3.x+a,pmax3.y),orange+.7pt);

draw(A--pmax1);
draw(B--pmax2);
draw(C--pmax3);

dot(pmax1,red+4pt);
dot(pmax2,red+4pt);
dot(pmax3,red+4pt);

dot(A,blue+4pt);
dot(B,blue+4pt);
dot(C,blue+4pt);





