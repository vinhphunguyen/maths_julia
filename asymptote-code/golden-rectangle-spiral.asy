import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(19cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2, pic3, pic4;


real phi=0.5(1+sqrt(5));
real phi1=phi-1;

pair O=(0,0);
pen p = black+1pt;
fill(pic1,unitsquare,pink);
draw(pic1,unitsquare,p);

real yy=-0.2;
Label L1=Label("$x$",align=O,MidPoint,Fill(white));
draw(pic1, L1,(0,yy)--(1,yy),Arrows(TeXHead),Bars);
draw(pic1, L1,(yy,0)--(yy,1),Arrows(TeXHead),Bars);

label(pic1,"$a)$",(-0.2,-.5));
label(pic2,"$b)$",(-0.1,-.5));
label(pic3,"$c)$",(-0.1,-.5));
label(pic4,"$d)$",(-0.1,-.5));

label(pic1,"$x^2$",(0.5,0.5));
label(pic2,"$\phi x^2$",(0.5phi,0.5));
label(pic3,"$x^2$",(0.5,0.5));
label(pic3,"\small$(\phi-1)x^2$",(1.32,0.5));

add(pic1);

// pic2
fill(pic2,scale(phi,1)*unitsquare,green);
draw(pic2,scale(phi,1)*unitsquare,p);


label(pic2,"golden rectangle",(.8,1.15));

real yy=-0.2;
Label L1=Label("$x$",align=O,MidPoint,Fill(white));
Label L2=Label("$\phi x$",align=O,MidPoint,Fill(white));
draw(pic2, L2,(0,yy)--(phi,yy),Arrows(TeXHead),Bars);
draw(pic2, L1,(yy,0)--(yy,1),Arrows(TeXHead),Bars);

add(shift(1.5,0)*pic2);


// pic3
fill(pic3,scale(phi,1)*unitsquare,green);
fill(pic3,unitsquare,pink);

draw(pic3,scale(phi,1)*unitsquare,p);
draw(pic3,unitsquare,p);

real yy=-0.2;
real yy1=1.2;
Label L1=Label("$x$",align=O,MidPoint,Fill(white));
Label L2=Label("$\phi x$",align=O,MidPoint,Fill(white));
Label L3=Label("\small $(\phi-1) x$",align=O,MidPoint,Fill(white));

draw(pic3, L1,(0,yy1)--(1,yy1),Arrows(TeXHead),Bars);
draw(pic3, L3,(1,yy1)--(phi,yy1),Arrows(TeXHead),Bars);
draw(pic3, L2,(0,yy)--(phi,yy),Arrows(TeXHead),Bars);
draw(pic3, L1,(yy,0)--(yy,1),Arrows(TeXHead),Bars);

add(shift(3.5,0)*pic3);

// pic3
fill(pic4,scale(phi,1)*unitsquare,green);
fill(pic4,unitsquare,pink);
fill(pic4,shift(1,1-phi1)*scale(phi1)*unitsquare,cyan);
fill(pic4,shift(2phi-2,0)*scale(2-phi)*unitsquare,lightred);
fill(pic4,shift(1,0)*scale(2phi-3)*unitsquare,mediumgray);
fill(pic4,shift(1,2phi-3)*scale(5-3phi)*unitsquare,yellow);

draw(pic4,scale(phi,1)*unitsquare,p);
draw(pic4,unitsquare,p);
draw(pic4,shift(1,1-phi1)*scale(phi1)*unitsquare,p);
draw(pic4,shift(2phi-2,0)*scale(2-phi)*unitsquare,p);
draw(pic4,shift(1,0)*scale(2phi-3)*unitsquare,p);
draw(pic4,shift(1,2phi-3)*scale(5-3phi)*unitsquare,p);

draw(pic4,arc((1,0),1,90,180),p);
draw(pic4,arc((1,2-phi),phi-1,0,90),p);
draw(pic4,arc((2phi-2,2-phi),2-phi,0,-90),p);
draw(pic4,arc((2phi-2,2phi-3),2phi-3,-90,-180),p);
draw(pic4,arc((2phi-2-(5phi-8),2phi-3),5-3phi,90,180),p);

Label L3=Label("\small $(\phi-1) x$",align=O,MidPoint,Fill(white));

draw(pic4, rotate(90)*L3,(phi+.25,2-phi)--(phi+.25,1),Arrows(TeXHead),Bars);

add(shift(5.5,0)*pic4);

