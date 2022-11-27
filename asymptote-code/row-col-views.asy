import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(18cm, keepAspect=true);
defaultpen(fontsize(16pt));

add(shift(-1,-1)*grid(11,6,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$x$",Relative(0.99)),(-1,0)--(5,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1)--(0,5),black+1.2pt,Arrow(TeXHead));


real f1(real x){return 2x-1;}
real f2(real x){return -x+5;}

draw(pic1, graph(f1,0,2.5), red+1.2pt);
draw(pic1, graph(f2,1,4.5), blue+1.2pt);

Label l1 = Label("$2x-y=1$");
Label l2 = Label("$x+y=5$");

draw(pic1,rotate(degrees(atan(2)))*l1,(1.1,2),red);
draw(pic1,rotate(degrees(atan(-1)))*l2,(3.3,2.2),blue);

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabel1 = Label("$1$", position=EndPoint);
Label ticklabel2 = Label("$2$", position=EndPoint);
Label ticklabel3 = Label("$3$", position=EndPoint);

draw((1,0), xtick, L=ticklabel1, black+.9pt);
draw((2,0), xtick, L=ticklabel2, black+.9pt);
draw((3,0), xtick, L=ticklabel3, black+.9pt);
draw((0,1), ytick, L=ticklabel1, black+.9pt);
draw((0,2), ytick, L=ticklabel2, black+.9pt);
draw((0,3), ytick, L=ticklabel3, black+.9pt);


dot(pic1,(2,3),red+6pt);

draw(pic1,Label("solution",align=E, position=BeginPoint),(2,1)--(2,2.8),Arrow);  

add(pic1);

// pic2

draw(pic2,Label("$x$",Relative(0.99)),(-.5,0)--(4,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-1)--(0,5),black+1.2pt,Arrow(TeXHead));


draw(pic2,(0,0)--(2,1),red+1.2pt,ArcArrow);
draw(pic2,(0,0)--(4,2),red+1.2pt,ArcArrow);
draw(pic2,(0,0)--(-1,1),blue+1.2pt,ArcArrow);
draw(pic2,(4,2)--(1,5),blue+1.2pt,ArcArrow);
draw(pic2,(0,0)--(1,5),black+1.2pt,ArcArrow);

string s="\begin{minipage}{3cm}
\begin{align*}
   \begin{bmatrix} 2 \\ 1 \end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic2,s,(1.2,1.4), red);

string s="\begin{minipage}{3cm}
\begin{align*}
   \begin{bmatrix} -1 \\ +1 \end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic2,s,(-0.5,1.7), blue);

string s="\begin{minipage}{3cm}
\begin{align*}
   \begin{bmatrix} 1 \\ 5 \end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic2,s,(1.2,3), black);

string s="\begin{minipage}{3cm}
\begin{align*}
   2\begin{bmatrix} 2 \\ 1 \end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic2,s,(3,1), red);

string s="\begin{minipage}{3cm}
\begin{align*}
   3\begin{bmatrix} -1 \\ +1 \end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic2,s,(3.5,3.6), blue);

path tick = (0,0) -- (0,-0.15cm);
Label ticklabel = Label("$3$", position=EndPoint);
draw((3,0), tick, L=ticklabel);

add(shift(6,0)*pic2);
