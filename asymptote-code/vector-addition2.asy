import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(14cm, keepAspect=true);
defaultpen(fontsize(16pt));

//add(shift(-1,-1)*grid(19,10,gray+0.2pt));

picture pic1, pic2;

pair A = (0,0);
pair B = (3,2);
pair C = (2,4);
pair D = (1,5);
pair G = (-1,3);


draw(pic2,A--B,blue+1.5pt,ArcArrow);
draw(pic2,B--C,blue+1.5pt,ArcArrow);
draw(pic2,C--D,blue+1.5pt,ArcArrow);
draw(pic2,D--G,blue+1.5pt,ArcArrow);


draw(pic2,A--C,cyan+1.5pt, ArcArrow);
draw(pic2,A--D,green+1.5pt, ArcArrow);
draw(pic2,A--G,red+1.5pt, ArcArrow);

label(pic2,"$A$",(-0.1,-0.1));
label(pic2,"$B$",B+(0.1,-0.));
label(pic2,"$C$",C+(0.1,0.1));

label(pic2,"$\bm{a}$",0.5(A+B)+(0.1,-0.3));
label(pic2,"$\bm{b}$",0.5(C+B)+(0.1,0.1));
label(pic2,"$\bm{c}$",0.5(C+D)+(0.1,0.1));
label(pic2,"$\bm{d}$",0.5(G+D)+(0.0,0.3));

label(pic2,rotate(degrees(atan(C.y/C.x)))*"$\bm{a}+\bm{b}$",0.5(A+C)+(0.2,0.0),cyan);
label(pic2,rotate(degrees(atan(D.y/D.x)))*"$\bm{a}+\bm{b}+\bm{c}$",0.5(A+C)+(-0.4,0.0),green);
label(pic2,rotate(degrees(atan(G.y/G.x)))*"$\bm{a}+\bm{b}+\bm{c}+\bm{d}$",0.5(A+G)+(-0.2,0.0),red);

add(pic2);
