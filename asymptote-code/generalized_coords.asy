import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(15cm, keepAspect=true);
defaultpen(fontsize(21pt));

//add(shift(0,0)*grid(5,6,gray+0.2pt));

picture pic1, pic2;


pair O=(0,0);
pair A=(1,-1);
pair B=(1.8,-2.2);

real a=-0.35, b=0.35;
draw((a,0)--(b,0));

path p=O--.1dir(45);
draw(p);
draw(shift(.2,0)*p);
draw(shift(-.2,0)*p);
draw(shift(.4,0)*p);
draw(shift(-.4,0)*p);

real y=-1.;
draw(O--A--B,black+2pt);
draw(A--(A.x,A.y+y),dashed+gray+2pt);
draw(O--(0,y),dashed+gray+2pt);

real yy = abs((B-A).y / (B-A).x);
real theta1 = -degrees(atan(1));
real theta2 = -(degrees(atan(yy)));

string s1="$\theta_1$";
string s2="$\theta_2$";


object box1=draw(s1,box,(0.2,-.55),xmargin=.1mm,Fill(cyan));
object box2=draw(s2,box,A+(0.15,-0.55),xmargin=.1mm,Fill(cyan));

draw(arc(O,0.5,theta1,-90),PenMargins);
draw(arc(A,0.5,theta2,-90),PenMargins);


label("$l_1$",0.5A+(0.2,0));
label("$l_2$",.5(A+B)+(0.2,0));

label("$m_1(x_1,y_1)$",A+(0.4,0));
label("$m_2(x_2,y_2)$",B+(-0.4,0));

string s="\begin{minipage}{3cm}
\begin{align*}
x_1^2 + y_1^2 = l_1^2 \\
x_2^2 + y_2^2 = l_2^2 \\
\end{align*}
\end{minipage}
";
label(s,(.3,-1.5), red);

dot(A,black+12pt);
dot(B,black+12pt);

add(pic1);
