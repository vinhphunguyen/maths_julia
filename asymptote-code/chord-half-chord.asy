import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.2pt;

real alpha = 60;

pair O = (0,0);
pair C = (1,0);
pair A = dir(alpha);
pair B = dir(-alpha);


draw(pic2,unitcircle,p);
draw(pic2,O--A,p);
draw(pic2,O--B,p);
draw(pic2,A--B,p);
draw(pic2,O--C,p);

label(pic2,"$O$",O+0.3W);
label(pic2,"$A$",A+0.15N);
label(pic2,"$B$",B+0.15S);
label(pic2,"$R$",(.1,.5));


label(pic2,"$AB=\text{crd}(2\alpha)$",(0,-1.4));
label(pic2,"$a)$",(-1,1.1));

//perpendicular(pic2,(C2.x,0),NE,(0,0)--(1,0),blue);
draw(pic2,"$\alpha$",arc(O,.3,0,alpha),PenMargins);
draw(pic2,"$\alpha$",arc(O,.3,0,-alpha),PenMargins);

add(pic2);

// pic1

draw(pic1,unitcircle,p);
draw(pic1,O--A,p);
draw(pic1,A--(A.x,0),p);
draw(pic1,O--C,p);

label(pic1,"$O$",O+0.3W);
label(pic1,"$A$",A+0.15N);
label(pic1,"$C$",(A.x,-0.2));
label(pic1,"$R$",(.1,.5));


label(pic1,"$AC=\displaystyle\frac{1}{2}AB$",(0,-1.4));
label(pic1,"$b)$",(-1,1.1));

//perpendicular(pic2,(C2.x,0),NE,(0,0)--(1,0),blue);
draw(pic1,"$\alpha$",arc(O,.3,0,alpha),PenMargins);

add(shift(3.,0)*pic1);

