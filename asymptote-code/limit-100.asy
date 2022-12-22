import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(5cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


picture pic1, pic2;


pen p= black+1pt;
pen ptt= black+1.3pt;
pen pp= black+.5pt;

// axes

draw(pic1,Label("$h$",Relative(0.99)),(-.2,0)--(1.2,0),black+.7pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.2)--(0,1.6),black+.7pt,Arrow(TeXHead));

real x = 0.8;
real x1 = 0.4;

// function and derivative and tangent ...
real a=0.2;
real f(real x){return 0.5+0.6x;}

// x0

pair O=(0,0);
pair P=(0,f(0));
pair P1=(x,f(x));
pair P2=(x1,f(x1));

real yy=-0.06;
draw((yy,P1.y)--(yy,P.y+0.06),black+.7pt,Arrow(TeXHead));
draw((x,yy)--(0+0.06,yy),black+.7pt,Arrow(TeXHead));

draw(pic1, graph(f,-0.2,1,350),red+1.3pt);
draw(pic1, (x,f(x)) -- (x,0) ,pp);
draw(pic1, P1 -- (P1.x,0) ,pp);
draw(pic1, P1 -- (0,P1.y) ,pp);
draw(pic1, P2 -- (P2.x,0) ,pp);
draw(pic1, P2 -- (0,P2.y) ,pp);

label("$0$",(-0.1,-0.1));
label("$h_1$", (x,-0.2) );
label("$h_2$", (x1,-0.2));
label("$y_1$", (-0.2,P1.y));
label("$y_2$", (-0.2,P2.y));
label("$2x_0$", (-0.2,P.y));

label("$g(h)=2x_0+h$", (x1+.2,P1.y+0.24));

dot(pic1,(x,f(x)),black+4pt);
dot(pic1,P,orange+4pt);
dot(pic1,P1,black+4pt);
dot(pic1,P2,black+4pt);


add(pic1);





