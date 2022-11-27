import graph;
import geometry;
import gsl;

usepackage("amsmath,amsmath,amsthm,amssymb, mathtools,mathrsfs,upgreek");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

unitsize(1cm,7cm);

real f(real x) { return (1/sqrt(2pi))*exp(-0.5x^2); }

real xmax = 3.6;
real xx = 1;

path s1  = graph(f, -xmax,xmax, n=200);
path s11 = graph(f, -xmax, xx, n=200);

pen fillpen = mediumgray;
fill((-xmax,0)--(-xmax,f(-xmax))--s11 -- (xx,0) -- cycle, fillpen);

draw(s1,red+0.95pt);
draw((xx,0)--(xx,f(xx)),blue+0.5pt);

arrow("$\displaystyle\frac{1}{\sqrt{2\pi}}e^{-\frac{u^2}{2}}$",(2.2,.07),N,red);
label("$\upphi(z)$",(-.45,.2),red);
label("$\boxed{\upphi(z)=\displaystyle\frac{1}{\sqrt{2\pi}}\int_{-\infty}^z e^{-\frac{u^2}{2}}du}$",(-.2,.63));

path tick = (0,0) -- (0,-0.15cm);
Label ticklabel = Label("$z$", position=EndPoint);
draw((xx,0), tick, L=ticklabel);

//xlimits(-3,3);
//ylimits(-20,20);


//xaxis(Label("$u$",position=EndPoint, align=NE),black+0.65pt,Arrow(TeXHead));
//yaxis(Label("$y$",position=EndPoint, align=NE),0,0.5,red+0.65pt,Arrow(TeXHead));


draw(Label("$u$",Relative(0.99)),(-xmax,0)--(xmax,0),Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,0)--(0,.5),Arrow(TeXHead));

write(cdf_gaussian_P(0,mu=0,sigma=1));
