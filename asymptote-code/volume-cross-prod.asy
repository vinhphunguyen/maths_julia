import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(7cm); // size of the image
defaultpen(fontsize(12pt));

pair O=(0,0); // location of the mass m1
pair A=(5,0); // location of the mass m2
pair B=(2,2); // location of the mass m3
pair C=(1,4);
pair H=(0,C.y);
pair D=A+B;
pair AC=A+C;
pair BC=B+C;
pair F=D+C;
pair G=(0,6);

pen p =black+1pt;
pen pd =dashed+.8pt;
pen pr =dashed+red+1pt;
pen pb =blue+1pt;

fill(O--A--D--B-- cycle, green);
draw(O--A, p,ArcArrow);
draw(O--B, pr,ArcArrow);
draw(O--C, pb,ArcArrow);
draw(C--AC--A,p);
draw(A--D,p);
draw(B--D,pd);
draw(C--BC,p);
draw(BC--B,pd);
draw(BC--F--AC,p);
draw(F--D,p);
draw(O--G,p,ArcArrow);
draw(C--H,gray+0.5pt);

label("$\boldsymbol{a}$",(2.5,-.35));
label("$\boldsymbol{b}$",0.5B+.6E );
label("$\boldsymbol{c}$",0.5C+.4E );
label("$||\boldsymbol{a}\times\boldsymbol{b}||$",.5D+(0,0.) );
label("$\boldsymbol{a}\times\boldsymbol{b}$",G+(0,0.7) );

real xx=-.8;
Label L=Label("$||\boldsymbol{c}||\cos\theta$",align=O,MidPoint,Fill(white));
draw(rotate(90)*L,(xx,0)--(xx,C.y),Arrows(TeXHead),Bars);

perpendicular(H,NE);

real alpha=degrees(atan(C.y/C.x));
draw("$\theta$",arc(O,2.,alpha,90),PenMargins);

