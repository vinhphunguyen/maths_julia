import graph;
import geometry;
import gsl;
import BezierLib;

usepackage("amsmath");
usepackage("mtpro2");

size(12cm, 12cm,keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf

picture pic1, pic2, pic3, pic4;

// pic1

pen p =black+1pt;
pen pg =gray+1pt;
pen pd =dashed+1pt;
pen pdr =red+dashed+1pt;


real R=1;
real y=0.5;
real r=sqrt(R^2-y^2);

real alpha=40;

draw(pic2,scale(R)*unitcircle,p);

pair O=(0,0);
pair O1=(0,1.5);
pair O2=(0,-1.5);
pair A=R*dir(alpha);
pair B=R*dir(180-alpha);

path aa=arc(O1,B,A);
path bb=arc(O2,A,B);

dot(pic2,O);
dot(pic2,A);
dot(pic2,B);
dot(pic2,0.5(A+B)+.1S);

draw(pic2,aa,p);
draw(pic2,bb,pdr);

add(shift(-3,0)*pic2);

// pic1

real alpha=60;
real alphar=radians(alpha);
real theta=180-alpha*2;
real s   = 2;
real h   = s*cos(radians(theta)/2);
real r   = s*sin(radians(theta)/2);
real d=s*sin(alphar);

real dy=0.5;


pair O=(0,0);
pair O1=(0,-s*cos(alphar/2));
pair A=s*dir(-alpha);
pair B=s*dir(-alpha-theta);

path aa=arc(O,s,-alpha,-alpha-theta);
path bb=shift(0,-2d)*rotate(180)*aa;

fill(pic1,A--aa--B--bb--cycle,green);
fill(pic1,B--(B.x,-h-dy)--shift(0,-dy)*aa--(A.x,-h-dy)--A--aa--cycle,mediumgray);

draw(pic1,aa,p);
draw(pic1,bb,pd);
draw(pic1,shift(0,-dy)*aa,p);
draw(pic1,A--(A.x,-h-dy),p);
draw(pic1,B--(B.x,-h-dy),p);

draw(pic1,(0,-h)--A,p);

dot(pic1,O,black+6pt);

add(pic1);



shipout(bbox(0.25cm));



