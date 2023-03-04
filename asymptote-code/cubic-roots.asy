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

real theta=30;
real a = 1.5;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

draw(pic2,unitcircle,black+1.pt);
draw(pic2,scale(a)*unitcircle,black+1.pt);
draw(pic2,rotate(theta)*polygon(3),orange+1.pt);
draw(pic2,rotate(theta)*scale(a)*polygon(3),red+1.pt);

pair C21 = a*dir(240);
pair C2 = dir(240);
pair C1 = dir(120);
pair C11 = a*dir(120);
pair C3 = (1,0);
pair C31 = (a,0);


draw((0,0)--C11);
draw((0,0)--C21);

label("$O$", (0,0) + .17 SE );
label("$\omega$", C1 + .4W );
label("$\omega^2$", C2 + .35W );
label(pic2,Label("$\sqrt[3]{t_1}$",align=(0,0),MidPoint,Fill(white)), C31 + .35N );


dot(pic2,C1,black+6pt);
dot(pic2,C2,black+6pt);
dot(pic2,C3,black+6pt);
dot(pic2,C11,red+6pt);
dot(pic2,C21,red+6pt);
dot(pic2,C31,red+6pt);



draw(pic2,Label("$\text{Re}$",Relative(0.99)),(-1.8,0)--(1.8,0),gray+.4pt,Arrow(TeXHead));
draw(pic2,Label("$\text{Im}$",Relative(0.99)),(0,-1.8)--(0,1.8),gray+.4pt,Arrow(TeXHead));

add(pic2);
