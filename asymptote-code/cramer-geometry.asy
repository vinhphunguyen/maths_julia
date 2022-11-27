import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(14cm, keepAspect=true);
defaultpen(fontsize(14pt));

//add(shift(-1,-1)*grid(19,10,gray+0.2pt));

picture pic1, pic2;

pair O = (0,0);
pair A = (1,0);
pair B = (2,3);
pair C = (3,3);

draw(pic1,Label("$x$",Relative(0.99)),(-.3,0)--(4,0),black+1pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.3)--(0,4),black+1pt,Arrow(TeXHead));

fill(O--A--C--B--cycle,lightcyan);

draw(O--A,blue+1.5pt,ArcArrow);
draw(O--B,blue+1.5pt,ArcArrow);
draw(A--C,gray+1.5pt);
draw(B--C,gray+1.5pt);


path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabel1 = Label("$1$", position=EndPoint);
Label ticklabel2 = Label("$2$", position=EndPoint);
Label ticklabel3 = Label("$3$", position=EndPoint);

draw((1,0), xtick, L=ticklabel1, black+.9pt);

label(pic1,"$\bm{e}_1$",(0.5,-0.2));
label(pic1,"$\bm{x}$",(.8,1.8));

label(pic1,"area = $y$",(1.2,3.2));
label(pic1,"before transformation",(1.6,-0.65));

draw(pic1,(1.2,2.7) .. (1.2,2.5) .. (2.,2.),gray+1.2pt,ArcArrow);

Label L=Label("$y$",align=O,MidPoint,Fill(white));
draw(pic1,L,(C.x+.3,0)--(C.x+.3,C.y),Arrows(TeXHead),Bars);

add(pic1);

// pic2

pair O = (0,0);
pair A = (2,1);
pair B = (1,3);
pair C = A + B;


draw(pic2,Label("$x$",Relative(0.99)),(-.3,0)--(4,0),black+1pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.3)--(0,4),black+1pt,Arrow(TeXHead));

fill(pic2,O--A--C--B--cycle,lightcyan);

draw(pic2,O--A,blue+1.5pt,ArcArrow);
draw(pic2,O--B,blue+1.5pt,ArcArrow);
draw(pic2,A--C,gray+1.5pt);
draw(pic2,B--C,gray+1.5pt);


path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabel1 = Label("$1$", position=EndPoint);
Label ticklabel2 = Label("$2$", position=EndPoint);
Label ticklabel3 = Label("$3$", position=EndPoint);

draw((1,0), xtick, L=ticklabel1, black+.9pt);

label(pic2,"$\bm{a}_1$",(1.,0.2));
label(pic2,"$\bm{b}$",(1.,1.8));

label(pic2,"after transformation",(1.6,-0.65));

string s="\begin{minipage}{3cm}
\begin{align*}
  \text{area} &= \begin{vmatrix}
a_{11} & b_{1} \\
a_{21} & b_{2} \\
\end{vmatrix}\\
&= y\det(\vm{A})
\end{align*}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(pic2,s,(3.8,1.8), red);

add(shift(5,0)*pic2);
