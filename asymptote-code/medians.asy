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
pair A=(2.,3);
pair AB=0.5(B+A);
pair BC=0.5(B+C);
pair CA=0.5(A+C);
pair G=(1/3)*(A+B+C);

//write(degrees(angle(line(A,B),line(B,o))));

pen p =black+1pt;
pen pr =red+.8pt;
pen pb =blue+.5pt;
pen pc =purple+.5pt;

//draw(A--B--C--cycle,p);


draw(A--B,StickIntervalMarker(2,1,angle=-25 ) );
draw(B--C,StickIntervalMarker(2,2,angle=-25 ) );
draw(C--A,StickIntervalMarker(2,2,angle=0 ) );

draw(A--B--C--cycle,p);

draw(A--BC,p);
draw(B--CA,p);
draw(C--AB,p);

label("$A$",A+.3N);
label("$B$",B+.3S);
label("$C$",C+.3S);
label("$G$",G+.35W+0.33S);

label("$M$",AB+.3W);
label("$N$",BC+.3S);
label("$P$",CA+.3E);

dot(G,red+4pt);
