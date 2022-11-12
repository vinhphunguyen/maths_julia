import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

size(13cm, 13cm, keepAspect=true);

defaultpen(fontsize(12pt));

real x(real t) {return cos(t);}
real y(real t) {return sin(t);}

real t1=0.4;
real t2=1.0;

pair O = (0,0);
pair P = (x(t1),y(t1));
pair Q = (x(t2),y(t2));


draw(graph(x,y,0,2),red+1.2pt);


draw(O--P,black+1.1pt);
draw(O--Q,black+1.1pt);
draw(P--(P.x,0),black+.9pt);

label("$P(x,y)$",P+(.3,-.1));
label("$P'(x',y')$",Q+(.1,.1));
label("$r$",(.26,.5));

draw("$\alpha$",arc(O,0.25,0,degrees(t1)),PenMargins);
draw("$\beta$",arc(O,0.4,degrees(t1),degrees(t2)),PenMargins);
draw("$\beta$",arc(O,1.4,degrees(t1),degrees(t2)),Arrow,PenMargins);

// maths

string s="\begin{minipage}{3cm}
\begin{empheq}[box=\widefbox]{align*}
  x' &=r\cos(\alpha+\beta) \\
  y' &=r\sin(\alpha+\beta)
\end{empheq}
\end{minipage}
";


string s1="\begin{minipage}{3cm}
\begin{align*}
  x' &=r\cos\alpha\cos\beta-r\sin\alpha\sin\beta \\
  &=x\cos\beta-y\sin\beta
\end{align*}
\end{minipage}
";
string s2="\begin{minipage}{3cm}
\begin{align*}
  y'&=r\sin\alpha \cos\beta+r\cos\alpha\sin\beta \\
  &=x\sin\beta+y\cos\beta
\end{align*}
\end{minipage}
";

//label(pic1,s,(2.6,1.8),red);
label(s,(1.9,1.2), red);
label(s1,(2.2,.8), red);
label(s2,(2.2,.4), red);

Label L2=Label("$x=r\cos\alpha$",MidPoint,Fill(white));
draw(L2,(0,-0.2)--(P.x,-0.2),Arrows(TeXHead),Bars);

// dots

dot(P,red+6pt);
dot(Q,blue+6pt);

//axes
draw(Label("$x$",Relative(0.99)),(-.5,0)--(1.5,0),black+1.2pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,-.3)--(0,1.5),black+1.2pt,Arrow(TeXHead));
