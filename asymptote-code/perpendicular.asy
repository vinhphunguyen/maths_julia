import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

pair A=(0,0);
pair B=(4.5,0);
pair M=(1.2,3);
pair H=(M.x,0);

pen p =black+.8pt;
pen pr =red+.5pt;
pen pp =purple+.5pt;

//fill(A--x--M--cycle,yellow);
//fill(B--x--M--cycle,orange);

draw( arc(A,length(A-M), -92, 96 ), pr);
draw( arc(B,length(B-M), 100, 270 ), pr);

pair Ds []=intersectionpoints(circle(A,length(A-M)),circle(B,length(M-B)));
pair P = Ds[0];
pair Q = Ds[1];

perpendicularmark(line(P,Q),line(A,B),quarter=1);

draw(A--B,p);
draw(P--Q,pr);
draw(B--Q,pp);
draw(A--Q,pp);
draw(A--M,pp);
draw(B--M,pp);

label("$A$",A+.4W);
label("$B$",B+.4E);
label("$M$",M+.4N);
label("$Q$",Q+.4S);
label("$H$",H+.4NE);

dot(A,blue+4pt);
dot(B,blue+4pt);
dot(P,purple+4pt);
dot(Q,purple+4pt);
dot(M,red+4pt);

