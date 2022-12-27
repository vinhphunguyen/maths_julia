import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image
defaultpen(fontsize(12pt));

pair O=(0,0); // location of the mass m1
pair A=(5,0); // location of the mass m2
pair B=(2,3); // location of the mass m3
pair C=A+B;
pair H=(B.x,0);

fill(O--A--C--B-- cycle, lightgreen);
draw(O--A--C--B-- cycle, black+1pt);
draw(O--A, black+1pt,ArcArrow);
draw(O--B, red+1pt,ArcArrow);
draw(B--H, dashed+.6pt);


label("$\boldsymbol{a}$",(2.5,-.35));
label("$\boldsymbol{b}$",0.5B+.6W );
label("$||\boldsymbol{b}||\sin\theta$",H+(1,0.5B.y) );


perpendicular(H,NW,blue);

real alpha=degrees(atan(B.y/B.x));
draw("$\theta$",arc(O,1.,0,alpha),PenMargins);