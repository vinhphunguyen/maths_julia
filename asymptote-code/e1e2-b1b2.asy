import graph;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");
usepackage("color");

//texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(11cm, keepAspect=true);
defaultpen(fontsize(16pt));

//add(shift(-3,-3)*grid(6,6,gray+0.6pt));

picture pic1, pic2;

draw(pic1,Label("$x$",Relative(0.99)),(-.5,0)--(2.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.5)--(0,3.5),black+1.2pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(2,3);

pen p = gray+.8pt;
draw(pic1,A--(A.x,0),p);
draw(pic1,A--(0,A.y),p);

draw(pic1,O--A,blue+1.2pt,ArcArrow(4pt));
draw(pic1,O--(1,0),red+1.2pt,ArcArrow(4pt));
draw(pic1,O--(0,1),red+1.2pt,ArcArrow(4pt));



label(pic1,"$\boldsymbol{e}_1$",(.5,-0.3),black);
label(pic1,"$\boldsymbol{e}_2$",(-0.3,0.5),black);
label(pic1,"$\boldsymbol{b}$",(1,1.1),black);
label(pic1,"$2$",(1,3.2),black);
label(pic1,"$3$",(2.2,1.5),black);
label(pic1,"$O$",(-.3,-.3),black);

add(pic1);

// pic2

draw(pic2,Label("$x$",Relative(0.99)),(-.5,0)--(2.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,0)--4.7dir(45),black+1.2pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(2,3);
pair B=(1,1);
pair C=(1,3);

draw(pic2,O--A,blue+1.2pt,ArcArrow(4pt));
draw(pic2,O--(1,0),red+1.2pt,ArcArrow(4pt));
draw(pic2,O--B,red+1.2pt,ArcArrow(4pt));
//draw(pic2,O--(-1,0),black+1.2pt,ArcArrow(4pt));
//draw(pic2,(-1,0)--C,black+1.2pt,ArcArrow(4pt));

pen p = gray+.8pt;
//draw(pic2,A--(0,A.y),p);

label(pic2,"$\boldsymbol{a}_1$",(.5,-0.3),black);
label(pic2,"$\boldsymbol{a}_2$",(1.45,1.),black);
label(pic2,"$\boldsymbol{b}$",(.8,1.7),black);
label(pic2,"$O$",(-.3,-.3),black);

string s="\begin{minipage}{3cm}
\begin{align*}
\boldsymbol{b}=\begin{bmatrix}
? \\ ?
\end{bmatrix}
\end{align*}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(pic2,s,(2.8,1.8), red);

add(shift(4,0)*pic2);