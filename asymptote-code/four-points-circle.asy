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
pair B=r*dir(30);
pair C=r*dir(-35);
pair D=r*dir(90+30);


pair Ds []=intersectionpoints(A--B,C--D);
pair P = Ds[0];

fill(A--D--B--C--cycle,mediumgray);

markangle("$\alpha$",A,D,B,n=1,radius=3mm,Fill(orange));
markangle("$180^\circ-\beta$",D,B,C,n=1,radius=3mm,Fill(yellow));
markangle("$\beta$",C,A,D,n=2,radius=9mm,Fill(yellow));
markangle("$180^\circ-\alpha$",B,C,A,n=2,radius=5mm,Fill(orange));



draw(circle(O,r),p);


draw(A--D--B--C--cycle,p);

pen pdot=blue+3pt;

label("$A$",A+(-.1,-.1));
label("$C$",B+.1N);
label("$D$",C+.1E);
label("$B$",D+.1N);

dot(A,pdot);
dot(B,pdot);
dot(C,pdot);
dot(D,pdot);
