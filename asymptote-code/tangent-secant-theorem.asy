import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p = black+1pt;
pen p1 = black+.7pt;

real r=0.6;
pair O=(0,0);
pair T=(0,-r);
pair P=(2,-r);
pair B=r*dir(90+10);


pair Ds []=intersectionpoints(circle(O,r),P--B);
pair A = Ds[0];
pair H = .5(A+B);

fill(O--T--P--cycle,orange);
fill(O--H--P--cycle,cyan);

draw(circle(O,r),p);

draw(O--B,StickIntervalMarker(1,1,angle=25 ) );
draw(O--A,StickIntervalMarker(1,1,angle=25 ) );
draw(H--A,StickIntervalMarker(1,2,angle=25 ) );
draw(H--B,StickIntervalMarker(1,2,angle=25 ) );


draw(T--P,p);
draw(T--O,p1);
draw(B--O,p1);
draw(A--O,p1);
draw(P--O,p1);
draw(H--O,p1);
draw(P--B,p);

perpendicular(T,NE,T--P,blue);
perpendicular(H,NW,H--B,blue);

pen pdot=blue+3pt;

label("$O$",O + (-0.2,-0.2));
label("$T$",T+.2S);
label("$P$",P+.2S);
label("$A$",A+.2E);
label("$B$",B+.2N);
label("$H$",H+.2N);

dot(O,pdot);
dot(T,pdot);
dot(P,pdot);
dot(A,pdot);
dot(B,pdot);
dot(H,pdot);
