import graph3;
import palette;
import contour;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf";
settings.render = 0;

size(12cm);
currentprojection=orthographic(5,8,8);

defaultrender.merge=true;

// intersection of surface with plane y=1 is a curve
// using parametric representation
triple fy(real t) {
    return (t, 1/2, sqrt(3/4-t^2));
}

// intersection of surface with plane x=1 is a curve
triple fx(real t) {
    return (1/2, t, sqrt(3/4-t^2));
}

real der(real t){return -t/sqrt(3/4-t^2);}

triple tangentx(real t) {
    return (t, 1/2, 0.5*sqrt(2) + der(0.5)*(t-0.5));
}

triple tangenty(real t) {
    return (1/2, t, 0.5*sqrt(2) + der(0.5)*(t-0.5));
}

real fff(real x, real y){return sqrt(1-x^2-y^2);}

path3 g1 = graph(fy, 0, sqrt(3)/2, operator ..);
path3 g2 = graph(fx, 0, sqrt(3)/2, operator ..);

path3 g3 = graph(tangentx, 0, sqrt(3)/2, operator ..);
path3 g4 = graph(tangenty, 0, sqrt(3)/2, operator ..);

triple P=(0.5,0.5,sqrt(1-0.5^2-0.5^2));

patch s0=octant1.s[0];
patch s1=octant1.s[1];
draw(surface(s0),green+opacity(0.5));
draw(surface(s1),green+opacity(0.5));
draw(s0.external(),blue+1pt);
draw(s1.external(),blue+1pt);

label("$z=\sqrt{1-x^2-y^2}$",P+(-1.,0.3,0.));
label("$z(x,1/2)$",(3/4-0.1,0.5,0));
label("$z(1/2,y)$",(0.2,3/4-0.1,0));
label("$P$",P+(0.1,0,0));
label("tangent to $z(1/2,y)$",P+(0.4,0,0.99));
label("tangent to $z(x,1/2)$",P+(-0.55,0.3,0.7));


draw(g1,red+2pt);
draw(g2,red+2pt);

draw(g3,blue+2pt);
draw(g4,blue+2pt);

draw(P,black+4pt);

// axes
xaxis3("$x$",0,1.2,Arrow3);
yaxis3("$y$",0,1.2,Arrow3);
zaxis3("$z$",0,1.2,Arrow3);
