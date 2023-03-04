import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(10pt));

pair A=(0,0);
pair B=(2,0);
pair M=midpoint(A--B);

pair x=(M.x,1.2);
pair xp=(M.x,1.5);

pen p =black+1pt;

fill(A--x--M--cycle,yellow);
fill(B--x--M--cycle,orange);


perpendicularmark(line(M,B),line(M,x),quarter=1);
perpendicularmark(line(M,B),line(M,x),quarter=2);

draw(A--B,p);
draw(M--xp,p);
draw(xp--A--B--cycle,p);
draw(x--A--B--cycle,p);

draw(A--B,StickIntervalMarker(2,2,angle=-25 ) );
draw(A--x,StickIntervalMarker(1,1,angle=-25 ) );
draw(B--x,StickIntervalMarker(1,1,angle=25 ) );

label("$A$",A+.1S);
label("$B$",B+.1S);
label("$M$",M+.1S);
label("$X$",x+.1E);
label("$X'$",xp+.1E);

dot(A,blue+4pt);
dot(B,blue+4pt);
dot(M,red+4pt);

