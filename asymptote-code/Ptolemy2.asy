import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6.5cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p = black+1pt;
pen p1 = black+.7pt;

real r=0.6;
pair O=(0,0);
pair A=r*dir(180+10);
pair B=r*dir(90+20);
pair C=r*dir(30);
pair D=r*dir(-51);


pair Ds []=intersectionpoints(A--C,B--D);
pair P = Ds[0];

pair e=0.2A+0.8P;

draw(A--C,p);
draw(B--D,p);
draw(B--e,p);

//fill(A--P--C--cycle,mediumgray);
//fill(P--B--D--cycle,cyan);

markangle("",C,A,B,n=1,radius=5mm);
markangle("",C,D,B,n=1,radius=5mm);

markangle("",D,B,C,n=2,radius=5mm);
markangle("",A,B,e,n=2,radius=5mm);

markangle("",B,C,A,n=3,radius=5mm);
markangle("",B,D,A,n=3,radius=6mm);

markangle("",A,B,D,n=4,radius=8mm);

draw(circle(O,r),p1);


draw(A--B--C--D--cycle,p);

pen pdot=blue+3pt;

label("$A$",A+(-.1,-.1));
label("$B$",B+.1N);
label("$C$",C+.1E);
label("$D$",D+.1E);
label("$E$",e+.1S);

dot(A,pdot);
dot(B,pdot);
dot(C,pdot);
dot(D,pdot);
dot(e,red+3pt);
//dot(P,pdot);
