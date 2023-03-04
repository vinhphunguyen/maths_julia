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
pair C=r*dir(-10);
pair D=r*dir(90+30);


pair Ds []=intersectionpoints(A--B,C--D);
pair P = Ds[0];

fill(A--P--C--cycle,mediumgray);
fill(P--B--D--cycle,cyan);

markangle("$\alpha$",B,P,D,n=1,radius=3mm,Fill(orange));
markangle("$\alpha$",A,P,C,n=1,radius=3mm,Fill(orange));
markangle("$\beta$",C,D,B,n=2,radius=9mm,Fill(yellow));
markangle("$\beta$",C,A,B,n=2,radius=9mm,Fill(yellow));
markangle("$\gamma$",D,B,P,n=3,radius=5mm,Fill(purple));
markangle("$\gamma$",P,C,A,n=3,radius=7mm,Fill(purple));



draw(circle(O,r),p);


draw(A--B,p);
draw(D--C,p);
draw(D--B,p);
draw(A--C,p);

pen pdot=blue+3pt;

label("$A$",A+(-.1,-.1));
label("$B$",B+.1N);
label("$C$",C+.1E);
label("$D$",D+.1N);
label("$P$",P+.15E);

dot(A,pdot);
dot(B,pdot);
dot(C,pdot);
dot(D,pdot);
dot(P,pdot);
