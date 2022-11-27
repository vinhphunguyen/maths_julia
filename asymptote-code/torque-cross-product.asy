import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(13cm, keepAspect=true);


picture pic1, pic2, pic3;

draw(pic1,Label("$x$",Relative(0.99)),(-1.25,0)--(1.25,0),Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1.25)--(0,1.25),Arrow(TeXHead));

draw(pic1,unitcircle,black+1.1pt);

real theta=26, beta=72;
pair A=dir(theta);
pair B=dir(beta);

draw(pic1,(0,0)--A,black+1.2pt);
draw(pic1,(0,0)--B,black+1.2pt);
draw(pic1,A--B,red+.9pt);
draw(pic1,A--(A.x,B.y),red+.9pt);
draw(pic1,B--(A.x,B.y),red+.9pt);

draw(pic1,"$\theta$",       arc((0,0),0.26,0,theta),PenMargins);
draw(pic1,"$\Delta \theta$",arc((0,0),0.3,theta,beta),PenMargins);
draw(pic1,"$\theta$",arc(A,0.3,90,90+degrees(atan( (A.x-B.x)/(B.y-A.y) ))),PenMargins);

label(pic1,"$P$",A+(0.1,0.1),blue);
label(pic1,"$Q$",B+(0.,0.1),blue);
label(pic1,"$H$",(A.x,B.y)+(0.,0.1),blue);
label(pic1,"$r$",(0.6,0.2),blue);
label(pic1,"$O$",(-0.1,-0.1),blue);

Label L1=Label(rotate(90)*"$y$",align=(0,0),MidPoint,Fill(white));
Label L11=Label(rotate(90)*"$\Delta y$",align=(0,0),MidPoint,Fill(white));
Label L2=Label("$x$",align=(0,0),MidPoint,Fill(white));
Label L21=Label("$\Delta x$",align=(0,0),MidPoint,Fill(white));

draw(pic1,L1,(-.15,0)--(-.15,A.y),Arrows(TeXHead),Bars);
draw(pic1,L21,(B.x,1.2)--(A.x,1.2),Arrows(TeXHead),Bars);


draw(pic1,L2,(0,-0.15)--(A.x,-.15),Arrows(TeXHead),Bars);
draw(pic1,L11,(1.2,A.y)--(1.2,B.y),Arrows(TeXHead),Bars);

draw(pic1,A--(0,A.y),dashed+blue+.8pt);
draw(pic1,A--(A.x,0),dashed+blue+.8pt);

perpendicular((A.x,B.y),NW,A--(A.x,B.y),blue);

string s="\begin{minipage}{3cm}
\begin{align*}
PQ &= r\Delta\theta\\
  \Delta x &= -r \Delta\theta \sin\theta=-y\Delta\theta \\
  \Delta y &=r\Delta\theta\cos\theta=x\Delta\theta
\end{align*}
\end{minipage}
";

string s1="\begin{minipage}{3cm}
\begin{align*}
  \Delta W &=F_x\Delta x + F_y\Delta y \\
           &={(xF_y-yF_x)}\Delta\theta
\end{align*}
\end{minipage}
";

label(pic1,s,(2.6,.7), black);
label(pic1,s1,(2.1,-0.4), black);

dot(pic1,A,blue+3pt);
dot(pic1,B,blue+3pt);


add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
