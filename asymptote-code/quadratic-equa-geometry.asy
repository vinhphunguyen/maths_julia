import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(7cm,keepAspect=true);
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

label("$ax^2+bx+c$",(x2.x,3.2));
label("$x_1$",(x1.x,-0.3));
label("$x_2$",(x2.x+.1,-.3));
label("$P$",(pm.x+.2,pm.y-.3));

Label L1=Label("$-\frac{b}{2a}$",align=O,MidPoint,Fill(white));
Label L4=Label("$\frac{\sqrt{\Delta}}{2a}$",align=O,MidPoint,Fill(white));
real y =-2;
draw(L1,(0,y)--(pm.x,y),Arrows(TeXHead),Bars);
draw(L4,(pm.x,y)--(x2.x,y),Arrows(TeXHead),Bars);

Label L2=Label("$-\frac{b}{2a}-\frac{\sqrt{\Delta}}{2a}$",align=O,MidPoint,Fill(white));
Label L3=Label("$-\frac{b}{2a}+\frac{\sqrt{\Delta}}{2a}$",align=O,MidPoint,Fill(white));

real y =-1;
draw(L2,(0,y)--(x1.x,y),Arrows(TeXHead),Bars);
real y =-2.5;
draw(L3,(0,y)--(x2.x,y),Arrows(TeXHead),Bars);

dot(O,cyan+4pt);
dot(Op,cyan+4pt);
dot(x1,red+4pt);
dot(x2,red+4pt);
dot(pm,purple+4pt);

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),-2.,3.5,Arrow(TeXHead));

