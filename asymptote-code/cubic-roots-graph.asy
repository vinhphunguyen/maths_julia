import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

unitsize(1.3cm,1cm);
defaultpen(fontsize(12pt));

real cubic(real x) { return x^3; }
real tangent_lower(real x) { return x-2*sqrt(3)/9; }
real tangent_upper(real x) { return x+2*sqrt(3)/9; }
real fx1(real x) { return x-1; }
real fx2(real x) { return x-.1; }

real xmin=-1.3, xmax=1.3;

pen p = red+1.pt;
pen pb = black+.8pt;
pen pd = orange+.8pt;
pen pp = purple+.8pt;

draw(graph(cubic,  xmin, xmax, n=201), p);
draw(graph(tangent_lower,  xmin, xmax, n=201), pd);
draw(graph(tangent_upper,  xmin, xmax, n=201), pd);
draw(graph(fx1,  xmin, xmax, n=201), pb);
draw(graph(fx2,  xmin, xmax, n=201), pp);

pair Ds []=intersectionpoints(graph(cubic,  xmin, xmax, n=201),graph(tangent_lower,  xmin, xmax, n=201));
dot(Ds[0],red+4pt);
dot((sqrt(3)/3,cubic(sqrt(3)/3)),red+4pt);

pair Ds []=intersectionpoints(graph(cubic,  xmin, xmax, n=201),graph(tangent_upper,  xmin, xmax, n=201));
dot(Ds[0],red+4pt);
dot((-sqrt(3)/3,cubic(-sqrt(3)/3)),red+4pt);

label("$y=x^3$",(1,2.6));


xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),-2.5,2.5,Arrow(TeXHead));


