import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);


picture pic1;

draw(pic1,Label("$x$",Relative(0.99)),(-4.5,0)--(4.5,0),black+1pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-3.5)--(0,3.5),black+1pt,Arrow(TeXHead));

draw(pic1,ellipse((0,0),4,3),blue+1.3pt);

dot(pic1,(-4,0),red+3pt);
dot(pic1,(4,0),red+3pt);
dot(pic1,(0,3),red+3pt);

label(pic1,"$(a,0)$",(4.6,-0.4),red);
label(pic1,"aphelion",(4.3,0.4),red);
label(pic1,"$(-a,0)$",(-4.6,-0.4),red);
label(pic1,"perihelion",(-4.3,0.4),red);

label(pic1,"$\boxed{r=\displaystyle\frac{a(1-e^2)}{1+e\cos\theta}}$",(1.3,-0.8),red);

real e=0.6;
real sun=e*4;
label(pic1,"Sun",(-sun,0.4),red);
dot(pic1,(-sun,0),black+7pt);


Label L1=Label("$c=ea$",align=(0,0),MidPoint,Fill(white));
Label L2=Label("$a(1-e)$",align=(0,0),MidPoint,Fill(white));
Label L3=Label("$c=ea$",align=(0,0),MidPoint,Fill(white));
Label L4=Label("$a\sqrt{1-e^2}$",align=(0,0),MidPoint,Fill(white));
draw(L1,(-sun,-0.7)--(0,-.7),Arrows(TeXHead),Bars);
draw(L2,(-4,-.7)--(-sun,-.7),Arrows(TeXHead),Bars);
draw(L4,(.9,0)--(.9,3),Arrows(TeXHead),Bars);


add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
