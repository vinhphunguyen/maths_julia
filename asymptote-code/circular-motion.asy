import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(16pt));

picture pic1, pic2;


// pic2

real theta=40;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

draw(pic2,unitcircle,black+1.pt);

pair O = (0,0);
pair A = dir(theta);

draw(pic2,(0,0)--A,blue+1.1pt,ArcArrow);
draw(pic2,A--A+.6dir(theta+90),red+1.1pt,ArcArrow);
draw(pic2,O--.4dir(theta+180),red+1.1pt,ArcArrow);


label("$O$",(.1,-0.1));
label(rotate(45)*"$\bm{R}(t)$",0.5A+(0,.13));
label("$\bm{v}(t)$",(0.3,1.2));
label("$\bm{a}=-\omega^2\bm{R}$",(-0.4,-.4));

draw(pic2,A--(A.x,0),dashed+black+0.8pt);
draw(pic2,A--(0,A.y),dashed+black+0.8pt);

//pair H=extension( (0,0),(0,0)+dir(theta),(1,0),dir( theta2 ) );

//perpendicular(pic2,H,NE,(1,0)--dir(degrees(pi/4)),blue);

draw(pic2,"$\omega t$",arc((0,0),0.35,0,theta),Arrow,PenMargins);

Label Ls=Label("$r\sin \omega t$",align=O,MidPoint,Fill(white));
Label Lc=Label("$r\cos \omega t$",align=O,MidPoint,Fill(white));

real y1=-0.25;
real y=-0.2;
draw(Lc,(0,y1)--(A.x,y1),Arrows(TeXHead),Bars);
draw(rotate(90)*Ls,(y,0)--(y,A.y),Arrows(TeXHead),Bars);

dot(A,black+6pt);

draw(pic2,Label("$x$",Relative(0.99)),(-1.1,0)--(1.2,0),black+.6pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.2),black+.6pt,Arrow(TeXHead));

add (pic2);

//f
