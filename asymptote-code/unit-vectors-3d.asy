import graph3;
usepackage("amsmath");
usepackage("mtpro2");


settings.outformat="png"; // output is pdf
settings.render = 32;
unitsize(4cm);


draw(unitcube,surfacepen=material(white+opacity(0.2),
    emissivepen=0.1*white));

draw((0,0,0)--(1,0,0)--(1,1,0)--(0,1,0)--cycle,black+1pt);
draw((0,0,0)--(0,0,1),black+1pt);
draw((0,1,0)--(0,1,1),black+1pt);
draw((1,1,0)--(1,1,1),black+1pt);
draw((1,0,0)--(1,0,1),black+1pt);
draw((0,0,1)--(1,0,1)--(1,1,1)--(0,1,1)--cycle,black+1pt);

draw((0,0,0)--(1,0,0),red+1.2pt,Arrow3);
draw((0,0,0)--(0,1,0),red+1.2pt,Arrow3);
draw((0,0,0)--(0,0,1),red+1.2pt,Arrow3);

label("$\boldsymbol{i}$",(1.1,0,0.1));
label("$\boldsymbol{j}$",(0.0,1.1,0.1));
label("$\boldsymbol{k}$",(0.0,-0.1,1.1));

xaxis3("$x$",0,1.5,Arrow3);
yaxis3("$y$",0,1.5,Arrow3);
zaxis3("$z$",0,1.5,Arrow3);
