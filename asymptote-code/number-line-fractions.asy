import graph;
import markers;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2;

draw(pic1,(-3.1,0)--(3.1,0),black+1pt);

path xtick = (0,0.15cm) -- (0,-0.15cm);

Label ticklabel0 = Label("$0$", position=EndPoint);
Label ticklabel1 = Label("$1$", position=EndPoint);
Label ticklabel2 = Label("$2$", position=EndPoint);
Label ticklabel3 = Label("$3$", position=EndPoint);
Label ticklabel11 = Label("$-1$", position=EndPoint);
Label ticklabel22 = Label("$-2$", position=EndPoint);
Label ticklabel33 = Label("$-3$", position=EndPoint);

draw((0,0), xtick, L=ticklabel0, black+.9pt);
draw((1,0), xtick, L=ticklabel1, black+.9pt);
draw((2,0), xtick, L=ticklabel2, black+.9pt);
draw((3,0), xtick, L=ticklabel3, black+.9pt);
draw((-1,0), xtick, L=ticklabel11, black+.9pt);
draw((-2,0), xtick, L=ticklabel22, black+.9pt);
draw((-3,0), xtick, L=ticklabel33, black+.9pt);

draw(pic1,shift(.5,0)*unitcircle,red+1.2pt);

add(pic1);

draw(pic2,(0,0)--(4,0),red+1pt);

draw(pic2, (0,-0.08)--(0,0.08), red+.9pt);
label(pic2, "$0$", (0,-0.25), red+.9pt);
label(pic2, "$1$", (4,-0.25), red+.9pt);
label(pic2, "$1/2$", (2,-0.25), red+.9pt);
label(pic2, "$1/4$", (1,-0.25), red+.9pt);
label(pic2, "$1/8$", (1/2,-0.25), red+.9pt);

draw(pic2, (0.25,-0.08)--(0.25,0.08), black+.9pt);
draw(pic2, (0.5,-0.08)--(0.5,0.08), red+.9pt);
draw(pic2, (1.5,-0.08)--(1.5,0.08), red+.9pt);
draw(pic2, (1,-0.08)--(1,0.08), red+.9pt); // 1/4
draw(pic2, (2,-0.08)--(2,0.08), red+.9pt); // 1/2
draw(pic2, (3,-0.08)--(3,0.08), red+.9pt); // 1/2
draw(pic2, (4,-0.08)--(4,0.08), red+.9pt);

add(shift(-1,2)*pic2);

