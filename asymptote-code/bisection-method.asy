import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(16pt));

size(9.5cm, keepAspect=true);

picture pic1;

real xt=9.5;

real f1(real x){
	return 
	8*x^3 - 4*x^2 - 3*x + 1;}

real xmax = .6;
real xmin = 0;

real x0 =  0.28659137;

path f1=graph(f1,xmin,xmax,operator ..);

pair A = (0,f1(0));
pair B = (0.5,f1(0.5));
pair X0=(x0,0);
pair AB=(0.5(A.x+B.x),0);
pair A1 = (AB.x,f1(AB.x));

draw(f1,red+1pt);

draw(A--(A.x,0));
draw(B--(B.x,0));
draw(A1--(A1.x,0));

draw(Label("$x$",Relative(0.99)),(-.29,0)--(1.,0),black+1.pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(-0.25,-.5)--(-0.25,1.),black+1.pt,Arrow(TeXHead));

real xmax=7;
// ticks
path xtick = (0,0) -- (0,-0.15cm);
path ytick = (-xmax+0.15cm,0) --(-xmax,0);

label("$a$",(A.x,0)+.1S);
label("$b$",(B.x,0)+.1SE);
label("$x^\ast$",X0+.1NE);
label("$x$",AB+.1S);

label("$f(a)>0$",(-0.05,0.5*A.y));
label("$f(b)<0$",(B.x+0.2,0.5*B.y));

dot(A,blue+4pt);
dot(B,blue+4pt);
dot(X0,red+4pt);
dot(AB,purple+4pt);
dot(A1,purple+4pt);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
