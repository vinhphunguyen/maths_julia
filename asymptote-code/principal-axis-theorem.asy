import graph;
import geometry;

usepackage("amsmath,amsthm,amssymb, mathtools,mathrsfs,stmaryrd");
usepackage("bm");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);


picture pic1, pic2, pic3, pic4;

real a = 1/sqrt(1);
real b = 1/sqrt(9);

//pic4

fill(pic4,rotate(-45)*ellipse((0,0),a,b),lightcyan);
draw(pic4,rotate(-45)*ellipse((0,0),a,b),black+1.1pt);


draw(pic4,Label("$x$",Relative(0.99)),(-1.3,0)--(1.5,0),black+1pt,Arrow(TeXHead));
draw(pic4,Label("$y$",Relative(0.99)),(0,-1.3)--(0,1.4),black+1pt,Arrow(TeXHead));

draw(pic4,Label("$y_1$",Relative(0.99)),rotate(-45)*((-1.3,0)--(1.5,0)),Arrow(TeXHead));
draw(pic4,Label("$y_2$",Relative(0.99)),rotate(-45)*((0,-1.3)--(0,1.4)),Arrow(TeXHead));


path p1 = (0,0)--(1,0);
path p2 = (0,0)--(0,1);
draw(pic4,rotate(-45)*p1,red+1.2pt,ArcArrow);
draw(pic4,rotate(-45)*p2,red+1.2pt,ArcArrow);

label(pic4,"$\bm{v}_1$", rotate(-45)*(1,0) + (0,-0.2) , red);
label(pic4,"$\bm{v}_2$", rotate(-45)*(0,1) + (0,+0.2), red);

label(pic4,"$\lambda_1=1$", rotate(-45)*(1,0) + (0.4,0.2) , red);
label(pic4,"$\lambda_2=9$", rotate(-45)*(0,1) + (0.4,0.) , red);

draw(pic4,"$45^{\circ}$",arc((0,0),0.6,0,-45),Arrow,PenMargins);

add(pic4);
