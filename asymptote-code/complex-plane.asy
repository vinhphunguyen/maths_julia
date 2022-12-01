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

//add(shift(-3,-3)*grid(6,6,gray+0.6pt));

picture pic1, pic2;

draw(pic1,Label("$\text{Re}$",Relative(0.99)),(-3.5,0)--(3.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$\text{Im}$",Relative(0.99)),(0,-3.5)--(0,3.5),black+1.2pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(1,2);
pair B=(-2,-1);

draw(O--A,black+1.5pt);
draw(O--B,black+1.5pt);

pen p = gray+.8pt;
draw(A--(A.x,0),p);
draw(A--(0,A.y),p);
draw(B--(B.x,0),p);
draw(B--(0,B.y),p);

label("$P(1+2i)$",(1,2.3),black);
label("$Q(-2-i)$",(-2,-1.3),black);

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelx1 = Label("$1$", position=EndPoint);
Label ticklabelx1m = Label("$-1$", position=EndPoint);
Label ticklabelx2 = Label("$2$", position=EndPoint);
Label ticklabelx2m = Label("$-2$", position=EndPoint);
Label ticklabelx3 = Label("$3$", position=EndPoint);
Label ticklabelx3m = Label("$-3$", position=EndPoint);

Label ticklabely1 = Label("$i$", position=EndPoint);
Label ticklabely2 = Label("$2i$", position=EndPoint);
Label ticklabely3 = Label("$3i$", position=EndPoint);
Label ticklabely1m = Label("$-i$", position=EndPoint);
Label ticklabely2m = Label("$-2i$", position=EndPoint);
Label ticklabely3m = Label("$-3i$", position=EndPoint);
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

dot((1,2),black+6pt);
dot((-2,-1),black+6pt);

add(pic1);
