import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(16pt));

picture pic1, pic2;


// pic2

real theta=45;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

draw(pic2,unitcircle,black+1.pt);
draw(pic2,rotate(theta)*polygon(4),orange+1.pt);

pair C2 = (1,0);
pair C1 = (-1,0);
pair C3 = (0,1);
pair C4 = (0,-1);


label("$O$", (0,0) + .17 SE );
label("$1$", (1,0) + .17 SE );
label("$-1$", (-1,0) + .17 SW );
label("$-i$", (0,-1) + .17 SE );
label("$i$", (0,1) + .17 NE );


dot(pic2,C1,black+6pt);
dot(pic2,C2,black+6pt);
dot(pic2,C3,black+6pt);
dot(pic2,C4,black+6pt);



draw(pic2,Label("$\text{Re}$",Relative(0.99)),(-1.3,0)--(1.4,0),gray+.4pt,Arrow(TeXHead));
draw(pic2,Label("$\text{Im}$",Relative(0.99)),(0,-1.5)--(0,1.4),gray+.4pt,Arrow(TeXHead));

add(pic2);
