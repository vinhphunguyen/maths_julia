import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2;
real b=1/2;
real g(real x) { return  x^2/(4*b); }

real xmax=2.;
path s = graph(g, -xmax,xmax, n=100);

real x=-1.8;
pair F=(0,b);
pair V=(0,g(0));
pair P=(x,g(x));

draw(pic1,s,red+1.2pt);

pen p = black+1pt;
pen pb = blue+1pt;
draw(pic1,(-2,-b)--(2,-b),p);
draw(pic1,(0,-b)--(0,P.y+0.5),p);

draw(pic1,P--F,pb);
draw(pic1,P--(P.x,-b),pb);

label(pic1,"$|PF|$",0.5(P+F)+.4N);
label(pic1,"$|Pl|$", (P.x-0.4,0.5P.y-0.3) );

label(pic1,"$F(a,b)$",F+(.55,.3));
label(pic1,"$P(x,y)$",P+.6N);
label(pic1,"$V$",V+.3SE);
label(pic1,"directrix $l$",(xmax-0.5,-b+0.2));
label(pic1,"$y=k$",(xmax-0.5,-b-0.2));

perpendicular(pic1, (P.x,-b),NE,(P.x,-b)--(P.x+1,-b),black );
//draw(F--P--(P.x,-b),StickIntervalMarker(n=2,angle=45,blue));

dot(pic1,V,red+4pt);
dot(pic1,F,black+4pt);
dot(pic1,P,black+4pt);

add(pic1);