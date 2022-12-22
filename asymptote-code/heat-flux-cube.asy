import graph3;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf";
settings.render = 0;
defaultrender.merge=true;

import three;


size(8cm);
currentprojection=oblique;

//draw(unitcube,surfacepen=cyan+opacity(.4));

draw( surface( (1,0,1)--X--(1,1,0)--(1,1,1)--cycle ), surfacepen=white );
draw( surface( O--Y--(0,1,1)--Z--cycle ), surfacepen=white );

draw( surface( O--X--(1,0,1)--Z--cycle ), surfacepen=blue+opacity(.3) );
draw( surface( (0,1,1)--(1,1,1)--(1,1,0)--Y--cycle ), surfacepen=blue+opacity(.3) );

draw(box(O,(1,1,1)),black+1pt);

draw((1,0.6,0.5)--(1.5,0.6,0.5),Arrow3); // normal to face 2 
draw((0,0.3,0.5)--(-.5,0.3,0.5),Arrow3); // normal to face 1 
draw((0.5,1,0.5)--(0.5,1.5,0.5),Arrow3);

label("$(x,y,z)$", O + (.25,-.12,0));
label("$\boldsymbol{n}(1,0,0)$",  (1.7,0.8,0.5));
label("$\boldsymbol{n}(-1,0,0)$", (-.7,0.4,0.5));
label("$\boldsymbol{n}(0,1,0)$", (0.9,1.5,0.5));

label("$\Delta x$",(0.5,0,1.2));
label("$\Delta z$",(1.2,0,0.5));
label("$\Delta y$",(.2,0.35,0.));

label("$(1)$",(0,0.5,0.5));
label("$(2)$",(1,0.5,0.5));
label("$(3)$",(0.65,1,0.5));
label("$(4)$",(0.5,0,0.55));

dot(O,black+4pt);

real a=0.3;
xaxis3("$x$",0,a+1,Arrow3);
yaxis3("$y$",0,a+1,Arrow3);
zaxis3("$z$",0,a+1,Arrow3);
