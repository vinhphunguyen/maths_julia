import graph;
import geometry;
import gsl;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


picture pic1, pic2, pic3;


pen p= black+1pt;
pen pr= red+1.3pt;
pen pp= black+.7pt;


// pic2


pair O=(0,0);
pair A=(0.5,0);
pair B=(0.5,sqrt(3)/2);
pair C=(0,1);



path arcPath = arc(0, 1, 60, 90);

filldraw(arcPath--O--cycle, lightgray);
fill(O--A--B--cycle,lightgreen);

draw(unitcircle,black+1.4pt);
draw(A--B,1.1pt+black);
draw(A--O,1.1pt+black);
draw(B--O,1.1pt+black);

label("$\sqrt{1-x^2}$",(.8,.9));
label("$1$",(.9,-.1));
label("$1/2$",(0.5,-.1));
label("$0$",(-0.1,-.1));
label("$\frac{\sqrt{3}}{2}$",(0.6,.5));

markangle("$30^\circ$",radius=24,B,O,C,.4mm+black);

draw(Label("$x$",Relative(0.99)),(-1.1,0)--(1.17,0),black+.9pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.17),black+.9pt,Arrow(TeXHead));


