import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm,keepAspect=true);
defaultpen(fontsize(12pt));

real f(real x) { return x^2-4x+3; }
real f1(real x) { return 0; }

real xmin=-0.1, xmax=4;
real xm=2;
pair pm=(xm,f(xm));

pen p = black+1.2pt;
pen pd = orange+.8pt;

draw(graph(f,  xmin, xmax, n=201), p);

pair Ds []=intersectionpoints(graph(f,  xmin, xmax, n=201),  graph(f1,  xmin, xmax, n=201));
pair x1=Ds[0];
pair x2=Ds[1];
pair O=(0,0);
pair Op=(xm,0);

draw((pm.x,pm.y-1)--(pm.x,3),pd);

label("$ax^2+bx+c$",(x2.x+.7,3.2));
label("$u^2+d$",(x2.x,2.5));
label("$x_1$",(x1.x-.1,-0.3));
label("$x_2$",(x2.x+.1,-.3));
label("$P$",(pm.x+.2,pm.y-.3));
label("$O$",(0.16,-0.3));
label("$O'$",(pm.x+.2,0-.3));

Label L1=Label("$-\frac{b}{2a}$",align=O,MidPoint,Fill(white));
real y =-2;
draw(L1,(0,y)--(pm.x,y),Arrows(TeXHead),Bars);

dot(O,cyan+4pt);
dot(Op,cyan+4pt);
dot(x1,red+4pt);
dot(x2,red+4pt);
dot(pm,purple+4pt);

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),-2.,3.5,Arrow(TeXHead));


draw(Label("$u$",Relative(0.99)),(pm.x,0.1)--(5,0.1),gray+.9pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(pm.x,0.)--(pm.x,3.5),gray+.9pt,Arrow(TeXHead));
