import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=false);
defaultpen(fontsize(12pt));

picture pic1, pic2, pic3; 

// pic1
pair F(real t) {
    real a = 1.;
    return ( 16sin(t)*sin(t)*sin(t), 13cos(t) - 5cos(2t)-cos(3t)-cos(4t) );
}

real f(real x) { return 1000*x; }
real g(real x) { return x^6/16; }


path s1 = graph(f, -.02, .02, n=201);
path s2 = graph(g, -2, 2, n=201);
path s3 = graph(F, -20, 20,n=300);

//draw(pic1,Label("$x$",Relative(0.99)),(-2,0)--(2,0),black+.9pt,Arrow(TeXHead));
//draw(pic1,s1, red+2pt);


draw(pic1,Label("$x$",Relative(0.99)),(-2,0)--(2,0),black+.9pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(0,4),black+.9pt,Arrow(TeXHead));
draw(pic1,s2, red+2pt);


//draw(pic1,Label("$x$",Relative(0.99)),(-20,0)--(20,0),black+.9pt,Arrow(TeXHead));
//draw(pic1,Label("$y$",Relative(0.99)),(0,-20)--(0,15),black+.9pt,Arrow(TeXHead));
//draw(pic1,s3, red+2pt);

add(pic1);







