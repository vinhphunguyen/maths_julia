
import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, 12cm, keepAspect=true);

pair A=(0,0);
pair B=(4,0);
pair C=(4,3);

draw(A--B--C--cycle,black+1pt);

label("Observer",A+.5N);
label("$A$",A+.3S);
label("Balloon",B+.7E);
label("Balloon",C+.7E);


string s="\begin{minipage}{3cm}
\begin{align*}
\frac{dy}{dt}&=3\;\text{m/s}\\
\frac{dz}{dt}(y=50\;\text{m})&=?\;\text{m/s}
\end{align*}
\end{minipage}
";

label(s,(C.x+3,0.5C.y));

label("$100\;\text{meters}$",0.5B +.3S );
label("$y(t)$",(B.x+.5,0.5C.y));
label("$z(t)$",(.5B.x-0.1,0.5C.y+0.3));

draw((B.x+.3,0.3)--(B.x+.3,0.7),ArcArrow);

dot(A,black+4pt);
dot(B,black+6pt);
dot(C,black+6pt);




