import graph;
import geometry;
import gsl;
import BezierLib;

usepackage("amsmath");
usepackage("mtpro2");

size(8cm, 4cm,keepAspect=false);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


real f(real x) { return  x != 0 ? sin(4x)/x : 4.0; }

real xmax1=2.1;

path s1 = graph(f, -xmax1, xmax1, n=201);

pair pmax=(0,f(0));
pair pmin1=(4.49340946/4,f(4.49340946/4));
pair pmin1m=(-4.49340946/4,f(4.49340946/4));
pair pmin2=(7.72525184/4,f(7.72525184/4));
pair pmin3=(-7.72525184/4,f(7.72525184/4));


draw(Label("$x$",Relative(0.99)),(-xmax1-0.2,0)--(xmax1+.2,0),black+.9pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,-1)--(0,4.8),black+.9pt,Arrow(TeXHead));

draw(s1,blue+1pt);

label("global maximum",(1.3,4));
label("local maximum",pmin2+(0,.6));
label("global minimum",pmin1+(0,-.4));

draw((pmin1m.x-0.2,pmin1m.y)--(pmin1m.x+0.2,pmin1m.y));
draw((pmin1.x-0.2,pmin1.y)--(pmin1.x+0.2,pmin1.y));
draw((pmin2.x-0.2,pmin2.y)--(pmin2.x+0.2,pmin2.y));

dot(pmax,red+4pt);
dot(pmin1,black+3pt);
dot(pmin1m,black+3pt);
dot(pmin2,cyan+3pt);
dot(pmin3,cyan+3pt);





