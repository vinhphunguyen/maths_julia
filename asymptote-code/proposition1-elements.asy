import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(5cm, keepAspect=true);
defaultpen(fontsize(12pt));

pair A=(0,0);
pair B=(1,0);

pen p = black+1pt;
pen p1 = red+.8pt;

draw(A--B,p);
draw(circle(A,length(A-B)),p1);
draw(circle(B,length(A-B)),p1);

pair Ds  []=intersectionpoints(circle(A,length(A-B)),circle(B,length(A-B)));

draw(A--Ds[0],p);
draw(B--Ds[0],p);

dot(Ds[0],red+4pt);

label("$A$",A+.15W);
label("$B$",B+.15E);
label("$C$",Ds[0]+.15N);