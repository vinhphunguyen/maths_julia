import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(12pt));

size(11cm, keepAspect=true);

picture pic1;

real alpha=pi/6, beta = pi/6;

pair O = (0,0);
pair A = (cos(alpha)*cos(beta),0);
pair B = (cos(alpha)*cos(beta),cos(beta)*sin(alpha));
pair C = dir(degrees(alpha+beta));
pair D = (A.x,C.y);
pair H = (C.x,0);

write(C);

fill(O--B--C--cycle,lightcyan);

draw(O--A,black+1.0pt);
draw(O--C,black+1.0pt);
draw(O--B,black+1.0pt);
draw(A--D,black+1.0pt);
draw(C--D,black+1.0pt);
draw(C--B,black+1.0pt);
draw(C--H,gray+1.0pt);

label("$O$",O+(-0.06,-0.02));
label("$A$",A+(.06,0));
label("$B$",B+(.06,0));
label("$C$",C+(.0,0.06));
label("$D$",D+(.06,0));
label("$H$",H+(.0,-0.06));

perpendicular(H,NE,O--A,blue);
perpendicular(B,NE,B--C,blue);
perpendicular(D,SE,D--B,blue);
perpendicular(A,NW,A--(2,0),blue);

draw(Label("$\alpha$",MidPoint,Fill(white)),arc((0,0),0.26,0,degrees(alpha)),black+1.pt);
draw(Label("$\beta$",MidPoint ),arc((0,0),0.2,degrees(alpha),degrees(alpha+beta)),black+1.pt);
draw(Label("$\alpha$",MidPoint,Fill(white)),arc(B,0.2,90,90+degrees(alpha)),black+1.pt);

//label(pic1,"$x+2y=2$",(1.2,1));

Label L1=Label("$1$",align=(0.,.0),MidPoint);
Label L2=Label("$\cos\beta$",align=(0.,.0),MidPoint);
Label L3=Label("$\sin\beta$",align=(0.,.0),MidPoint);
label(rotate(degrees( alpha+beta ))*L1, (0.2,B.y));
label(rotate(degrees( alpha ))*L2, (0.4,.3));
label(rotate( degrees(alpha)-90)*L3, (0.58,.6));

string s="\begin{minipage}{3cm}
\begin{align*}
\sin(\alpha+\beta) &= CH = AD\\
AB &= \sin\alpha\cos\beta\\
BD &=\cos\alpha\sin\beta
\end{align*}
\end{minipage}
";

label(s,(1.4,.8), red);

string s="\begin{minipage}{3cm}
\begin{align*}
\cos(\alpha+\beta) &= OH = OA-HA\\
OA &= \cos\alpha\cos\beta\\
HA &=CD=\sin\alpha\sin\beta
\end{align*}
\end{minipage}
";

label(s,(1.4,.3), blue);
//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
