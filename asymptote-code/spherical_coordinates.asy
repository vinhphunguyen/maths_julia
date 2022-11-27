import math;
texpreamble("\usepackage{bm}");

settings.outformat="pdf"; // output is pdf
settings.render = 0;
settings.prc = false;

import three;

size(300,0);
defaultpen(fontsize(21pt));

pen thickp=linewidth(0.5mm);
real radius=1, theta=37, phi=45;

currentprojection=orthographic((4,1,2));

// draw octan without boundary
draw(octant1,material(palegray+opacity(0.25),shininess=0.5));

// three axes, length of which is r 
real r=1.3;
pen p=black+1pt;
draw(Label("$x$",1),O--r*X,p,Arrow3);
draw(Label("$y$",1),O--r*Y,p,Arrow3);
draw(Label("$z$",1),O--r*Z,p,Arrow3);
label("$O$",(0,0,0),-1.5Y-X);

// point Q 
pen pd=dashed+blue+0.8pt;
triple Q=radius*dir(theta,phi);
draw(Q--(Q.x,Q.y,0),pd);
draw(O--radius*dir(90,phi),pd);
draw((0,0,Q.z)--Q,pd);
draw("$\phi$",arc(O,0.2*Z,0.2Q),align=2*dir(theta/2,phi),Arrow3);
draw("$\theta$",arc(O,0.15*X,0.15*dir(90,phi)),align=5*dir(90,phi/3)+Z,Arrow3);

// Spherical octant
real r=sqrt(Q.x^2+Q.y^2);
draw(arc((0,0,Q.z),(r,0,Q.z),(0,r,Q.z)),dashed+red+.8pt);
draw(arc(O,radius*Z,radius*dir(90,phi)),dashed+heavygreen+.8pt);
draw(arc(O,radius*Z,radius*X),thickp);
draw(arc(O,radius*Z,radius*Y),thickp);
draw(arc(O,radius*X,radius*Y),thickp);

draw("$\rho$",O--Q,align=2*dir(90,phi),p,DotMargin3);

dot("$(x,y,z)$",Q,black+6pt);

