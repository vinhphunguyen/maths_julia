import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm); // size of the image

pair F(real t) {
    real a = 8.;
    return ( a*(2*cos(t) - cos(2t)), a*(2*sin(t) - sin(2t)) );
}



path g = graph(F, 0, 6*pi,n=200);
draw(g, red+1.2pt);

xlimits(-25,15);
ylimits(-20,20);

xaxis(Label("$x$",position=EndPoint, align=NE),RightTicks(NoZero),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),LeftTicks(NoZero),Arrow(TeXHead));
