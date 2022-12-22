import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);

defaultpen(fontsize(12pt));

pen p =black+1pt;
pen pd =dashed+1pt;
pen p2 =black+1.3pt;

pair O=(0,0);
pair A=(0,3);
pair B=(4,2);
pair C=(2.4,0);

real xx=-0.5;

draw((A.x+xx,0)--(B.x+.5,0),p2);
draw(A--C--B,p);
draw(A--(A.x,0),pd);
draw(B--(B.x,0),pd);

label("$A$",A+.4E);
label("$B$",B+.4N);
label("$C$",C+.44N);


Label La=Label("$a$",align=O,MidPoint,Fill(white));
Label Lb=Label("$b$",align=O,MidPoint,Fill(white));
Label Lc=Label("$c$",align=O,MidPoint,Fill(white));
Label Lx=Label("$x$",align=O,MidPoint,Fill(white));
Label Lcx=Label("$c-x$",align=O,MidPoint,Fill(white));

real yy=A.y+0.5; real yy1=-0.5;
draw(La,(xx,0)--(xx,A.y),Arrows(TeXHead),Bars);
draw(Lb,(B.x-xx,0)--(B.x-xx,B.y),Arrows(TeXHead),Bars);
draw(Lc,(A.x,yy)--(B.x,yy),Arrows(TeXHead),Bars);
draw(Lx,(A.x,yy1)--(C.x,yy1),Arrows(TeXHead),Bars);
draw(Lcx,(C.x,yy1)--(B.x,yy1),Arrows(TeXHead),Bars);


string s="\begin{minipage}{3cm}
\begin{align*}
  AC &=\sqrt{a^2+x^2} \\
  BC &=\sqrt{b^2+(c-x)^2} \\
  f(x) &= \sqrt{a^2+x^2}  + \sqrt{b^2+(c-x)^2} \\
  f'(x_0) &= 0 \Rightarrow x_0 \Rightarrow C 
\end{align*}
\end{minipage}
";

label(s,(B.x+5.3,1.8), black);

dot(A,black+4pt);
dot(B,black+4pt);