import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(16pt));

size(22cm, 22cm, keepAspect=true);

picture pic1, pic2;

real xt=9.5;

real f1(real x){return x^3+x^2-4x+1;}

real xmax = 2;
real xmin = -2;

real x1   =0.868517;
real x2 = -1.53518;

real shiftx = 3;
real yfac   = 0.53;

pair A = yscale(yfac)*shift(shiftx,2)*(xmin,f1(xmin));
pair B = yscale(yfac)*shift(shiftx,2)*(xmax,f1(xmax));
pair C = yscale(yfac)*shift(shiftx,2)*(x1,f1(x1));
pair D = yscale(yfac)*shift(shiftx,2)*(x2,f1(x2));

path f1=graph(f1,xmin,xmax,operator ..);

path tangent1 = (C.x-0.5,C.y) -- C -- (C.x+0.5,C.y);
path tangent2 = (D.x-0.5,D.y) -- D -- (D.x+0.5,D.y);

draw(pic1,yscale(yfac)*shift(shiftx,2)*f1,red+2pt);

draw(pic1,tangent1,blue+1pt);
draw(pic1,tangent2,blue+1pt);

draw(pic1,Label("$x$",Relative(0.99)),(-.5,0)--(7.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.5)--(0,5.5),black+1.2pt,Arrow(TeXHead));

//label(pic1,"$x+2y=2$",(1.2,1));

label(pic1,"$a)$",(.5,-.8));
label(pic2,"$b)$",(.5,-.8));

label(pic1,"$f(c)$",C+.4N);
label(pic1,"$f(d)$",D+.6N);

//label(pic1,"$v=x-2y$",(2.6,1.4),red);

real xmax=7;
// ticks
path xtick = (0,0) -- (0,-0.15cm);
path ytick = (-xmax+0.15cm,0) --(-xmax,0);

Label ticklabel1 = Label("$a$", position=EndPoint);
Label ticklabel2 = Label("$b$", position=EndPoint);
Label ticklabel3 = Label("$c$",   position=EndPoint);
Label ticklabel4 = Label("$d$",   position=EndPoint);

draw((A.x,0), xtick, L=ticklabel1);
draw((B.x,0),  xtick, L=ticklabel2);
draw((C.x,0),  xtick, L=ticklabel3);
draw((D.x,0), xtick, L=ticklabel4);

draw(pic1,C--(C.x,0),dashed+black+.8pt);
draw(pic1,D--(D.x,0),dashed+black+.8pt);
draw(pic1,B--(B.x,0),black+.8pt);
draw(pic1,A--(A.x,0),black+.8pt);

dot(pic1,A,blue+6pt);
dot(pic1,B,blue+6pt);
dot(pic1,C,orange+6pt);
dot(pic1,D,orange+6pt);

// pic 2

pair A=(2,1);
pair B=(3,3);
pair C=(5,4);

real xt=9.5;

real theta=degrees(atan((C.y-A.y)/(C.x-A.x)));

draw(pic2,A .. B .. C,red+2pt);

draw(pic2,Label("$x$",Relative(0.99)),(-.5,0)--(7.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.5)--(0,5.5),black+1.2pt,Arrow(TeXHead));

draw(pic2,A--(A.x,0),black+1pt);
draw(pic2,C--(C.x,0),black+1pt);
draw(pic2,B--(B.x,0),dashed+black+.8pt);
draw(pic2,A--(0,A.y),black+1pt);
draw(pic2,C--(0,C.y),black+1pt);

draw(pic2,B--(B.x+2,B.y),blue+1pt);
draw(pic2,B--(0,B.y),blue+1pt);


draw((A.x+xt,0), xtick, L=ticklabel1);
draw((B.x+xt,0), xtick, L=ticklabel3);
draw((C.x+xt,0),  xtick, L=ticklabel2);
draw((xt,A.y),  ytick, L=Label("$f(a)$", position=EndPoint));
draw((xt,C.y),  ytick, L=Label("$f(b)$", position=EndPoint));

draw( pic2,"$A$",A + (-0.3,-0.4) );
draw( pic2,"$B$",C + (0.3,0.4) );
draw( pic2,"$C$",B + (.2,0.6) );

draw( pic2,"$y=M$",(B.x-1,B.y+.3) );

//draw( pic2,"$\tan\alpha =\displaystyle\frac{f(b)-f(a)}{b-a}$",C + (1.2,0.2) );

// dots
dot(pic2,A,blue+6pt);
dot(pic2,B,red+6pt);
dot(pic2,C,blue+6pt);


add(shift(xt,0)*pic2);

add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
