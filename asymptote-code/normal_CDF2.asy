import graph;
import geometry;
import gsl;

usepackage("amsmath,amsmath,amsthm,amssymb, mathtools,mathrsfs,upgreek");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

unitsize(1cm,7cm);

real f(real z) { return cdf_gaussian_P(z,mu=0,sigma=1); }

real xmax = 3.6;
real z1=1;
real z2=-z1;

pair P1 = (z1,f(z1));
pair P2 = (z2,f(z2));

path s1  = graph(f, -xmax,xmax, n=200);

pen fillpen = mediumgray;

draw(s1,red+0.95pt);
draw((0,0)--(0,f(0)),dashed+blue+0.5pt);
draw((0,f(0))--(-xmax,f(0)),dashed+blue+0.5pt);
draw((z1,0)--P1,dashed+blue+0.5pt);
draw((z2,0)--P2,dashed+blue+0.5pt);
draw((-xmax,P2.y)--P2,dashed+blue+0.5pt);
draw((-xmax,P1.y)--P1,dashed+blue+0.5pt);
draw((-xmax,1)--(3,1),dashed+blue+0.5pt);

dot((0,f(0)),blue+5pt);
dot(P1,blue+5pt);
dot(P2,blue+5pt);

label("$\upphi(z)$",(1.9,.8),red);

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (-xmax+0.15cm,0) --(-xmax,0);

Label ticklabel1 = Label("$z_1$", position=EndPoint);
Label ticklabel2 = Label("$z_2$", position=EndPoint);
Label ticklabel3 = Label("$0$",   position=EndPoint);

draw((z1,0), xtick, L=ticklabel1);
draw((z2,0), xtick, L=ticklabel2);
draw((0,0),  xtick, L=ticklabel3);

draw((-xmax,f(0)),  ytick, L=Label("$\displaystyle\frac{1}{2}$", position=EndPoint));
draw((-xmax,f(z1)),  ytick, L=Label("$\upphi(z_1)$", position=EndPoint));
draw((-xmax,f(z2)),  ytick, L=Label("$\upphi(z_2)$", position=EndPoint));
draw((-xmax,1),  ytick, L=Label("$1$", position=EndPoint));

draw(Label("$u$",Relative(0.99)),(-xmax,0)--(xmax,0),Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(-xmax,0)--(-xmax,1.2),Arrow(TeXHead));

//write(cdf_gaussian_P(0,mu=0,sigma=1));
