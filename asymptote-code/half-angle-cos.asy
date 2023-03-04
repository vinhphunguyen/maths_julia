import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic2;

// pic 2
draw(pic2,unitcircle,black+1.pt);

real yC=sqrt(1-0.5^2);
real theta=degrees(atan(yC/1.5));
real beta=90-degrees(atan(yC/1.5));

pair A=dir(theta);
pair C=(0.5,yC);

draw(pic2,(-1,0)--(1,0),black+1.pt);
draw(pic2,(-1,0)--C,black+1.pt);
draw(pic2,(1,0)--C,black+1.pt);
draw(pic2,(C.x,0)--C,black+1.pt);
draw(pic2,(0,0)--C,black+1.pt);

draw(pic2,"$\theta$",arc((-1,0),0.26,0,theta),red+1.pt);
draw(pic2,"$2\theta$",arc((0,0),0.22,0,2*theta),red+1.pt);
draw(pic2,"$\beta$",arc((1,0),0.22,180-beta,180),blue+1.pt);

label(pic2,"$\displaystyle\frac{1}{2}$",(0.,0.5),blue);
label(pic2,"$O$",(0.,-0.1),blue);
label(pic2,"$A$",(-.9,-0.1),blue);
label(pic2,"$B$",(1.1,-0.1),blue);
label(pic2,"$C$",C+(.06,.1),blue);
label(pic2,"$H$",(C.x,-0.1),blue);

perpendicular(C,NE,C--(-1,0),blue);
perpendicular((C.x,0),NE,blue);

Label L2=Label("$\displaystyle\frac{1}{2}$",align=(0,0),MidPoint,Fill(white));
draw(L2,(-1,-0.3)--(0,-0.3),black+1pt,Arrows(TeXHead),Bars);

string s="\begin{minipage}{3cm}
\begin{align*}
  OH &= \frac{1}{2}\cos 2\theta\\
  AH &= AC\cos\theta=\sin\beta\cos\theta=\cos^2\theta\\
  \cos^2\theta&=OA+OH\\
  &= \frac{1}{2} + \frac{1}{2}\cos 2\theta
\end{align*}
\end{minipage}
";

//label(pic2,s,(3.5,.3), red);

dot(pic2,(0,0),blue+3pt);

add(pic2);
