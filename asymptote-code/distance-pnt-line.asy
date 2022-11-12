import graph;
import geometry;
import patterns;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(14pt));

size(12cm, keepAspect=true);


real a = -4, b = -4, c = -10;
real x = 2.5;

real slope=atan(a/b);

real f(real x){return x;}

draw(graph(f,-0,5.9),linewidth(1));

pair O=(0,0);
pair Q=(3,6);
pair P=(x,f(x));
pair n=(a,b);


draw(Label("$\bm{n}$",EndPoint),P--P+3.1dir(90+degrees(slope)),red+1pt,ArcArrow);

label("$Q(x_0,y_0)$",Q+(.2,.4),red);
label("$P(\bar{x},\bar{y})$",P+(.5,-.6),red);

label("$\text{line}:\boxed{ax+by=c}$",(4.2,1.),red);
label("$d$",(4.2,5.5),red);

pair a=extension(P,P+3.1dir(90+degrees(slope)),Q,Q+3.1dir(-90-degrees(slope)));
pair b=extension(P,P+3.1dir(degrees(slope)),Q,Q+3.1dir(-degrees(slope)));

draw(P--Q,blue+1.2pt,Arrow);
draw(a--Q);
draw(b--Q);

perpendicular(a,NE,a--Q,blue);
perpendicular(b,NE,b--Q,blue);

string s="\begin{minipage}{3cm}
\begin{align*}
  d &=\norm{\text{proj of $PQ$ on $\bm{n}$}}\\
    &= \frac{|\bm{n}\cdot PQ|}{\norm{\bm{n}}}\\
    &= \frac{|(a,b)\cdot(x_0-\bar{x},y_0-\bar{y})|}{\sqrt{a^2+b^2}}\\
    &= \frac{|ax_0+bx_0-c|}{\sqrt{a^2+b^2}}\\
\end{align*}
\end{minipage}
";


label(s,(10,3), black);

// dots


dot(P,black+5pt); // plot a dot at (0,0)
dot(Q,black+5pt); // plot a dot at (0,0)



//axes

draw(Label("$x$",Relative(0.99)),(0,0)--(7,0),black+1.5pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,0)--(0,7),black+1.5pt,Arrow(TeXHead));
