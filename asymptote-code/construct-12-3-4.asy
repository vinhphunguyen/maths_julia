import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));


int     n = 12;
real alpha=360/n;

real alpha1=0;
real alpha2=1*alpha;
real alpha3=2*alpha;
real alpha4=3*alpha;
real alpha5=4*alpha;
real alpha6=5*alpha;
real alpha7=6*alpha;
real alpha8=7*alpha;
real alpha9=8*alpha;
real alpha10=9*alpha;
real alpha11=10*alpha;
real alpha12=11*alpha;

pair O=(0,0);
pair A1=dir(alpha1);
pair A2=dir(alpha2);
pair A3=dir(alpha3);
pair A4=dir(alpha4);
pair A5=dir(alpha5);
pair A6=dir(alpha6);
pair A7=dir(alpha7);
pair A8=dir(alpha8);
pair A9=dir(alpha9);
pair A10=dir(alpha10);
pair A11=dir(alpha11);
pair A12=dir(alpha11);

pair M=(-1,0);
pair n=( 1,0);
pair s=( -.5,0);
pair sp=( sqrt(5)/2 -.5,0);

line x=line(origin,(1,0));
line y=line(origin,(0,1));

pen p = black + 1pt;
pen pg = gray + .7pt;
pen pr = red + 1pt;
pen pb = blue + 1pt;

//draw(A1--A2--A3--A4--A5--cycle,pr);
draw(unitcircle,p);

draw(x,pg);
draw(y,pg);

draw(A1--A4--A7--A10--cycle,pr);
draw(A1--A5--A9--cycle,pb);


label("$O$",(0,0)+.1SE);


dot(origin,red+4pt);
dot(A1,red+4pt);
dot(A2,red+4pt);
dot(A3,red+4pt);
dot(A4,red+4pt);
dot(A5,red+4pt);
dot(A6,red+4pt);
dot(A7,red+4pt);
dot(A8,red+4pt);
dot(A9,red+4pt);
dot(A10,red+4pt);
dot(A11,red+4pt);
dot(A12,red+4pt);



