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

picture pic1, pic2, pic3, pic4;

pair A = (0,0);
pair B = (4,1);
pair C = (2,4);
pair CM = .3(A+B+C);

fill(pic1,A--B--C--cycle,mediumgray);
draw(pic1,A--B--C--cycle,black+1.pt);

label(pic1,"$P(\xi_1,\xi_2,\xi_3)$", CM+(0,-0.5));

string sA="$A(1,0,0)$";
string sB="$B(0,1,0)$";
string sC="$C(0,0,1)$";


object box1=draw(pic1,sA,box,(0.2,-.55),xmargin=.1mm,Fill(cyan));
object box1=draw(pic1,sB,box,B+(0.2,-.55),xmargin=.1mm,Fill(cyan));
object box1=draw(pic1,sC,box,C+(0.2,.4),xmargin=.1mm,Fill(cyan));

dot(pic1,A,black+5pt);
dot(pic1,B,black+5pt);
dot(pic1,C,black+5pt);
dot(pic1,CM,black+5pt);

add(pic1);

// pic2


fill(pic2,A--B--C--cycle,mediumgray);
draw(pic2,A--B--C--cycle,black+1.pt);

label(pic2,"$P(\xi_1,\xi_2,\xi_3)$", CM+(0,-0.5));
label(pic4,"$P$", CM+(0,-0.4));

string sA="$A$";
string sB="$B$";
string sC="$C$";


label(pic2,sA,(0.2,-.55));
label(pic2,sB,B+(0.2,-.55));
label(pic2,sC,C+(0.2,.4));

dot(pic2,A,black+5pt);
dot(pic2,B,black+5pt);
dot(pic2,C,black+5pt);
dot(pic2,CM,black+5pt);

label(pic2,"$\boxed{\xi_1=0}$",(4,3)); 
label(pic2,"$\boxed{\xi_2=0}$",(.3,3)); 
label(pic2,"$\boxed{\xi_3=0}$",(2,-0.1)); 

add(shift(6.,0)*pic2);

// pic3

fill(pic3,A--B--C--cycle,mediumgray);
draw(pic3,A--B--C--cycle,black+1.pt);

pair p1 = (1/3)*(2C+A);
pair p2 = (1/3)*(2B+A);

draw(pic3,p1--p2,black+1pt);

real alpha=-degrees(atan2(p1.y-p2.y,p2.x-p1.x));
Label s1=Label("$\xi_1=1/3$");
label(pic3,rotate(alpha)*s1,(2.2,2));

pair p1 = (1/3)*(2A+C);
pair p2 = (1/3)*(2A+B);

draw(pic3,p1--p2,black+1pt);


label(pic3,sA,(0.2,-.55));
label(pic3,sB,B+(0.2,-.55));
label(pic3,sC,C+(0.2,.4));

label(pic3,"$\boxed{\xi_1=0}$",(4,3)); 

dot(pic3,A,black+5pt);
dot(pic3,B,black+5pt);
dot(pic3,C,black+5pt);


add(shift(0.,-5)*pic3);


// pic4 


fill(pic4,A--B--CM--cycle,mediumgray);
fill(pic4,A--CM--C--cycle,mediumcyan);
fill(pic4,B--C--CM--cycle,mediumyellow);
draw(pic4,A--B--C--cycle,black+1.pt);
draw(pic4,CM--B,black+1.pt);
draw(pic4,CM--A,black+1.pt);
draw(pic4,CM--C,black+1.pt);


label(pic4,sA,(0.2,-.55));
label(pic4,sB,B+(0.2,-.55));
label(pic4,sC,C+(0.2,.4));

string s="\begin{minipage}{3cm}
\begin{align*}
 \xi_1 = \displaystyle \frac{\text{area $PBC$}}{ \text{area $ABC$} }
\end{align*}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(pic4,s,(5,2.8), red);

string s="\begin{minipage}{3cm}
\begin{align*}
 P(\xi_1,\xi_2,\xi_3)
\end{align*}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(pic4,s,(4.6,4.), red);

dot(pic4,A,black+5pt);
dot(pic4,B,black+5pt);
dot(pic4,C,black+5pt);


add(shift(6.,-5)*pic4);
