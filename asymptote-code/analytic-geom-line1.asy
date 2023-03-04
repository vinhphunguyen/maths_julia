import graph;
import markers;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

//add(shift(-4,-4)*grid(8,8,gray+0.4pt));

picture pic1, pic2;

draw(Label("${x}$",Relative(0.99)),(-1,0)--(4,0),black+1.pt,Arrow(TeXHead));
draw(Label("${y}$",Relative(0.99)),(0,-1)--(0,4),black+1.pt,Arrow(TeXHead));

pair O=(0,0);
pair A=(2,3);
pair B=(1.2,1.5*1.2);


markangle("$\alpha$",(1,0),O,A,Arrow,radius=5.5mm,Fill(orange));

pen p = gray+.8pt;

draw(A--(A.x,0),blue+.9pt);
draw(A--(0,A.y),blue+.9pt);
draw(B--(B.x,0),purple+.9pt);
draw(B--(0,B.y),purple+.9pt);
draw(O--A,black+.9pt);

label("$P(x_P,y_P)$",A+.4N,blue);
label("$Q(x,y)$",B+(-.47,.34),purple);
label("$O$",(-0.35,-0.35),red);
label("$H$",(B.x+.2,0.25),black);
label("$K$",(A.x+.2,0.25),black);

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelx1 = Label("$x$", position=EndPoint);
Label ticklabelx2 = Label("$x_P$", position=EndPoint);

Label ticklabely1 = Label("$y$", position=EndPoint);
Label ticklabely2 = Label("$y_P$", position=EndPoint);

pen pp = black+1.1pt;
draw((B.x,0), xtick, L=ticklabelx1, pp);
draw((2,0), xtick, L=ticklabelx2, pp);

draw((0,B.y), ytick, L=ticklabely1, pp);
draw((0,3), ytick, L=ticklabely2, pp);


dot(A,blue+4pt);
dot(B,purple+4pt);
dot((0,0),red+4pt);

