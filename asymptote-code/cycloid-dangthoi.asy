import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

pair F(real t) {
    real a = 1.;
    return ( a*(t - sin(t)), -a*(1 - cos(t)) );
}

pair ep = F(pi);
pair fp = F(pi/2.5);
pair f2p = F(pi/2);

path g = graph(F, 0, pi,n=200);
draw(g, black+1.1pt);

label("$(x_0,y_0)$", fp + .5E );
label("$g$", (fp.x-0.14, fp.y - 1/3) );


draw(fp -- (fp.x, fp.y - 1/2), Arrow(size = 6));

dot(ep,4pt+red);
dot(fp,4pt+blue);
dot(f2p,4pt+cyan);

draw(Label("$x$",Relative(0.99)),(0,0)--(3.2,0),black+.6pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,0)--(0,-2.1),black+.6pt,Arrow(TeXHead));
