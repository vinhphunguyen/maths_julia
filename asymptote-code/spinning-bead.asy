import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(18cm, keepAspect=true);
defaultpen(fontsize(12pt));

//add(shift(-1,-1)*grid(19,10,gray+0.2pt));

picture pic1, pic2, pic3, pic4;

real alpha=-40;
real beta=-35;

pair O = (0,0);
pair P = dir(alpha);
pair H = (0,P.y);


draw(pic1, unitcircle, black+1pt);
draw(pic1,(0,-1.1)--(0,1.1),gray+1pt);

real rad = .25;
path ar = arc((0,0),rad,180,360);

draw(pic1,Label("$\omega$",align=E,EndPoint),yscale(.5)*shift(0,2.6)*ar,Arrow,PenMargins);
draw("$\theta$",arc(O,0.4,alpha,-90),PenMargins);

label(pic1,"$O$",(-0.09,0));
label(pic1,"$R$",(0.5,-0.2));

draw(pic1,O--P,black+1pt);

dot(pic1,P,black+5pt);

label(pic1,"$a)$",(-1,-1));

add(pic1);

// pic2
draw(pic2, unitcircle, black+1pt);
draw(pic2,(0,0)--(0,-1),black+1pt);
draw(pic2,P--P+0.5dir(90+alpha),black+1pt,ArcArrow);

label(pic2,"$O$",(-0.09,0));
label(pic2,"$R$",(0.5,-0.2));
draw(pic2,"$\theta$",arc(O,0.4,alpha,-90),PenMargins);

draw(pic2,O--P,black+1pt);
draw(pic2,H--P,black+1pt);

perpendicular(pic2,H,NE,H--P,blue);

real xx = -0.4;
Label L2=Label("$R\cos\theta$",align=O,MidPoint,Fill(white));
Label L1=Label("$x$",align=O,MidPoint,Fill(white));
draw(pic2,L2,(xx,H.y)--(xx,0),Arrows(TeXHead),Bars);
draw(pic2,L1,(xx,-1)--(xx,H.y),Arrows(TeXHead),Bars);
label(pic2,"$\rho$",(0.35,H.y-.1));

string s="\begin{minipage}{3cm}
\begin{align*}
x&=R(1-\cos\theta)\\
\rho&=R\sin\theta
\end{align*}
\end{minipage}
";

//label(pic1,s,(2.6,1.8),red);
label(pic2,s,(-0.06,0.5), red);

dot(pic2,P,black+5pt);

label(pic2,"$b)$",(-1,-1));


add(shift(2.1,0)*pic2);


// pic 3

draw(pic3, unitcircle, black+1pt);
draw(pic3,(0,0)--(0,-1),black+1pt);
draw(pic3,(0,0)--(1,0),black+1pt);
draw(pic3,(0,0)--P,black+1pt);


label(pic3,"$O$",(-0.09,0));
label(pic3,"$R$",(0.5,0.2));
draw(pic3,"$\theta$",arc(O,0.4,alpha,-90),PenMargins);
draw(pic3,"$\Delta\theta$",arc(O,0.6,0,alpha),PenMargins);

label(pic3,"$t$",P+(.1,-.1));
label(pic3,"$t+\Delta t$",(1,0)+(0,.15));
label(pic3,"$\Delta s$",(1.1,-.25));
label(pic3,"$\Delta s=R\Delta \theta $",(-0.2,.6));

dot(pic3,P,black+5pt);
dot(pic3,(1,0),black+5pt);

add(shift(4.2,0)*pic3);

// pic 4

draw(pic4, scale(.8)*unitcircle, black+1pt);
draw(pic4,(0,0)--(.8,0),black+1pt);
draw(pic4,(.8,0)--(.8,.6),black+1pt,ArcArrow);

draw(pic4,"$\omega$",arc(O,1.2,45,90),Arrow,PenMargins);

label(pic4,"$O$",(-0.09,0));
label(pic4,"$\rho$",(.3,-.1));

dot(pic4,(.8,0),black+5pt);

label(pic4,"$c)$",(-1,-1));
label(pic4,"$v_p=\rho \omega$",(0,0.4));
label(pic4,"$\bm{v}_p$",(0.99,0.2));

add(shift(6.4,0)*pic4);
