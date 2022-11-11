import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(11cm, keepAspect=true);


real a = 2.;
real b = 1.3;
real c = sqrt(a^2-b^2);

real t = 1.8;

pair F(real t) {
    return ( a*cos(t), b*sin(t) );
}

pair P=F(t);

path g = graph(F, 0, 2*pi,n=200);
draw(g,red+1.2pt);

dot((-a,0),red+3pt);
dot((a,0),red+3pt);
dot((0,b),red+3pt);
dot((0,-b),red+3pt);
dot((c,0),blue+5pt);
dot((-c,0),blue+5pt);
dot(P,black+5pt);

label("$(a,0)$",(a+.2,-0.2),red);
label("$A_1$",(a+.2,0.2),red);
label("$(-a,0)$",(-a-.2,-0.2),red);
label("$A_2$",(-a-.2,0.2),red);
label("$B_1(0,b)$",(0.3,b+.2),red);
label("$B_2(0,-b)$",(0.3,-b-.2),red);
label("$F_1$",(-c,.2),blue);
label("$F_2$",(c,.2),blue);
label("$P(x,y)$",P+(0,.2),black);

label("$d_1$",(-c,0)+(0.33,.7),black);
label("$d_2$",(c,0)+(-0.6,.7),black);

draw(P--(-c,0));
draw(P--(c,0));

label("$(-c,0)$",(-c,-.2),blue);
label("$(c,0)$",(c,-.2),blue);

xaxis("$x$",-2.5,2.5,black+1pt,Arrow(TeXHead));
yaxis("$y$",-1.5,1.8,black+1pt,Arrow(TeXHead));
