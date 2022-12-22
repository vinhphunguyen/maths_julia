import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2; 

// axes

pen p =  black + .8pt;
pen pp =  black + .8pt;
pen ppp = red + .8pt;

pair A =(0,0);
pair B =(0,2.5);


draw(pic1,Label("$x$",Relative(0.99)),(-pi,0)--(2pi+0.8,0),p,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),A--B,p,Arrow(TeXHead));


pair F(real t) {
    real a = 1.;
    return ( a*(t - sin(t)), a*(1 - cos(t)) );
}


path g = graph(F, -pi, 2pi,n=200);
draw(g, blue+.8pt);

real theta0=pi;
real slope_cycloid(real theta){return sin(theta)/(1-cos(theta));}
real tangent_line(real x){return F(theta0).y + slope_cycloid(theta0)*(x-F(theta0).x);}

draw(graph(tangent_line,F(theta0).x-0.5,F(theta0).x+0.5),ppp);

real theta0=3pi/4;
real tangent_line(real x){return F(theta0).y + slope_cycloid(theta0)*(x-F(theta0).x);}

draw(graph(tangent_line,F(theta0).x-0.5,F(theta0).x+0.5),ppp);

path xtick = (0,0) -- (0,-0.15cm);

Label ticklabelx1 = Label("$0$", position=EndPoint);
Label ticklabelx2 = Label("$x(3\pi/4)$", position=EndPoint);
Label ticklabelx3 = Label("$\pi$", position=EndPoint);
Label ticklabelx4 = Label("$2\pi$", position=EndPoint);

pen pp = black+1.1pt;

draw((0,0),     xtick, L=ticklabelx1, pp);
draw((F(theta0).x,0), xtick, L=ticklabelx2, pp);
draw((pi,0),    xtick, L=ticklabelx3, pp);
draw((2pi,0),   xtick, L=ticklabelx4, pp);

add(pic1);







