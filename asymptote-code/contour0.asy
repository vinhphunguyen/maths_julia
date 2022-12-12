import graph;
import palette;
import contour;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("tikz");

settings.outformat="pdf";

defaultpen(fontsize(12pt));

size(10cm,keepAspect=true);

real f(real x, real y) {
  return x^2+2y^2;
}

// parametric of a circle of radius one
pair F(real t) {
    return ( cos(t), sin(t) );
}

path g = graph(F, 0, 2*pi,n=200);

pair a=(-2,-2);
pair b=(2,2);

draw(contour(f,a,b,new real[] {0.5,1,2,3,4,8,9}),black+1.1pt);

draw(g,red+1.2pt);

draw((1,.8)--(1.5,1.5),ArcArrow);
label("$c\nearrow$",(1.7,1.5));
label("min",(1.2,0));
label("max",(0,1.1));

draw((0,-1)--(0,-2.),blue+1pt,ArcArrow);
draw((0,-1)--(0,-1.5),red+1pt,ArcArrow);

label("$\nabla f$ ",(0.3,-1.8),blue);
label("$\nabla g$ ",(0.3,-1.5),red);

dot((-1,0), red+5pt);
dot((1,0), red+5pt);
dot((0,1), blue+5pt);
dot((0,-1), blue+5pt);

xaxis("$x$",BottomTop,LeftTicks,above=true);
yaxis("$y$",LeftRight,RightTicks,above=true);