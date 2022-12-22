import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(11cm, keepAspect=true);
defaultpen(fontsize(16pt));

add(shift(-4,-4)*grid(8,8,gray+0.4pt));

picture pic1, pic2;

draw(Label("$\text{x}$",Relative(0.99)),(-4,0)--(4,0),black+1.4pt,Arrow(TeXHead));
draw(Label("$\text{y}$",Relative(0.99)),(0,-4)--(0,4),black+1.4pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(2,3);
pair B=(-2,-2);

pen p = gray+.8pt;

draw(A--(A.x,0),blue+.9pt);
draw(A--(0,A.y),blue+.9pt);
draw(B--(B.x,0),purple+.9pt);
draw(B--(0,B.y),purple+.9pt);

label("$P(2,3)$",A+.4N,blue);
label("$Q(-2,-2)$",B+.4S,purple);
label("$(0,0)$",(0.5,0.35),red);

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelx1 = Label("$1$", position=EndPoint);
Label ticklabelx1m = Label("$-1$", position=EndPoint);
Label ticklabelx2 = Label("$2$", position=EndPoint);
Label ticklabelx2m = Label("$-2$", position=EndPoint);
Label ticklabelx3 = Label("$3$", position=EndPoint);
Label ticklabelx3m = Label("$-3$", position=EndPoint);

Label ticklabely1 = Label("$1$", position=EndPoint);
Label ticklabely2 = Label("$2$", position=EndPoint);
Label ticklabely3 = Label("$3$", position=EndPoint);
Label ticklabely1m = Label("$-1$", position=EndPoint);
Label ticklabely2m = Label("$-2$", position=EndPoint);
Label ticklabely3m = Label("$-3$", position=EndPoint);
pen pp = black+1.1pt;
draw((1,0), xtick, L=ticklabelx1, pp);
draw((2,0), xtick, L=ticklabelx2, pp);
draw((3,0), xtick, L=ticklabelx3, pp);
draw((-3,0), xtick, L=ticklabelx3m,pp);
draw((-2,0), xtick, L=ticklabelx2m,pp);
draw((-1,0), xtick, L=ticklabelx1m,pp);

draw((0,1), ytick, L=ticklabely1, pp);
draw((0,2), ytick, L=ticklabely2, pp);
draw((0,3), ytick, L=ticklabely3, pp);
draw((0,-3), ytick, L=ticklabely3m, pp);
draw((0,-2), ytick, L=ticklabely2m, pp);
draw((0,-1), ytick, L=ticklabely1m, pp);

dot(A,blue+6pt);
dot(B,purple+6pt);

dot((0,0),red+6pt);

