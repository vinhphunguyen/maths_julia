import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(4.5cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p =black+1pt;

draw(unitcircle,p);

real alpha=45;
pair O=(0,0);
pair P=dir(alpha);
pair Q=P+.3*dir(alpha+90);

draw(O--P,p);
draw(P--P+.8*dir(alpha-90),p);
draw(P--P+.8*dir(alpha+90),p);
draw(O--Q,black+.6pt);

perpendicular(P,SE,P--P+.5*dir(alpha-90),red);


label("$P$", P + .2NE);
label("$O$", O +.2S);
label("$Q$", Q +.2N);

dot(O,red+4pt);
dot(P,red+4pt);
dot(Q,blue+4pt);