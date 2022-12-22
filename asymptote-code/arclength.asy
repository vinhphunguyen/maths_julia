import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(5cm, 5cm, keepAspect=false);

real f(real x) { return sqrt(x); }

real xmin=0.5;
real xmax=3.5;
real xx=1.5;
real xdx=1.5+0.4;

pair pa=(xmin,f(xmin));
pair pb=(xmax,f(xmax));

pair px=(xx,f(xx));
pair pdx=(xdx,f(xdx));

path s12 = graph(f, xmin, xmax, n=200);
draw(s12,black+0.95pt);
draw(px--pdx,red+1pt);

label("$f(x)$",(3pi/4,1.9));

draw(pa--(pa.x,0),dashed+black); // draw the dotted line showing the projections
draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));

real y=-0.08;

xtick(Label("$a$"),(xmin,y));
xtick(Label("$b$"),(xmax,y));

picture pic;
size(pic,1.3cm,IgnoreAspect);
draw(pic,(0,0)--(1,0)--(1,1)--cycle);

add(new void(frame f, transform t) {
    frame G=shift( point(f,.6S) ) * align( bbox(pic,blue),.6SE );
    add(f,G);
    //draw(f,t*box(min(pic,user=true),max(pic,user=true)),blue);
    //draw(f,point(G,E)--t*point(pic,W),blue);
  });
