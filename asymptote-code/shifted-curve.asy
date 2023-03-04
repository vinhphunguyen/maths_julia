import graph;

usepackage("amsmath");
usepackage("mtpro2");


settings.outformat="pdf"; // output is pdf

size(11cm, keepAspect=true);
defaultpen(fontsize(12pt));

real xmin=-pi/2, xmax=3*pi, ymin=-1, ymax=1;

real f(real x) {return cos(x);}
real fs(real x) {return cos(x-0.5pi);}

draw(graph(f,xmin,xmax),red+1pt,"$\cos( x)$" );
draw(graph(fs,xmin,xmax),blue+1pt,"$\cos(x-\pi/2)$");


xaxis(xmin,xmax+.4,ArcArrow);
yaxis(-1.3,1.5,ArcArrow);

label("$\cos( x)$", (2pi,1.3), red);
label("$\cos( x-\pi/2)$", (2pi+pi,1.3), blue );

label("$x$", (xmax,-0.3));
label("$y$", (0, ymax+.4), E);

path xtick = (0,0) -- (0,-0.15cm);

Label ticklabelx3 = Label("$\pi/2$", position=EndPoint);
Label ticklabelx4 = Label("$\pi$", position=EndPoint);
Label ticklabelx5 = Label("$2\pi$", position=EndPoint);

pen pp = black+.7pt;

draw((pi/2,0),     xtick, L=ticklabelx3, pp);
draw((pi,0),     xtick, L=ticklabelx4, pp);
draw((2pi,0),     xtick, L=ticklabelx5, pp);

draw((.5pi-pi/4,f(.5pi-pi/4))--(pi-pi/4,fs(pi-pi/4)),ArcArrow);

//attach(legend(),truepoint(E),20E,UnFill);