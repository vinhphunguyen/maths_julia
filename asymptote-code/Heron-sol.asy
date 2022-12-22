import graph;
import geometry;
import gsl;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);

defaultpen(fontsize(12pt));

pen p =black+1pt;
pen pr =red+1pt;
pen pd =dashed+1pt;
pen p2 =black+1.3pt;

pair O=(0,0);
pair A=(0,3);
pair B=(4,2);
pair Bp=(4,-2);
pair C1=(1.4,0);

real xx=-0.5;

draw((A.x+xx,0)--(B.x+.5,0),p2);
draw(A--C1--B,p);
draw(A--(A.x,0),pd);
draw(B--(B.x,0),pd);
draw(B--Bp,StickIntervalMarker(n=2,angle=45,blue));

draw(B--Bp,p);

pair Ds [] = intersectionpoints((A.x,0)--(B.x,0),A--Bp);
pair C=Ds[0];

draw(A--Bp,p);
draw(A--C1--Bp,p);
draw(B--C,pr);
draw(A--C,pr);

label("$A$",A+.4E);
label("$B$",B+.4N);
label("$B'$",Bp+.4E);
label("$C$",C+.4N);
label("$C'$",C1+.4S);

perpendicular((B.x,0),NW,(0,0)--(1,0),black);

Label La=Label("$a$",align=O,MidPoint,Fill(white));
Label Lb=Label("$b$",align=O,MidPoint,Fill(white));

real yy=A.y+0.5; real yy1=-0.5;
draw(La,(xx,0)--(xx,A.y),Arrows(TeXHead),Bars);
draw(Lb,(B.x-xx,0)--(B.x-xx,B.y),Arrows(TeXHead),Bars);

real theta=degrees(atan(B.y/(B.x-C.x)));

draw("$\alpha$",arc(C,0.52,0,theta),PenMargins);
draw(arc(C,0.49,0,theta),PenMargins);

draw("$\alpha$",arc(C,0.7,0,-theta),PenMargins);
draw(arc(C,0.67,0,-theta),PenMargins);

draw(arc(C,0.52,-180,-180-theta),PenMargins);
draw(arc(C,0.49,-180,-180-theta),PenMargins);

string s="\begin{minipage}{3cm}
\begin{align*}
  AC + CB &= AB' \\
  AC'+C'B &= AC'+C'B'\\
  AC'+C'B' &> AB'
\end{align*}
\end{minipage}
";

label(s,(B.x+4,1.2), black);

dot(A,black+4pt);
dot(B,black+4pt);
dot(Bp,black+4pt);
dot(C1,blue+4pt);
dot(C,red+4pt);

picture pic2;


