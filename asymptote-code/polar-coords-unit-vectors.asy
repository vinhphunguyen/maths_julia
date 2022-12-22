import graph;

usepackage("amsmath");
usepackage("mtpro2");


settings.outformat="pdf"; // output is pdf

import geometry;

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

//add(shift(-3,-3)*grid(6,6,gray+0.6pt));

picture pic1, pic2;

draw(pic1,Label("${x}$",Relative(0.99)),(-0.2,0)--(2,0),black+.9pt,Arrow(TeXHead));
draw(pic1,Label("${y}$",Relative(0.99)),(0,-.2)--(0,1.5),black+.9pt,Arrow(TeXHead));

real r=1.;
real r1=1.5;
real r2=1.5;
real alpha=45;

pair O=(0,0);
pair A=r*dir(alpha);
pair B=r1*dir(alpha);

pen p =black+1.pt;
pen p1 =purple+1.3pt;
pen p2 =orange+1.3pt;

draw(O--A,p);
draw(A--B,p1,ArcArrow(3pt));

draw("$\theta$=constant",arc(O,0.45,0,alpha),PenMargins);
label("$(x,y)$",A+0.4E);
label("$r$",.6A+0.2W);
label("$\hat{\boldsymbol{r}}=\displaystyle\frac{\boldsymbol{r}}{||\boldsymbol{r}||}$",B+0.46E);

dot(A,black+6pt);

add(pic1);

// pic2

real x0=r*cos(alpha);
real f(real x){return sqrt(1-x^2);}
real fder(real x){return -x/sqrt(1-x^2);}
real tangent_line(real x){return f(x0) + fder(x0)*(x-x0);}

pair O=(0,0);
pair A=r*dir(alpha);
pair B=r1*dir(alpha);
pair C=(A.x-0.4,tangent_line(A.x-0.4));

draw(pic2,"$\theta$",arc(O,0.45,0,alpha),PenMargins);
draw(pic2,O--A,p);
draw(pic2,A--B,p1,ArcArrow(3pt));
draw(pic2,A--C,p2,ArcArrow(3pt));
draw(pic2,arc(O,r,10,80),black+.6pt);

label(pic2,"$\hat{\boldsymbol{\theta}}$",A+(-0.3,.45));
label(pic2,"$r$",.7A+0.2W);
label(pic2,"$\hat{\boldsymbol{r}}$",B+0.2E);
label(pic2,"$r=$constant", (1.6,0.3) );



perpendicular(pic2,A,NE,A--3dir(alpha));

dot(pic2,A,black+6pt);


draw(pic2,Label("${x}$",Relative(0.99)),(-0.2,0)--(2,0),black+.9pt,Arrow(TeXHead));
draw(pic2,Label("${y}$",Relative(0.99)),(0,-.2)--(0,1.5),black+.9pt,Arrow(TeXHead));


add(shift(2.5,0)*pic2);
