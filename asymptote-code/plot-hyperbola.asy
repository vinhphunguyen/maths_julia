import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(14cm, 14cm, keepAspect=true);


real a=5, b=5;

real xmin=10, xmax=10;

real xp(real x) {return (b/a)*sqrt(x^2-a^2);}
real xm(real x) {return -(b/a)*sqrt(x^2-a^2);}

real f(real x) {return (b/a)*x;}
real g(real x) {return -(b/a)*x;}



draw(graph(xp,5,xmax,200),red+1.1pt);
draw(graph(xm,5,xmax,200),blue+1.1pt);

draw(graph(xp,-xmax,-5,200),red+1.1pt);
draw(graph(xm,-xmax,-5,200),blue+1.1pt);

draw(graph(f,-xmax,xmax),black+1.pt);
draw(graph(g,-xmax,xmax),black+1.pt);

label("$y=x$",(5,6.));
label("$y=-x$",(-4.5,6.));
/*
label("$y=\displaystyle\frac{3}{5}\sqrt{x^2-25}$",(8.5,2.5),red);
label("$y=-\displaystyle\frac{3}{5}\sqrt{x^2-25}$",(8.5,-2.5),blue); */

label("$-5$",(-5.5,-0.5));
label("$5$",(4.5,-0.5));

xaxis("$x$",black+2pt,Arrow(TeXHead));
yaxis("$y$",Arrow(TeXHead));
