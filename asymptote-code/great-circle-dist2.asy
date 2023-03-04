import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2;

pen p=black+1pt;
pen pp=black+3pt;

real r=0.7;
draw(pic1,scale(r)*unitcircle,p);

pair O=(0,0);
pair M=r*dir(-40);
pair Q=(-M.x,M.y);

draw(pic1,O--Q--M--cycle,p);

label(pic1,"$d$",0.5(Q+M)+.12S);
label(pic1,"$r$",0.5(O+M)+.15E);
draw(pic1,"$\theta$",arc(O,.3,-40,-40-100),PenMargins);


label(pic1,"$O'$",.2N);
label(pic1,"$M$",M+.2E);
label(pic1,"$Q$",Q+.2W);

dot(pic1,O,pp);
dot(pic1,Q,pp);
dot(pic1,M,pp);

add(pic1);

draw(pic2,scale(1.2)*unitcircle,p);

pair M=1.2dir(-40);
pair Q=(-M.x,M.y);

draw(pic2,O--Q--M--cycle,p);

label(pic2,"$d$",0.5(Q+M)+.2S);
label(pic2,"$R$",0.5(O+M)+.2N);
draw(pic2,"$\alpha$",arc(O,.4,-40,-40-100),PenMargins);

label(pic2,"great circle",(-0.1,0.8));

label(pic2,"$O$",.2N);
label(pic2,"$M$",M+.2E);
label(pic2,"$Q$",Q+.2W);

dot(pic2,O,pp);
dot(pic2,Q,pp);
dot(pic2,M,pp);

add(shift(0,-2.5)*pic2);