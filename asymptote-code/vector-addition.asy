import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(14cm, keepAspect=true);
defaultpen(fontsize(14pt));

//add(shift(-1,-1)*grid(19,10,gray+0.2pt));

picture pic1, pic2;

pair A = (0,0);
pair B = (3,2);
pair C = (2,4);
pair D = A+(C.x-B.x,C.y-B.y);

draw(A--B,blue+1.5pt,ArcArrow);
draw(B--C,blue+1.5pt,ArcArrow);
draw(A--C,red+1.5pt, ArcArrow);

label(pic1,"$A$",(-0.1,-0.1));
label(pic1,"$B$",B+(0.1,-0.));
label(pic1,"$C$",C+(0.1,0.1));

label(pic1,"$\overrightarrow{AB}$",0.5(A+B)+(0.1,-0.3));
label(pic1,"$\overrightarrow{BC}$",0.5(C+B)+(0.35,0.0));
label(pic1,"$\overrightarrow{AC}$",0.5(A+C)+(-0.35,0.0),red);

add(pic1);

// pic2

draw(pic2,A--B,blue+1.5pt,ArcArrow);
draw(pic2,B--C,blue+1.5pt,ArcArrow);
draw(pic2,A--C,red+1.5pt, ArcArrow);
draw(pic2,A--D,cyan+1.5pt, ArcArrow);
draw(pic2,D--C,cyan+1.5pt, ArcArrow);

label(pic2,"$A$",(-0.1,-0.1));
label(pic2,"$B$",B+(0.1,-0.));
label(pic2,"$C$",C+(0.1,0.1));

label(pic2,"$\bm{a}$",0.5(A+B)+(0.1,-0.3));
label(pic2,"$\bm{a}$",0.5(D+C)+(0.1,-0.3));
label(pic2,"$\bm{b}$",0.5(C+B)+(0.1,0.1));
label(pic2,"$\bm{b}$",0.5(A+D)+(0.1,0.1));
label(pic2,"$\bm{a}+\bm{b}$",0.5(A+C)+(0.4,0.0),red);
label(pic2,"$\bm{b}+\bm{a}$",0.5(A+C)+(-0.4,0.0),cyan);

add(shift(5,0)*pic2);
