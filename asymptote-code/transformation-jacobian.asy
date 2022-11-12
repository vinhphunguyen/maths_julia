import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(16pt));

size(22cm, 22cm, keepAspect=true);

picture pic1, pic2;

fill(pic1,(0,-1)--(2,0)--(0,1)--(-2,0)--cycle,orange);

draw(pic1,Label("$x$",Relative(0.99)),(-2.5,0)--(2.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-2.5)--(0,2.5),black+1.2pt,Arrow(TeXHead));

//label(pic1,"$x+2y=2$",(1.2,1));

Label L1=Label("$x+2y=2$",align=(-0.,.8),MidPoint);
Label L2=Label("$-x+2y=2$",align=(-0.3,0.8),MidPoint);
Label L3=Label("$-x-2y=2$",align=(-.3,-0.8),MidPoint);
Label L4=Label("$x-2y=2$",align=(-0,-.8),MidPoint);
draw(pic1,rotate(-degrees(atan2(1,2)))*L1, (2,0)--(0,1),black+2pt);
draw(pic1,rotate(degrees(atan2(1,2)))*L2, (0,1)--(-2,0),black+2pt);
draw(pic1,rotate(-degrees(atan2(1,2)))*L3, (-2,0)--(0,-1),black+2pt);
draw(pic1,rotate(degrees(atan2(1,2)))*L4, (0,-1)--(2,0),black+2pt);


label(pic1,"$R$",(-1,0.2));

string s="\begin{minipage}{3cm}
\begin{empheq}[box=\widefbox]{align*}
  u &=x+2y \\
  v &= x-2y
\end{empheq}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(pic1,s,(2.6,1.8), red);

//label(pic1,"$v=x-2y$",(2.6,1.4),red);

draw(pic1,(1.5,2.5) .. (3,3.2) .. (3.6,2.5),red+2pt,Arrow);



// pic 2

fill(pic2,(-2,-2)--(2,-2)--(2,2)--(-2,2)--cycle,orange);
draw(pic2,(-2,-2)--(2,-2)--(2,2)--(-2,2)--cycle,black+2pt);

draw(pic2,Label("$u$",Relative(0.99)),(-2.5,0)--(2.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$v$",Relative(0.99)),(0,2.5)--(0,-2.5),black+1.2pt,Arrow(TeXHead));

label(pic2,"$R'$",(-1,1.2));
label(pic2,"$2$",(2.1,-0.2));
label(pic2,"$-2$",(-2.2,-0.2));
label(pic2,"$2$",(0.2,-2.3));
label(pic2,"$-2$",(0.2,2.3));

label(pic1,"area=4",(-1,-1.6),blue);
label(pic1,"area=16",(5.2,-1.6));

string s="\begin{minipage}{3cm}
\begin{empheq}[box=\widefbox]{align*}
  x &= \frac{u+v}{2} \\
  y &= \frac{u-v}{4}
\end{empheq}
\end{minipage}
";

label(pic1,s,(2.6,-1.6), red);

add(shift(6,0)*pic2);

add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
