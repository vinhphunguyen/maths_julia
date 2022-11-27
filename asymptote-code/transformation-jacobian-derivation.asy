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

pair A = (0,0);
pair B = (3,0);
pair C = (3,3);
pair D = (0,3);

fill(pic1,A--B--C--D--cycle,lightcyan);

draw(pic1,B--C);
draw(pic1,C--D);

draw(pic1,A--B,blue+1.5pt,ArcArrow);
draw(pic1,A--D,red+1.5pt, ArcArrow);

label(pic1,"$(u_0,v_0)$",(-0.1,-0.35));
label(pic1,"$(u_0+du,v_0)$",B+(0.,-0.35));
label(pic1,"$(u_0,v_0+dv)$",D+(0,0.35));


string s="\begin{minipage}{3cm}
\begin{empheq}[box=\widefbox]{align*}
  x &= f(u,v) \\
  y &= g(u,v)
\end{empheq}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(pic1,s,(4,4.2));

//label(pic1,"$v=x-2y$",(2.6,1.4),red);

draw(pic1,(3.5,1.5) .. (5,1.5),red+2pt,ArcArrow);

add(pic1);

// pic2

pair A = (0,0);
pair B = (3,1);
pair D = (1,3);
pair C = B+D;


fill(pic2,A--B--C--D--cycle,lightcyan);

draw(pic2,A--B,blue+1.5pt,ArcArrow);
draw(pic2,A--D,red+1.5pt, ArcArrow);

draw(pic2,B--C);
draw(pic2,C--D);

draw(pic2,B--(B.x,0), dashed+gray+1pt);
draw(pic2,A--(B.x,0), dashed+gray+1pt);
draw(pic2,A--(0,D.y), dashed+gray+1pt);
draw(pic2,D--(0,D.y), dashed+gray+1pt);


label(pic2,"$(x_0,y_0)$",(-0.1,-0.3));

Label L2=Label("$f_udu$",align=A,MidPoint,Fill(white));
Label L1=Label("$g_vdv$",align=A,MidPoint,Fill(white));

draw(pic2,L2,(0,-0.68)--(B.x,-0.68),Arrows(TeXHead),Bars);
draw(pic2,rotate(90)*L1,(-0.68,0)--(-0.68,D.y),Arrows(TeXHead),Bars);

draw(pic2,(B.x+.3,0)--(B.x+.3,B.y),Arrows(TeXHead),Bars);
draw(pic2,(0,D.y+.3)--(D.x,D.y+.3),Arrows(TeXHead),Bars);

label(pic2,"$g_u du$",(B.x+.78,.5));
label(pic2,"$f_v dv$",(0.5,D.y+.6));



add(shift(6.,0)*pic2);
