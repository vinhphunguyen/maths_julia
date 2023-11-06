import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));


picture pic1, pic2, pic3;


// pic1 

real alpha1=0;
real alpha2=180;
real alpha3=90+20;
real alpha4=90+40;

draw(arc((0,0),1,-5,185),red+1.2pt);

pair A=dir(alpha2);
pair B=dir(alpha1);
pair C=dir(alpha3);
pair H=(C.x,0);


markangle("$\alpha$",H,A,C,n=1,radius=7mm,Fill(orange));
markangle("$\alpha$",H,C,B,n=1,radius=7mm,Fill(orange));

pen p =black+1pt;
draw(A--B--C--cycle,p);
draw(C--H,p);
perpendicularmark(line(A,C),line(B,C),quarter=3);
perpendicularmark(line(H,C),line(H,B),quarter=1);

label("$A$",A+(.1,-.1));
label("$B$",B+.1E);
label("$C$",C+.1N);
label("$H$",H+.1S);


