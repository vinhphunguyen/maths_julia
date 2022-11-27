import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf


picture pic2, pic3;

// pic 2

real alpha=20;
real r = 1;

pair O=(0,0);

import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(30pt));
size(24cm, keepAspect=true);

picture pic3;

// pic 2

real alpha=20;
real r = 1;


draw(pic3,shift(0,0)*scale(1)*arc((0,0),1,0,91),red+1.9pt);

pair P1=dir(alpha);
pair P2=dir(2alpha);
pair P3=dir(3alpha);


pair u=P1-(1,0);
pair w=P3-(1,0);
pair v=(1,0);
real theta1 = degrees( acos((u.x*v.x+u.y*v.y)/sqrt(u.x^2+u.y^2) ));
real theta2 = degrees( acos((w.x*v.x+w.y*v.y)/sqrt(w.x^2+w.y^2) ));

draw(pic3,O--dir(alpha),black+1.9pt);
draw(pic3,O--dir(2alpha),black+1.9pt);
draw(pic3,O--dir(3alpha),black+1.9pt);
draw(pic3,(1,0)--dir(3alpha),black+1.9pt);
draw(pic3,(1,0)--(0,0),black+1.9pt);
draw(pic3,P1--(1,0),black+1.9pt);

label(pic3,"$C$",(0,0.05),blue);
label(pic3,"$O$",(1.02,0.02),blue);
label(pic3,"$P_1$",P1+(0.02,0.02),blue);
label(pic3,"$P_2$",P2+(0.02,0.02),blue);
label(pic3,"$P_3$",P3+(0.,0.07),blue);
label(pic3,"$r$",(0.3,0.3),blue);

draw(pic3,Label("$\alpha$",MidPoint,Fill(white)),arc((0,0),0.26,0,alpha),black+1.2pt);
draw(pic3,Label("$\alpha$",MidPoint,Fill(white)),arc((0,0),0.4,alpha,2alpha),black+1.2pt);
draw(pic3,Label("$\alpha$",MidPoint,Fill(white)),arc((0,0),0.5,2alpha,3alpha),black+1.2pt);
draw(pic3,Label("$\beta$",MidPoint,Fill(white)),arc((1,0),0.2,theta1,theta2),black+1.2pt);

dot(pic3,(1,0),blue+6pt);
dot(pic3,P1,blue+6pt);
dot(pic3,P2,blue+6pt);
dot(pic3,P3,blue+6pt);

add(pic3);
