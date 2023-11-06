import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6.5cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p = black+1pt;
pen p1 = red+.7pt;

real r=0.6;
pair O=(0,0);
pair A=r*dir(180+10);
pair B=r*dir(40);
pair C=r*dir(-42);
pair D=r*dir(90+30);


pair Ds []=intersectionpoints(A--B,C--D);
pair P = Ds[0];

fill(A--D--B--C--cycle,mediumgray);

draw(circle(O,r),p);


draw(A--D--B--C--cycle,p);
draw(A--B,p1);

pen pdot=blue+3pt;

label("$A$",A+(-.1,-.1));
label("$C$",B+.1N);
label("$D$",C+.1E);
label("$B$",D+.1N);

label("$a$",.5(A+D)+.07W);
label("$b$",.5(B+D)+.1N);
label("$c$",.5(C+B)+.1E);
label("$d$",.5(A+C)+.1S);
label("$x$",.5(A+B)+.1S);

dot(A,pdot);
dot(B,pdot);
dot(C,pdot);
dot(D,pdot);
