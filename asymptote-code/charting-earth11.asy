import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.2pt;

pair A = (0,0);
pair B = (3,0);
pair C = (0,4);

real alpha=degrees(atan(4/3));

draw(pic2,A--B--C--cycle,p);

label(pic2,"$O'$",A+0.3S);
label(pic2,"$Q$",B+0.3S);
label(pic2,"$O$",C+0.25N);

label(pic2,"$R$",0.5(B+C)+0.4E);

perpendicular(A,NE,(0,0)--(1,0),blue);
draw("$\varphi$",arc(B,1.,180-alpha,180),PenMargins);

add(pic2);



