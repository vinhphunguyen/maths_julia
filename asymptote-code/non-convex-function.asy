import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=false);

real f(real x) { return sin(x^2); }
real xmax=3;
real xmax1=2;

path s1  = graph(f,0,xmax, n=200);
draw(s1,black+0.95pt);

real xa=1.7,xb=2.9, xc=2.4;

pair xp=(xa,f(xa));
pair xm=(xb,f(xb));
pair pxc=(xc,0);
pair pxc0=(xc,f(xc));

pair Q=extension(pxc,pxc0,xp,xm);


draw(xp--xm,red+1pt); // draw the dotted line showing the projections

draw(xm--(xb,0),dashed+gray); // draw the dotted line showing the projections
draw(xp--(xa,0),dashed+gray); // draw the dotted line showing the projections

label("$a$",(xa,-.1));  // draw the;abel v0y
label("$b$",(xb,-.1));  // draw the;abel v0y

label("$A$",xp+.3N);  // draw the;abel v0y
label("$B$",xm+(.1,0));  // draw the;abel v0y

/*

dot(pxc0,red+2.8pt); // plot a dot at (0,0)
dot(Q,orange+2.8pt); // plot a dot at (0,0)

dot(xp,black+2.8pt); // plot a dot at (0,0)
dot(xm,black+2.8pt); // plot a dot at (0,0) */


//xlimits(-3,3);
//ylimits(-20,20);

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
