import math;
texpreamble("\usepackage{bm}");

settings.outformat="pdf"; // output is pdf
settings.render = 0;
settings.prc = false;

import three;

size(300,0);

pen thickp=linewidth(0.5mm);
real rho=1, phi=60, z=0.8;

currentprojection=orthographic((4,1,2));

// draw a cylinder
draw(unitcylinder,material(palegray+opacity(0.25),shininess=0.5));

// draw three axes
real r=1.1;
pen p=black;
draw(Label("$x$",1),O--r*X,p,Arrow3); // X = (1,0,0)
draw(Label("$y$",1),O--r*Y,p,Arrow3); // Y = (0,1,0)
draw(Label("$z$",1),O--r*Z,p,Arrow3);
label("$\rm O$",(0,0,0),-1.5Y-X);

triple Q=(rho*Cos(phi),rho*Sin(phi),z);
dot("$(x,y,z)$",Q);
draw(Q--(Q.x,Q.y,0),dashed+blue);
draw(O--rho*dir(90,phi),dashed+blue); // in 3D, dir(alpha,beta) = unit triplet with angle alpha and beta (spherical coords)
draw((0,0,Q.z)--Q,dashed+blue);

draw("$\varphi$",arc(O,0.15*X,0.15*dir(90,phi)),align=6*dir(90,phi/3)+Z,Arrow3);
draw("$\rho$",(0,0,0)--(Q.x,Q.y,0),align=-Y+2X,DotMargin3);
draw("$\bm{r}$",O--Q,align=2*dir(90,phi),Arrow3,DotMargin3);


