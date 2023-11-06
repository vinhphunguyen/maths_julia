import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm); // size of the image

pair A=(0,0); // location of the mass m1
pair B=(4,0); // location of the mass m2
pair C=(0,3); // location of the mass m3

pair D=(-3,3); // location of the mass m3
pair Ee=(-3,0); // location of the mass m3
pair F=(0,-4); // location of the mass m3
pair G=(4,-4); // location of the mass m3

perpendicular((0,0),NE,(0,0)--(1,0),blue);

pen p =black+1pt;
pen pr =red+.8pt;
pen pp =purple+.8pt;

real alpha=90-degrees(atan2(3,4));
pair H = B+5*dir(alpha);
pair K = H+5*dir(90+alpha);

line per1=perpendicular(A,line(H,K));
point L = intersectionpoint(per1, line(H,K));
point L1 = intersectionpoint(per1, line(B,C));

fill(B--L1--L--H--cycle,cyan);
fill(L1--L--K--C--cycle,lightgray);

draw(A--C--D--Ee-- cycle, p);
draw(A--B--G--F-- cycle, p);
draw(B--H--K-- C--cycle, p);
draw(A--B--C--cycle,p);

draw(A--K,pp);
draw(B--D,pp);

draw(A--L,pr);

draw(C--A,StickIntervalMarker(1,2,angle=-25 ) );
draw(C--D,StickIntervalMarker(1,2,angle=-25 ) );
draw(Ee--D,StickIntervalMarker(1,2,angle=-25 ) );
draw(Ee--A,StickIntervalMarker(1,2,angle=-25 ) );

draw(B--A,StickIntervalMarker(1,1,angle=-25 ) );
draw(B--G,StickIntervalMarker(1,1,angle=-25 ) );
draw(F--G,StickIntervalMarker(1,1,angle=-25 ) );
draw(F--A,StickIntervalMarker(1,1,angle=-25 ) );

draw(C--B,StickIntervalMarker(1,3,angle=-25 ) );
draw(H--B,StickIntervalMarker(1,3,angle=-25 ) );
draw(H--K,StickIntervalMarker(1,3,angle=-25 ) );
draw(C--K,StickIntervalMarker(1,3,angle=-25 ) );

perpendicularmark(line(C,B),line(C,K),quarter=1);
perpendicularmark(line(A,C),line(C,D),quarter=2);
perpendicularmark(line(F,A),line(A,B),quarter=3);
perpendicularmark(line(A,L),line(L,H),quarter=3);

label("$A$",A+.4SW);
label("$B$",B+.3E);
label("$C$",C+.4N);
label("$D$",D+.4N);
label("$F$",F+.3W);
label("$G$",G+.3E);
label("$E$",Ee+.4S);
label("$H$",H+.3E);
label("$K$",K+.3N);
label("$L$",L+.35NE);
label("$M$",L1+.35E);


