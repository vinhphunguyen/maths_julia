import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(13cm, keepAspect=true);
defaultpen(fontsize(12pt));

//add(shift(-3,-3)*grid(6,6,gray+0.6pt));

picture pic1, pic2;

draw(pic1,Label("$x$",Relative(1.1)),(-.5,1)--(5,1),black+1.2pt,Arrow(TeXHead));
draw(pic1,(0,1)--(0,5.7),black+1.pt);

pair O=(0,0);

pen p = black+1.1pt;
path rec=scale(2,0.5)*unitsquare;

real l = 2;
real w = 0.5;

fill(pic1,shift(0,5)*rec,mediumgray);
draw(pic1,shift(0,5)*rec,p);
label(pic1,"$\textcircled{\raisebox{-0.9pt}{1}}$",(1.7,5.2));
fill(pic1,shift(0.5l,4.5)*rec,mediumgray);
draw(pic1,shift(0.5l,4.5)*rec,p);
label(pic1,"$\textcircled{\raisebox{-0.9pt}{2}}$",(1.7+1,5.2-0.5));

pair cm1=(0.5l,5+0.5w);
pair cm2=(0.5l+0.5l,5-0.5w);
pair cm12=0.5(cm1+cm2);
pair cm3=((3/4+1/2)*l,2+0.25);
pair cm12p=(cm12.x,3);
pair cm123=(2/3)*cm12p+(1/3)*cm3;

draw(pic1,(0.5l,5+0.5w)--(0.5l+0.5l,5-0.5w),gray+1pt);


draw(pic1,(cm12.x,3)--cm3);


string s="\begin{minipage}{3cm}
\begin{align*}
  x_{12} &= \frac{m_1x_1+m_2x_2}{m_1+m_2}= \frac{x_1+x_2}{2}=\frac{3}{4}
\end{align*}
\end{minipage}
";


label(pic1,s,(4.6,5.3), red);
label(pic1,"$x_{12}$",cm12+.16S, black);
label(pic1,"$x_{123}$",cm123+.16S, black);


string s2="\begin{minipage}{3cm}
\begin{align*}
  x_{123} &= \frac{2mx_{12}+m x_3}{3m}= \frac{11}{12}
\end{align*}
\end{minipage}
";

label(pic1,s2,(4.6,3), red);

Label L1=Label("$1$",align=O,MidPoint,Fill(white));
Label L12=Label("$1/2$",align=O,MidPoint,Fill(white));
Label L34=Label("$3/4$",align=O,MidPoint,Fill(white));
Label L1112=Label("$11/12$",align=O,MidPoint,Fill(white));
draw(pic1,L1,(0,5.7)--(l,5.7),Arrows(TeXHead),Bars);
draw(pic1,L12,(0,4.7)--(.5l,4.7),Arrows(TeXHead),Bars);
draw(pic1,L34,(0,4.)--(cm12.x,4.),Arrows(TeXHead),Bars);
draw(pic1,L1112,(0,1.25)--(cm123.x,1.25),Arrows(TeXHead),Bars);

fill(pic1,shift(0,3)*rec,mediumgray);
draw(pic1,shift(0,3)*rec,p);
label(pic1,"$\textcircled{\raisebox{-0.9pt}{1}}$",(1.7,3.2));
fill(pic1,shift(0.5l,2.5)*rec,mediumgray);
draw(pic1,shift(0.5l,2.5)*rec,p);
label(pic1,"$\textcircled{\raisebox{-0.9pt}{2}}$",(1.7+1,3.2-0.5));
fill(pic1,shift((0.5+0.25)*l,2.)*rec,mediumgray);
draw(pic1,shift((0.5+0.25)*l,2.)*rec,p);
label(pic1,"$\textcircled{\raisebox{-0.9pt}{3}}$",(1.7+1.25,2.2));
fill(pic1,shift((0.5+0.25+1/6)*l,1.5)*rec,mediumgray);
draw(pic1,shift((0.5+0.25+1/6)*l,1.5)*rec,p);
label(pic1,"$\textcircled{\raisebox{-0.9pt}{4}}$",(1.7+1.5,1.75));

draw(pic1,cm12p--cm3,gray+1pt);

label(pic1,"$1/2$",(0.5,2.8),red);
label(pic1,"$1/4$",(cm12p.x-0.2,2.3),red);
label(pic1,"$1/6$",(cm123.x-0.2,2.3-0.5),red);

label(pic1,"$0$",(-0.12,1.2));

dot(pic1,cm1,black+4pt);
dot(pic1,cm2,black+4pt);
dot(pic1,cm12,blue+4pt);

dot(pic1,cm3,black+4pt);
dot(pic1,cm123,red+4pt);
dot(pic1,cm12p,blue+4pt);


add(pic1);
