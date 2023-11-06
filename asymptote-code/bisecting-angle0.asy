import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

point B =(0,0);
point B1=(1.2,0);
real ang = 60;
point B2=1.5dir(ang);
point M =1.dir(0.5*ang);
point B12=1.5dir(0.5ang);

pen p = black + 1pt;
pen pr = red + 1pt;

line  x = perpendicular(M,line(B,M));
point a1 = intersectionpoint(x,line(B,B1));
point b1 = intersectionpoint(x,line(B,B2));

markangle("$\alpha$",B12,B,B2,n=1,radius=9mm,Fill(orange));
markangle("$\alpha$",B1,B,B12,n=1,radius=9mm,Fill(orange));

draw(B--B1,p);
draw(B--B2,p);
draw(B--B12,pr);

label("$l_1$",B1+.1S);
label("$l_2$",B2+.1N);
label("$m$",B12+.1N);
label("$O$",B+(.0,.1));

