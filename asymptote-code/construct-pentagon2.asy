import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));



real alpha1=90;
real alpha2=90+360/5;
real alpha3=90+2*360/5;
real alpha4=90+3*360/5;
real alpha5=90+4*360/5;

pair O=(0,0);
pair A1=dir(alpha1);
pair A2=dir(alpha2);
pair A3=dir(alpha3);
pair A4=dir(alpha4);
pair A5=dir(alpha5);

pair M=(-1,0);
pair n=( 1,0);
pair s=( -.5,0);
pair sp=( sqrt(5)/2 -.5,0);

line x=line(origin,(1,0));
line y=line(origin,(0,1));

pen p = black + 1pt;
pen pg = gray + .7pt;
pen pr = red + 1pt;

//draw(A1--A2--A3--A4--A5--cycle,pr);
draw(unitcircle,p);
draw(arc(s,length(s-A1),-10,10),pr);
draw(arc(A1,length(sp-A1),-40,-20),pr);
draw(arc(A5,length(sp-A1),230,270),pr);
draw(x,pg);
draw(y,pg);
draw(s--A1,p);
draw(sp--A1,p);


draw(M--O,StickIntervalMarker(2,2,angle=-25 ) );

label("$C(S,SA_1)$",sp+.3S);
label("$C(A_1,A_1S')$",A5+(.3,.5));

label("$A_1$",A1+.17NE);
label("$A_2$",A2+.17E);
label("$A_3$",A3+.17SW);
label("$A_4$",A4+.17E);
label("$A_5$",A5+.17E);
label("$M$",M+.17SW);
label("$N$",n+.17SE);
label("$S$",s+.1S);
label("$O$",(0,0)+.1SE);
label("$S'$",sp+.1SE);


dot(origin,red+4pt);
dot(A1,red+4pt);
dot(A2,red+4pt);
dot(A3,red+4pt);
dot(A4,red+4pt);
dot(A5,red+4pt);
dot(M,purple+4pt);
dot(n,purple+4pt);
dot(s,purple+4pt);
dot(sp,purple+4pt);



