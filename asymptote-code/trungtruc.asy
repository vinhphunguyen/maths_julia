import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));


picture pic1, pic2, pic3;

real r = 1;

pair A=(0,0);
pair B=(2,0);
pair C=(.8,1.3);

//write(degrees(angle(line(A,B),line(B,o))));

pen p =black+1pt;
pen pr =red+.8pt;
pen pb =blue+.5pt;

//draw(A--B--C--cycle,p);


draw(A--B,StickIntervalMarker(2,2,angle=-25 ) );
draw(B--C,StickIntervalMarker(2,1,angle=-25 ) );
draw(C--A,StickIntervalMarker(2,3,angle=-25 ) );

draw(A--B--C--cycle,p);

label("$A$",A+.1W);
label("$B$",B+.1E);
label("$C$",C+.1N);

pair AB = 0.5(A+B);
pair BC = 0.5(C+B);
pair CA = 0.5(A+C);

draw(AB--BC--CA--cycle,pr);

line per1=perpendicular(AB,line(A,B));
line per2=perpendicular(BC,line(B,C));
line per3=perpendicular(CA,line(C,A));

draw(per1,pb);
draw(per2,pb);
draw(per3,pb);

point O = intersectionpoint(per1, per2);

draw(circle(O,length(A-O)),pr);

label("$P$",AB+.15SE);
label("$Q$",BC+.15E);
label("$M$",CA+.15W);

dot(O,red+4pt);
dot(A,blue+4pt);
dot(B,blue+4pt);
dot(C,blue+4pt);

dot(AB,orange+4pt);
dot(BC,orange+4pt);
dot(CA,orange+4pt);

perpendicularmark(line(A,B),line(AB,O),quarter=1);
perpendicularmark(line(B,C),line(BC,O),quarter=1);
perpendicularmark(line(C,A),line(CA,O),quarter=1);

perpendicularmark(line(CA,BC),per1,quarter=1);

