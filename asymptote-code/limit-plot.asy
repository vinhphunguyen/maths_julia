import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(11cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


picture pic1, pic2;


pen p= black+1pt;
pen pd= dashed+.5pt;
pen ptt= black+1.3pt;
pen pp= black+.5pt;


real x  = 1.0;
real a  = 0.6;
real x1 = 0.2;

// function and derivative and tangent ...
real f(real x){return sqrt(x);}

// x0

pair O=(0,0);
pair P=(a,f(a));
pair P1=(x,f(x));
pair P2=(x1,f(x1));
pair P1x=(x1,P1.y);
pair P1y=(P1.x,P2.y);

fill(pic1,P2--P1y--P1--P1x--cycle,mediumgray);

real yyy=0.1;
fill(pic1,shift(a-0.5(x-x1),-0.5yyy)*scale(x-x1,yyy)*unitsquare,yellow);
fill(pic1,shift(-0.5yyy,0.5(P1.y+P2.y)-0.5(P1.y-P2.y))*scale(yyy,P1.y-P2.y)*unitsquare,orange);

// axes

draw(pic1,Label("$x$",Relative(0.99)),(-.2,0)--(1.4,0),black+.7pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.2)--(0,1.6),black+.7pt,Arrow(TeXHead));

real yy=-0.06;
//draw((yy,P1.y)--(yy,P.y+0.06),black+.7pt,Arrow(TeXHead));
//draw((x,yy)--(0+0.06,yy),black+.7pt,Arrow(TeXHead));

draw(pic1, graph(f,0.05,1.2,350),red+1.3pt);
draw(pic1, (x,f(x)) -- (x,0) ,pp);
draw(pic1, P1 -- (P1.x,0) ,pp);
draw(pic1, P1 -- (0,P1.y) ,pp);
draw(pic1, P2 -- (P2.x,0) ,pp);
draw(pic1, P2 -- (0,P2.y) ,pp);
draw(pic1, P2 -- P1y ,pp);
draw(pic1, P2 -- P1x ,pp);

draw(pic1, P -- (0,P.y) ,pd);
draw(pic1, P -- (P.x,0) ,pd);

label("$0$",(-0.1,-0.1));
label("$a$", (a,-0.1) );
label("$a+\delta$", (x,-0.1) );
label("$a-\delta$", (x1,-0.1));
label("$L+\epsilon$", (-0.3,P1.y));
label("$L-\epsilon$", (-0.3,P2.y));
label("$L$", (-0.2,P.y));


label("$y=f(x)$", (x1+.33,P1.y+0.24));

dot(pic1,(x,f(x)),black+4pt);
dot(pic1,P,orange+4pt);
dot(pic1,P1,black+4pt);
dot(pic1,P2,black+4pt);
//dot(pic1,P1x,black+4pt);
//dot(pic1,P1y,black+4pt);


add(pic1);

// pic2

// axes

draw(pic2,Label("$x$",Relative(0.99)),(-.2,0)--(1.4,0),black+.7pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.2)--(0,1.6),black+.7pt,Arrow(TeXHead));

real x  = 0.7;
real a  = 0.6;
real x1 = 0.5;

// function and derivative and tangent ...
real f(real x){return sqrt(x);}

// x0

pair O=(0,0);
pair P=(a,f(a));
pair P1=(x,f(x));
pair P2=(x1,f(x1));

pair P1x=(x1,P1.y);
pair P1y=(P1.x,P2.y);

fill(pic2,P2--P1y--P1--P1x--cycle,mediumgray);

real yy=-0.06;

draw(pic2, graph(f,0.05,1.2,350),red+1.3pt);
draw(pic2, (x,f(x)) -- (x,0) ,pp);
draw(pic2, P1 -- (P1.x,0) ,pp);
draw(pic2, P1 -- (0,P1.y) ,pp);
draw(pic2, P2 -- (P2.x,0) ,pp);
draw(pic2, P2 -- (0,P2.y) ,pp);
draw(pic2, P -- (0,P.y) ,pd);
draw(pic2, P -- (P.x,0) ,pd);


label(pic2,"$\text{smaller $\epsilon$}$", (a,P.y+.3));
label(pic2,"$\text{smaller $\delta$}$", (a+.6,.3));

label(pic2,"$0$",(-0.1,-0.1));

label(pic2,"$a$", (a,-0.1) );
label(pic2,"$L$", (-0.2,P.y));

dot(pic2,(x,f(x)),black+4pt);
dot(pic2,P,orange+4pt);
dot(pic2,P1,black+4pt);
dot(pic2,P2,black+4pt);


add(shift(2,0)*pic2);





