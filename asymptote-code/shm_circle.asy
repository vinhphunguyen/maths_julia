import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(16pt));

picture pic1, pic2;

draw(pic2,Label("$\text{Re}$",Relative(0.99)),(-1.3,0)--(1.4,0),gray+.6pt,Arrow(TeXHead));
draw(pic2,Label("$\text{Im}$",Relative(0.99)),(0,-1.5)--(0,1.4),gray+.6pt,Arrow(TeXHead));

// pic2

real theta=40;
real beta=-55;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

pen p = black+1.pt;
pen pd = dashed+.7pt;

draw(pic2,unitcircle,p);

pair C1 = dir(theta);
pair C2 = dir(beta);
pair A1 = (C1.x,0);

draw(arc((0,0), 1.2, theta-5, theta+10), purple+1pt, ArcArrow);

draw((A1.x,-0.2)--(A1.x+.3,-.2),purple+1pt, ArcArrow);
draw((A1.x,-0.2)--(A1.x-.3,-.2),purple+1pt, ArcArrow);

markangle("$-\phi$",C2,(0,0),(1,0),n=1,radius=4mm);
markangle("",C2,(0,0),C1,n=1,radius=13mm);

draw((0,0)--C1,p);
draw((0,0)--C2,p);
draw(C1--A1,pd);

label("$O$", (0,0) + .17 SW );
label("$A$", (1,0) + .17 SE );
label("$-A$", (-1,0) + .2 SW );
label("$A$", .6C1 + .2W );
label("$2C_1=Ae^{-i\phi}$", C2 + .35SE );
label("$\omega_0 t$", A1 + .2NW );


dot(pic2,C1,red+6pt);
dot(pic2,A1,red+6pt);
dot(pic2,C2,red+6pt);

label("$Ae^{i(\omega_0 t -\phi)}$",C1 + .6E);



add(pic2);
