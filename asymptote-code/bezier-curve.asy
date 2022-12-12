import graph;
import geometry;
import gsl;
import BezierLib;

usepackage("amsmath");
usepackage("mtpro2");

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


picture pic1, pic2;

add(shift(0,0)*grid(4,3,gray+0.3pt));


draw(pic1,Label("$x$",Relative(0.99)),(0,0)--(4.2,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(0,3),black+.6pt,Arrow(TeXHead));

pair[] P={(0,0),(2,2),(4,0)};
pair[] P12={P[0],P[1]};
pair[] P23={P[1],P[2]};


pair F(real t){return Bezier(P,t);}
pair F12(real t){return Bezier(P12,t);}
pair F23(real t){return Bezier(P23,t);}

pair P1 = P[0];
pair P2 = P[1];
pair P3 = P[2];

real t = 1;
pair P12=F12(t);
pair P23=F23(t);
pair[] Q={P12,P23};
pair F123(real t){return Bezier(Q,t);}

pair Q=F123(t);

draw(pic1, graph(F,0,t,350),red+.9pt);

pen p= black+1pt;
pen ptt= black+1.3pt;
pen pp= black+1pt;

label(pic1,"$P_1$",P1+(0,-0.25));
label(pic1,"$P_2$",P2+(0,0.25));
label(pic1,"$P_3$",P3+(0,0.25));
//label(pic1,"$P_{12}$",P12+(-0.1,0.25));
//label(pic1,"$P_{23}$",P23+(0,0.25));
//label(pic1,"$Q$",Q+(0,-0.25));

draw(pic1,P1--P2--P3, p);
draw(pic1,P12--P23, pp);

dot(pic1,P1,red+5pt);
dot(pic1,P2,red+5pt);
dot(pic1,P3,red+5pt);

//dot(pic1,P12,blue+5pt);
//dot(pic1,P23,blue+5pt);

//dot(pic1,Q,orange+5pt);

add(pic1);

// pic2





