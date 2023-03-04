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
pair A=(1.5,1.8);
pair B=(.8,(A.y/A.x)*.8);
pair A1=A+1*dir(degrees(atan2(A.y,A.x)));
pair B1=.4*dir(degrees(atan2(A.y,A.x)));


draw(Label("${x'}$",Relative(0.99)),B--B+(2,0),red+.8pt,Arrow(TeXHead));
draw(Label("${y'}$",Relative(0.99)),B--B+(0,2),red+.8pt,Arrow(TeXHead));

pen p = gray+.8pt;

markangle("$\alpha$",B+(1,0),B,A,n=1,radius=4mm,Fill(orange));

draw(A--(A.x,0),blue+.9pt);
draw(A--(0,A.y),blue+.9pt);
draw(B--(B.x,0),purple+.9pt);
draw(B--(0,B.y),purple+.9pt);
draw(B1--A1,black+.9pt);

label("$B$",A+.4N,blue);
label("$A$",B+(-.47,.34),purple);
label("$O$",(-0.35,-0.35),red);

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelx1 = Label("$x_A$", position=EndPoint);
Label ticklabelx2 = Label("$x_B$", position=EndPoint);

Label ticklabely1 = Label("$y_A$", position=EndPoint);
Label ticklabely2 = Label("$y_B$", position=EndPoint);

pen pp = black+1.1pt;
draw((B.x,0), xtick, L=ticklabelx1, pp);
draw((A.x,0), xtick, L=ticklabelx2, pp);

draw((0,B.y), ytick, L=ticklabely1, pp);
draw((0,A.y), ytick, L=ticklabely2, pp);


dot(A,blue+4pt);
dot(B,purple+4pt);
dot((0,0),red+4pt);

