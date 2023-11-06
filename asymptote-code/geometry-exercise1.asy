import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));



real r = 1;

pair B=(0,0);
pair C=(5,0);
pair A=(2.5,5);
pair D=0.5(B+C);
pair AB=0.5(B+A);

//write(degrees(angle(line(A,B),line(B,o))));

pen p =black+1pt;
pen pr =red+.8pt;
pen pb =blue+.5pt;
pen pc =purple+.5pt;

//draw(A--B--C--cycle,p);


draw(A--B,StickIntervalMarker(1,2,angle=-25 ) );
draw(B--C,p );
draw(C--A,StickIntervalMarker(1,2,angle=-25 ) );

draw(A--B--C--cycle,p);

label("$A$",A+.3N);
label("$B$",B+.3S);
label("$C$",C+.3S);


line per1=perpendicular(B,line(A,C));

draw(A--D,pb);
draw(per1,pb);

point H = intersectionpoint(per1, line(A,D));
point e = intersectionpoint(per1, line(A,C));
pair O = 0.5(A+H);
pair HC=0.5(H+C);

draw(circle(O,length(A-O)),pr);
draw(D--e,pr);
draw(circle(AB,length(A-AB)),pc);
draw(circle(HC,length(C-HC)),pc);
draw(O--e,pb);

label("$H$",H+.3SE);
label("$O$",O+.3E);
label("$E$",e+.3E);
label("$D$",D+.3S);

dot(O,red+4pt);
dot(A,blue+4pt);
dot(B,blue+4pt);
dot(C,blue+4pt);
dot(e,blue+4pt);
dot(H,blue+4pt);

perpendicularmark(line(B,C),line(D,A),quarter=1);
perpendicularmark(line(C,A),line(e,B),quarter=1);

