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
pair C=r*dir(30);
pair D=r*dir(-35);
pair B=r*dir(90+30);


fill(A--C--D--cycle,mediumgray);

markangle("$\alpha_1$",D,B,C,n=1,radius=6mm,Fill(yellow));
markangle("$\alpha_2$",A,B,D,n=1,radius=6mm,Fill(orange));
markangle("$\alpha_1$",D,A,C,n=1,radius=6mm,Fill(yellow));
markangle("$\alpha_2$",A,C,D,n=1,radius=6mm,Fill(orange));

markangle(C,D,A,n=1,radius=6mm,Fill(cyan));



draw(circle(O,r),p);


draw(A--D--B--C--cycle,p);
draw(D--C,p);
draw(A--B,p);

pen pdot=blue+3pt;

label("$A$",A+(-.1,-.1));
label("$B$",B+.1N);
label("$C$",C+.1E);
label("$D$",D+.1E);

dot(A,pdot);
dot(B,pdot);
dot(C,pdot);
dot(D,pdot);
