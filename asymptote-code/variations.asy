import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf



pen p=black+1pt;
pen pr=red+1pt;
pen po=purple+.7pt;
pen ptt=gray+dashed+.7pt;

real xmin=1;
real xmax=3;
real ymax=2.5;

real esp=1;
real e(real x){return -0.25*(x-1)*(x-3)*sqrt(x);}
real y(real x){return 0.25*(x-1)*(x-4)*sqrt(x)+2;}
real g(real x){return y(x) + esp*e(x);}

pair pnt(real x){return (x,y(x));}

pair A=pnt(xmin);
pair B=pnt(xmax);


draw(graph(y,xmin,xmax,200),p);
draw(graph(e,xmin,xmax,200),pr);
draw(graph(g,xmin,xmax,200),po);

draw(A--(A.x,0),ptt);
draw(B--(B.x,0),ptt);
draw(A--(0,A.y),ptt);
draw(B--(0,B.y),ptt);

real yy=-0.2;
label("$a$",(A.x,yy));
label("$b$",(B.x,yy));
label("$A$",(yy,A.y));
label("$B$",(yy,B.y));

label("$\bar{y}(x)=y(x)+\epsilon_1 \eta(x)$",(2,2.2),purple);
label("$y(x):$ solution",(2,1));
label("$\eta(x)$",(2,.5),red);

draw(Label("$x$",Relative(0.99)),(0,0)--(xmax+.65,0),black+.6pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,0)--(0,ymax),black+.6pt,Arrow(TeXHead));
