import graph;
import palette;
import contour;

usepackage("amsmath");
//usepackage("mtpro2");
//usepackage("tikz");

settings.outformat="pdf";

//defaultpen(fontsize(12pt));

size(10cm);

real f(real x, real y) {
  return x^2+y^2;
}

pair a=(-2,-2);
pair b=(2,2);

draw(contour(f,a,b,new real[] {0.5,1,2,3,4,8,9}),black+.3pt);

path vector(pair z) {return (2*z.x,2*z.y);}

add(vectorfield(vector,a,b,black+.4pt));

xaxis("$x$",BottomTop,LeftTicks,above=true);
yaxis("$y$",LeftRight,RightTicks,above=true);