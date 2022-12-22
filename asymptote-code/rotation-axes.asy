import graph;
import geometry;
import gsl;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);

defaultpen(fontsize(12pt));

pen p =black+1pt;
pen pr =red+1pt;
pen pd =black+.6pt;
pen pdr =red+.6pt;
pen p2 =black+1.3pt;

pair O=(0,0);

real theta=20;
real phi11=35;
real angr=radians(theta+phi11);
real ang=(theta+phi11);
real r = 2;

real rX = r*cos(radians(phi11));
real rY = r*sin(radians(phi11));

real xxx=rX*cos(radians(theta));
real yyy=rX*sin(radians(theta));

pair PX=(xxx,yyy);

real xxx=rY*sin(radians(theta));
real yyy=rY*cos(radians(theta));

pair PY=(-xxx,yyy);

pair A=(r*cos(angr),r*sin(angr));

label("$x$",(A.x,-0.2));
label("$y$",(-0.15,A.y));
label("$r$",.5A +.2W );
label("$P(x,y)$", A + .6N );
label("$P(X,Y)$", A + .2N );
label("$X$", PX + .2S );
label("$Y$", PY + .2SW );
label("$O$", .2S );

draw(A--(A.x,0),pd);
draw(A--(0,A.y),pd);
draw(O--A,p);
draw(A--PX,pdr);
draw(A--PY,pdr);

perpendicular((A.x,0),NE,(0,0)--(1,0),black+.6pt);
perpendicular(PX,NE,(0,0)--PX,black+.6pt);

draw("$\theta$",arc(O,0.62,0,theta),Arrow,PenMargins);
draw("$\varphi$",arc(O,0.72,theta,ang),Arrow,PenMargins);

draw(Label("$x$",Relative(0.99)),(-0.1,0)--(3.2,0),p,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,-0.1)--(0,3.2),p,Arrow(TeXHead));

path xx=(0,0)--(3.2,0);
path yy=(0,0)--(0,3.2);

draw(Label("$X$",Relative(0.99)),rotate(theta)*xx,pr,Arrow(TeXHead));
draw(Label("$Y$",Relative(0.99)),rotate(theta)*yy,pr,Arrow(TeXHead));

dot(A,black+6pt);
