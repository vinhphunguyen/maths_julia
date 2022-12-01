import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf


size(12cm, keepAspect=true);
defaultpen(fontsize(10pt));

pair Bezier(pair P[], real t)
{ // https://tex.stackexchange.com/a/554290/236162
  pair Bezi;
  for (int k=0; k <= P.length-1; ++k)
  {
    Bezi=Bezi+choose(P.length-1,k)*(1-t)^(P.length-1-k)*t^k*P[k];
  }
  return Bezi;
}


pair[] P={(1,0),(1,1),(0,0.6), (-1,1),(-1,0),(-1,-1),(0,-1),(1,-1),(1,0)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);

picture pic1, pic2, pic3, pic4;


draw(pic1,Label("$x$",Relative(0.99)),(0,0)--(2,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(0,2),black+.6pt,Arrow(TeXHead));


dot(pic1,(1,1),black+4pt);
dot(pic1,(1.6,1),black+6pt);
dot(pic1,(1.3,2),black+5pt);
dot(pic1,(0.2,1.5),black+7pt);
dot(pic1,(0.6,1.8),black+4.5pt);
dot(pic1,(0.3,1.),black+4.5pt);
dot(pic1,(1.1,0.6),black+4.5pt);

label(pic1,"$m_i$",(1,1)+0.15N);
label(pic1,"$\bm{x}_i$",(0.5,.55)+.15W);

pen p =black+.8pt;
draw(pic1,O--(1,1),p);


string s2="\begin{minipage}{3cm}
\begin{align*}
  x_\text{CM} &= \frac{\sum_i m_i x_i}{\sum_i m_i}\\
  y_\text{CM} &= \frac{\sum_i m_i y_i}{\sum_i m_i}\\
\end{align*}
\end{minipage}
";

label(pic1,s2,(-1.,1), red);
label(pic1,"$\textcircled{{a}}$ ",(-1.2,2));
label(pic2,"$\textcircled{\raisebox{-0.9pt}{b}}$ ",(-1.6,2-1));
label(pic3,"$\textcircled{{c}}$ ",(-1.2,2));

add(pic1);

fill(pic2, graph(F,0,1,350) .. cycle,mediumgray);
draw(pic2, graph(F,0,1,350),black+.6pt);

string s2="\begin{minipage}{3cm}
\begin{align*}
  \bm{x}_\text{CM} &= \frac{\int_V \rho \bm{x} dV }{\int_V \rho dV}
\end{align*}
\end{minipage}
";

label(pic2,s2,(-1.5,.15), red);
label(pic2,"$V,\rho$",(0.3,.06), black);


add(shift(4.3,1)*pic2);

fill(pic3,scale(0.5,1.5)*unitsquare,pink);
draw(pic3,scale(0.5,1.5)*unitsquare,p);

fill(pic3,shift(-.5,1.5)*scale(1.5,0.5)*unitsquare,lightgreen);
draw(pic3,shift(-.5,1.5)*scale(1.5,0.5)*unitsquare,p);

dot(pic3,(0.25,1.5/2),black+4pt);
dot(pic3,(0.25,1.5+0.5/2),black+4pt);
dot(pic3,(0.25,1.5/2+0.3),red+5pt);

string s2="\begin{minipage}{3cm}
\begin{align*}
  y_\text{CM} &= \frac{ m_1 y_1 + m_2 y_2 }{m_1+m_2}\\
              &= \frac{ A_1 y_1 + A_2 y_2 }{A_1+A_2}\\
\end{align*}
\end{minipage}
";

label(pic3,s2,(3.1,1.1), red);
label(pic3,"$(m_i=\rho A_i t)$",(2.8,0.3));

label(pic3,"$\textcircled{\raisebox{-0.9pt}{1}}$ ",(.8,1.5+0.25));
label(pic3,"$\textcircled{\raisebox{-0.9pt}{2}}$ ",(.3,0.25));

draw(pic3,(-2,0)--(2,0),gray+.5pt);

Label L1=Label("$y_1$",align=O,MidPoint,Fill(white));
Label L2=Label("$y_2$",align=O,MidPoint,Fill(white));
Label Lcm=Label("$y_\text{CM}$",align=O,MidPoint,Fill(white));

real xx= 1;
real xx1= xx+.5;
draw(pic3,L2,(xx,0)--(xx,1.5/2),Arrows(TeXHead),Bars);
draw(pic3,L1,(xx1,0)--(xx1,1.5+0.5/2),Arrows(TeXHead),Bars);
draw(pic3,Lcm,(-xx,0)--(-xx,1.5/2+.3),Arrows(TeXHead),Bars);

add(shift(0,-2.6)*pic3);
