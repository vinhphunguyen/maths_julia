import graph3;
import palette;
import contour;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf";
settings.render = 0;

size(8cm);
currentprojection=orthographic(5,10,8);

defaultrender.merge=true;

// intersection of surface with plane y=1 is a curve
// using parametric representation
triple fy(real t) {
    return (t, 1/2, sqrt(3/4-t^2));
}


real der(real t){return -t/sqrt(3/4-t^2);}

triple tangentx(real t) {
    return (1, 0, der(t) );
}

triple gradd(triple P) {
    return (2P.x, 2P.y, 2P.z);
}

path3 g1 = graph(fy, 0, sqrt(3)/2, operator ..);

triple P=(0.5,0.5,sqrt(1-0.5^2-0.5^2));

patch s0=octant1.s[0];
patch s1=octant1.s[1];
draw(surface(s0),green+opacity(0.5));
draw(surface(s1),green+opacity(0.5));
draw(s0.external(),blue);
draw(s1.external(),blue);


label("$\nabla f$",P+.35*gradd(P)+(0.1,0,0),red);
label("$\boldsymbol{r}(t_0)$",P+.35*gradd(P)+(0.15,0,-0.22),cyan);
label("$P$",P+.35*gradd(P)+(-0.2,0,-0.1));
label("$C$",P+.35*gradd(P)+(0,-.1,-.8));

draw(g1,red+2pt);



draw(P--P+.35*gradd(P),red+2pt,Arrow3(10pt));
draw(P--P+.35*tangentx(0.5),cyan+2pt,Arrow3(10pt));

draw(P,black+4pt);

// axes
xaxis3("$x$",0,1.2,Arrow3);
yaxis3("$y$",0,1.2,Arrow3);
zaxis3("$z$",0,1.2,Arrow3);
