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

add(shift(-1,-1)*grid(19,10,gray+0.2pt));

picture pic1, pic2;

draw(pic1,Label("$x$",Relative(0.99)),(-.5,0)--(8,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.5)--(0,8),black+1.2pt,Arrow(TeXHead));


draw((3,0)--(3,6));
draw((0,6)--(3,6));

draw((0,0)--(3,6),red+2pt,Arrow);


string s="\begin{minipage}{3cm}
\begin{align*}
  \bm{a}&=\begin{bmatrix} 3 \\ 6 \end{bmatrix}
\end{align*}
\end{minipage}
";

//label(pic1,s,(2.6,1.8),red);
label(pic1,s,(4.5,2.8), red);

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabel = Label("$3$", position=EndPoint);
Label ticklabel2 = Label("$6$", position=EndPoint);

draw((3,0), xtick, L=ticklabel, black+.9pt);
draw((0,6), ytick, L=ticklabel2, black+.9pt);

label(pic1,"$\red{\bm{a}}$",(1.5,3.8));

add(pic1);

// pic2

draw(pic2,Label("$x$",Relative(0.99)),(-.5,0)--(8,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.5)--(0,8),black+1.2pt,Arrow(TeXHead));


draw(pic2,(3,0)--(3,6));
draw(pic2,(0,6)--(3,6));

draw(pic2,(0,0)--(3,6),red+2pt,Arrow);
draw(pic2,(0,0)--(1,0),red+2pt,Arrow);
draw(pic2,(0,0)--(0,1),blue+2pt,Arrow);

string s="\begin{minipage}{3cm}
\begin{align*}
  \bm{a}&=3 \begin{bmatrix} 1 \\ 0 \end{bmatrix} +
  6 \begin{bmatrix} 0 \\ 1 \end{bmatrix}\\
  &= 3\bm{i}+6\bm{j}
\end{align*}
\end{minipage}
";

//label(pic1,s,(2.6,1.8),red);
label(pic2,s,(5.5,2.8), red);
label(pic2,"$\red{\bm{i}}$",(0.5,-.6));
label(pic2,"$\blue{\bm{j}}$",(-.6,0.5));

path tick = (0,0) -- (0,-0.15cm);
Label ticklabel = Label("$3$", position=EndPoint);
draw((3,0), tick, L=ticklabel);

add(shift(9,0)*pic2);
