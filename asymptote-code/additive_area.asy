import graph;
import geometry;
import patterns;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");

//texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(10pt));

size(7.9cm, keepAspect=true);


draw(Label("$x$",Relative(0.99)),(0,0)--(7,0),black+1.5pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,0)--(0,6),black+1.5pt,Arrow(TeXHead));

Label Lu=Label("$\boldsymbol{u}$",align=(0,0),MidPoint,Fill(white));
Label Lv=Label("$\boldsymbol{v}$",align=(0,0),MidPoint,Fill(white));
Label Lw=Label("$\boldsymbol{w}$",align=(0,0),MidPoint,Fill(white));
Label Lz=Label("$\boldsymbol{z}$",align=(0,0),MidPoint,Fill(white));

pair O=(0,0);
pair u=(4,0);
pair v=(2,2);
pair w=(1,3);
pair z=v+w;

add("bengal", hatch(2mm, blue));

fill(O--u--u+v--v--cycle,mediumgray);
fill(O--u--u+z--z--cycle,pattern("bengal"));


draw(O--u--u+v--v--cycle,blue+1.1pt);
draw(u--u+z--z,blue+.8pt);
draw(v--z--w,blue+.8pt);

draw(Lu,O--u,red+1.pt,ArcArrow(3pt));
draw(Lv,O--v,red+1.pt,ArcArrow(3pt));
draw(Lw,O--w,red+1.pt,ArcArrow(3pt));
draw(Lz,O--z,red+1.pt,ArcArrow(3pt));

Label L2=Label("$z_2=v_2+w_2$",align=O,MidPoint,Fill(white));
draw(L2,(8,0)--(8,z.y),Arrows(TeXHead),Bars);

string s="\begin{minipage}{3cm}
\begin{align*}
  \det[\boldsymbol{u}\; \boldsymbol{z}] &=u_1z_2 = u_1v_2 + u_1w_2
\end{align*}
\end{minipage}
";

label(s,(3.8,5.8), red);

string s="\begin{minipage}{3cm}
\begin{align*}
  \det[\boldsymbol{u}\; \boldsymbol{v}] &=u_1v_2
\end{align*}
\end{minipage}
";
label(s,(6.3,0.8), red);

draw((5.8,0.8)--(5.,1.3),black+.8pt,ArcArrow);
draw((3.8,5.3)--(3.8,4.0),black+.8pt,ArcArrow);
