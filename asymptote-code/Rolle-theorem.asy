import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(16pt));

size(22cm, 22cm, keepAspect=true);

picture pic1, pic2;

real f1(real x){return 5-(0.5x-2)^2;}

real xmax = 7;
real xmin = 1;
real xc   = 4;

path f1=graph(f1,xmin,xmax,operator ..);

draw(pic1,graph(f1,xmin,xmax),red+2pt);

draw(pic1,Label("$x$",Relative(0.99)),(-.5,0)--(7.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.5)--(0,5.5),black+1.2pt,Arrow(TeXHead));

//label(pic1,"$x+2y=2$",(1.2,1));

Label L1=Label("$x+2y=2$",align=(-0.,.8),MidPoint);
Label L2=Label("$-x+2y=2$",align=(-0.3,0.8),MidPoint);
Label L3=Label("$-x-2y=2$",align=(-.3,-0.8),MidPoint);
Label L4=Label("$x-2y=2$",align=(-0,-.8),MidPoint);

label(pic1,"$f'(c)=0$",(xc,f1(xc))+(.2,.4));
label(pic1,"$a)$",(.5,-.8));
label(pic2,"$b)$",(.5,-.8));

//label(pic1,"$v=x-2y$",(2.6,1.4),red);

draw(pic1,(xmin,f1(xmin))--(xmin,0),black+1pt);
draw(pic1,(xmax,f1(xmax))--(xmax,0),black+1pt);
draw(pic1,(xmax,f1(xmax))--(0,f1(xmax)),black+1pt);
draw(pic1,(xc,f1(xc))--(xc,0),black+1pt);
draw(pic1,(xc-0.7,f1(xc))--(xc+.7,f1(xc)),blue+1.3pt);

// ticks
path xtick = (0,0) -- (0,-0.15cm);
path ytick = (-xmax+0.15cm,0) --(-xmax,0);

Label ticklabel1 = Label("$a$", position=EndPoint);
Label ticklabel2 = Label("$b$", position=EndPoint);
Label ticklabel3 = Label("$c$",   position=EndPoint);

draw((xmin,0), xtick, L=ticklabel1);
draw((xmax,0), xtick, L=ticklabel2);
draw((xc,0),  xtick, L=ticklabel3);
draw((0,f1(xmin)),  ytick, L=Label("$f(a)=f(b)$", position=EndPoint));

draw( pic1,"$A$",(xmin-.2,f1(xmin)+.4) );
draw( pic1,"$B$",(xmax+.2,f1(xmax)+.4) );
draw( pic1,"$C$",(xc-.35,f1(xc)-.4) );

dot(pic1,(xmin,f1(xmin)),blue+6pt);
dot(pic1,(xmax,f1(xmax)),blue+6pt);
dot(pic1,(xc,f1(xc)),red+6pt);

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
draw(pic2,C--A,black+1pt);
draw(pic2,A--(A.x+.8,A.y),black+1pt);

draw(pic2,B--B+2dir(theta),blue+1pt);
draw(pic2,B--B+1.5dir(180+theta),blue+1pt);
draw(pic2,B--B+.9dir(0),black+1pt);

draw((A.x+xt,0), xtick, L=ticklabel1);
draw((B.x+xt,0), xtick, L=ticklabel3);
draw((C.x+xt,0),  xtick, L=ticklabel2);
draw((xt,A.y),  ytick, L=Label("$f(a)$", position=EndPoint));
draw((xt,C.y),  ytick, L=Label("$f(b)$", position=EndPoint));

draw(pic2,Label("$\alpha$",MidPoint),arc(A,0.43,0,theta),black+1.2pt);
draw(pic2,Label("$\alpha$",MidPoint),arc(B,0.43,0,theta),black+1.2pt);

draw( pic2,"$A$",A + (-0.3,-0.4) );
draw( pic2,"$B$",C + (0.3,0.4) );
draw( pic2,"$C$",B + (.2,0.6) );

//draw( pic2,"$\tan\alpha =\displaystyle\frac{f(b)-f(a)}{b-a}$",C + (1.2,0.2) );

// dots
dot(pic2,A,blue+6pt);
dot(pic2,B,red+6pt);
dot(pic2,C,blue+6pt);


add(shift(xt,0)*pic2);

add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
