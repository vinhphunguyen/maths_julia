import graph;

usepackage("amsmath");
usepackage("mtpro2");


settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(12pt));
size(10cm, keepAspect=true);

import geometry;

picture pic1, pic2, pic3;

pen p = black+1pt;


draw(pic1,Label("$t$",Relative(0.99)),            (-2,0)--(2,0), black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$g_\epsilon(t)$",Relative(0.99)),(0,-.5)--(0,5),black+.6pt,Arrow(TeXHead));

real epsilon=.5;


draw(pic1,(-epsilon,0)--(-epsilon,0.5/epsilon)--(epsilon,0.5/epsilon)--(epsilon,0),p);
label(pic1,"$\small -\epsilon$",(-epsilon,-0.3));
label(pic1,"$\small \epsilon$",( epsilon,-0.3));
label(pic1,"$\frac{1}{2\epsilon}$",( 0,0.5/epsilon) + (.4,.65));

add(pic1);

// pic2
real epsilon=.25;


draw(pic2,Label("$t$",Relative(0.99)),            (-2,0)--(2,0),black+.6pt,Arrow(TeXHead));
draw(pic2,Label("$g_\epsilon(t)$",Relative(0.99)),(0,-.5)--(0,5),black+.6pt,Arrow(TeXHead));

draw(pic2,(-epsilon,0)--(-epsilon,0.5/epsilon)--(epsilon,0.5/epsilon)--(epsilon,0),p);
label(pic2,"$\small -\epsilon$",(-epsilon-0.4,-0.3));
label(pic2,"$\small \epsilon$",( epsilon,-0.3));
label(pic2,"$\frac{1}{2\epsilon}$",( 0,0.5/epsilon) + (.45,.6));

add(shift(6,0)*pic2);

// pic2
real epsilon=.125;


draw(pic3,Label("$t$",Relative(0.99)),            (-2,0)--(2,0),black+.6pt,Arrow(TeXHead));
draw(pic3,Label("$g_\epsilon(t)$",Relative(0.99)),(0,-.5)--(0,5),black+.6pt,Arrow(TeXHead));

draw(pic3,(0,0)--(0,5),black+1.2pt);
label(pic3,"$\delta(t)$",(.65,2.5));

add(shift(12,0)*pic3);

