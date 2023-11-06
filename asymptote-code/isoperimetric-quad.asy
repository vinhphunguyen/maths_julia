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
pair B=r*dir(90+30);
pair C=r*dir(40);
pair D=r*dir(-51);


pair Ds []=intersectionpoints(A--C,B--D);
pair P = Ds[0];

pair c1=(1/3)*(A+P+D);
pair c2=(1/3)*(B+C+P);

draw(A--C,p1);
draw(B--D,p1);

//fill(A--P--C--cycle,mediumgray);
//fill(P--B--D--cycle,cyan);

//markangle("$\alpha$",B,P,D,n=1,radius=3mm,Fill(orange));


draw(A--B--C--D--cycle,p);

pen pdot=blue+3pt;

label("$A$",A+(-.1,-.1));
label("$B$",B+.1N);
label("$C$",C+.1E);
label("$D$",D+.1E);

dot(A,pdot);
dot(B,pdot);
dot(C,pdot);
dot(D,pdot);
//dot(P,pdot);
