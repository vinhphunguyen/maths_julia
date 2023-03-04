import graph;
import geometry;
import markers;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.pt;
pen p1 = black+.5pt;


pair B = (0,0);
pair C = (2,0);
pair A = (0.8,1.2);

pair P = .6B + .4A;
pair Q = .6C + .4A;


//fill(pic3,A--B--C--cycle,mediumgray);


//draw(A--B,StickIntervalMarker(1,1,angle=25 ) );
//draw(A--C,StickIntervalMarker(1,2,angle=25 ) );

draw(A--B--C--cycle,p);
draw(P--Q,p);
draw(P--C,p);
draw(B--Q,p);


label("$A$",A+.13N);
label("$B$",B+.13S);
label("$C$",C+.13S);
label("$P$",P+.13W);
label("$Q$",Q+.13E);
