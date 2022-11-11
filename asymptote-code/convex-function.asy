import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=false);

real f(real x) { return 4^x; }
real xmax=3;
real xmax1=2;

path s1  = graph(f,-1.2,xmax, n=200);
draw(s1,black+0.95pt);

real xa=1.,xb=2.9, xc=2.4;

pair xp=(xa,f(xa));
pair xm=(xb,f(xb));
pair pxc=(xc,0);
pair pxc0=(xc,f(xc));

pair Q=extension(pxc,pxc0,xp,xm);


draw(Q--(0,Q.y),dashed+gray); // draw the dotted line showing the projections
draw(Q--(Q.x,0),dashed+gray); // draw the dotted line showing the projections
draw(pxc0--(0,pxc0.y),dashed+gray); // draw the dotted line showing the projections

draw(xp--(xa,0),dashed+gray); // draw the dotted line showing the projections
draw(xp--xm,red+1pt); // draw the dotted line showing the projections


draw(xp--(xa,0),dashed+gray); // draw the dotted line showing the projections
draw(xm--(xb,0),dashed+gray); // draw the dotted line showing the projections

label("$a$",(xa,-2.3));  // draw the;abel v0y
label("$b$",(xb,-2.3));  // draw the;abel v0y

label("$A$",xp+3N);  // draw the;abel v0y
label("$B$",xm+(.1,0));  // draw the;abel v0y
label("$P$",pxc0+(.1,0));  // draw the;abel v0y
label("$Q$",Q+3N);  // draw the;abel v0y

Label L1=Label("$f[(1-t)a+tb]$",align=(0,0),MidPoint,Fill(white));
Label L2=Label("$(1-t)f(a)+tf(b)$",align=(0,0),MidPoint,Fill(white));
Label L3=Label("$(1-t)a+tb$",align=(0,0),MidPoint,Fill(white));

draw(rotate(90)*L2,(-.8,0)--(-.8,Q.y),Arrows(TeXHead),Bars);
draw(rotate(90)*L1,(-.5,0)--(-0.5,pxc0.y),Arrows(TeXHead),Bars);
draw(L3,(0,-5)--(Q.x,-5),Arrows(TeXHead),Bars);


dot(pxc0,red+2.8pt); // plot a dot at (0,0)
dot(Q,orange+2.8pt); // plot a dot at (0,0)

dot(xp,black+2.8pt); // plot a dot at (0,0)
dot(xm,black+2.8pt); // plot a dot at (0,0)


//xlimits(-3,3);
//ylimits(-20,20);

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
