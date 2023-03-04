import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));


int     n = 10;
real alpha=360/n;

real alpha1=0;
real alpha2=1*alpha;
real alpha3=2*alpha;
real alpha4=3*alpha;
real alpha5=4*alpha;
real alpha6=5*alpha;
real alpha7=6*alpha;

pair O=(0,0);
pair A1=dir(alpha1);
pair A2=(2,0);

pair M=(A2.x,0);

line x=line(origin,(1,0));
line y=line(origin,(0,1));

pen p = black + 1pt;
pen pg = gray + .7pt;
pen pr = red + 1pt;
pen pb = blue + 1pt;

//draw(A1--A2--A3--A4--A5--cycle,pr);
//draw(unitcircle,p);
draw(shift(1,0)*unitcircle,pg);

draw(x,pg);
draw(y,pg);

//perpendicularmark(line(O,M),line(M,A2),quarter=1);

label("$O$",(0,0)+.18SW);
label("$A_1$",(1,0)+.18NE);
label("$M$",A2+.18NE);
label("$x$",(2,0)+.18SE);
label("$y$",(0,1)+.18NE);
label("$1$",(0.5,-0.2));


dot(origin,blue+4pt);
dot((1,0),blue+4pt);
dot(A2,red+4pt);



