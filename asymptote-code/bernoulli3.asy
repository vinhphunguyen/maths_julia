import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf



pen p=black+1pt;
pen pr=red+1pt;
pen po=purple+.7pt;
pen ptt=gray+.7pt;

real xmax=1.2;
real ymax=-1.5;

real a=1.;
real f(real x){return -a*x^2;}
real fder(real x){return -2a*x;}
pair pnt(real x){return (x,f(x));}

pair P=pnt(0.5xmax);

real tangent_line(real x)
{
  real sl = fder(P.x);
  return f(P.x) + sl*(x-P.x);
}

draw(graph(f,0,xmax,200),pr);
draw(graph(tangent_line,P.x-0.2,P.x+0.5,20),po);


real beta=degrees(atan(fder(P.x)));
real alpha=90-abs(beta);
draw("$\beta$",arc(P,0.45,0,beta),PenMargins);
draw("$\alpha$",arc(P,0.26,90,90+alpha),PenMargins);
write(beta);

real xx=0.3;
draw((P.x-xx,P.y)--(P.x+2xx,P.y),ptt);
draw((P.x,P.y-xx)--(P.x,P.y+xx),ptt);

label("$y(x)$",pnt(xmax)+.2E,red);
label("$P(x,y)$",P+(.3,.1));
label("$\tan\beta=y'$",P+(.8,-.2));
label("tangent line",pnt(xmax)+(0.3,0.5), purple);

draw(Label("$x$",Relative(0.99)),(0,0)--(xmax+.65,0),black+.6pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,0)--(0,ymax),black+.6pt,Arrow(TeXHead));

dot(P,black+5pt);