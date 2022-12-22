import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2;

pen p = black + 1pt;
pen pb = blue+1pt;

real b=1/2;
real g(real x) { return  x^2/(4*b); }

real xmax=1.7;
path s = graph(g, -0.3,xmax, n=100);

real x=1.2;
pair F=(0,b);
pair V=(0,g(0));
pair P=(x,g(x));
pair Q=(x,g(x)+.7);

real x0=1.2;
real t(real x) { 
	return  g(x0) + (0.5x0/b) * ( x - x0 ) ; 
}

path tt = graph(t, x-1.3,x+.5);

pair T=(0,t(0));

real alpha=degrees(atan((0.5x0/b)));
real beta=90-alpha;

real r=0.42;
fill(pic1,arc(P,r,alpha,90)--P+r*dir(90)--P--cycle,orange);
draw("$\alpha$",arc(P,r,alpha,90),p);


real r=0.42;
fill(pic1,arc(T,r,alpha,90)--T+r*dir(90)--T--cycle,orange);
draw("$\alpha$",arc(T,r,alpha,90),p);

real r=0.42;
fill(pic1,arc(P,r,-180+alpha,-180+alpha-beta)--P+r*dir(-180+alpha-beta)--P--cycle,green);
draw("$\beta$",arc(P,r,-180+alpha,-180+alpha-beta),p);

draw(pic1,s,red+1.2pt);
draw(pic1,tt,purple+1.2pt);



//draw(pic1,(-2,-b)--(2,-b),p);
draw(pic1,Label("$x$",position=EndPoint, align=NE),(-.3,0)--(2,0),p,Arrow(TeXHead));
draw(pic1,Label("$y$",position=EndPoint, align=NE),(0,-b-.4)--(0,P.y+.8),p,Arrow(TeXHead));

draw(pic1,Q--P,pb,MidArcArrow);
draw(pic1,P--F,pb,MidArcArrow);

label(pic1,"$F(0,b)$",F+(.3,.2));
label(pic1,"$P(x_1,y_1)$",P+.4E);
label(pic1,"$T(0,-y_1)$",T+.4E);
label(pic1,"tangent",(P.x-0.1,P.y-0.6),purple);

dot(pic1,V,red+4pt);
dot(pic1,F,black+4pt);
dot(pic1,P,black+4pt);
dot(pic1,T,black+4pt);

add(pic1);