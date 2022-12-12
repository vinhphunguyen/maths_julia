import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, 5cm, keepAspect=false);

picture pic1, pic2;

real xmin=0, xmax=pi;

real alpha=40;
real alpha=40;

real f(real x) {return sin(x);}
real g(real x) {
	return (x != 0.0) ? sin(x)/x : 1.0;
}

// pic2
draw(pic2,graph(g,xmin,xmax),black+1.pt);

pair A=(1.5,g(1.5));
pair B=(2.2,g(2.2));

label(pic2,"$\alpha$",(B.x,0)+.1S);
label(pic2,"$\beta$",(A.x,0)+.1S);
label(pic2,"$\pi$",(pi,0)+.1S);

label(pic2,"$\boxed{y=\sin x/x}$",(A.x+.6,1.1));

draw(pic2,A--(A.x,0));
draw(pic2,A--(0,A.y));
draw(pic2,B--(B.x,0));

real xx=-0.8;
Label L2=Label("$\small\sin(\beta)/\beta$",align=(0,0),MidPoint,Fill(white));
draw(pic2,L2,(xx,0)--(xx,A.y),Arrows(TeXHead),Bars);

dot(pic2,A,red+4pt);
dot(pic2,B,red+4pt);

draw(pic2,Label("$x$",Relative(0.99)),(-0.1,0)--(3.8,0),black+.9pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-0.1)--(0,1.2),black+.9pt,Arrow(TeXHead));

add(pic2);

// pic1

pair A=(1.5,f(1.5));
pair B=(2.2,f(2.2));

real be1=degrees(atan2(B.y,B.x));
real be2=degrees(atan2(A.y,A.x));

path aa=arc((0,0),0.5,0,be1);
fill(pic1,(0,0)--(0.5,0)--aa--0.5*dir(be1)--cycle,cyan);

draw(pic1,graph(f,xmin,xmax),black+1.pt);

label(pic1,"$\boxed{y=\sin x}$",(A.x+1,1.1));

label(pic1,"$\alpha$",(B.x,0)+.1S);
label(pic1,"$\beta$",(A.x,0)+.1S);
label(pic1,"$\pi$",(pi,0)+.1S);

draw(pic1,Label("$x$",Relative(0.99)),(-0.1,0)--(3.8,0),black+.9pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-0.1)--(0,1.2),black+.9pt,Arrow(TeXHead));

draw(pic1,A--(0,0));
draw(pic1,B--(0,0));
draw(pic1,A--(A.x,0));
draw(pic1,B--(B.x,0));



draw(pic1,arc((0,0),0.5,0,be1),PenMargins);
draw(pic1,arc((0,0),0.7,0,be2),PenMargins);

dot(pic1,A,red+4pt);
dot(pic1,B,red+4pt);

add(shift(5.5,0)*pic1);

