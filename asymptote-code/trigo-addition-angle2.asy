import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic2, pic3;

real alpha=80;
real beta=25;

pair P=dir(alpha);
pair Q=dir(beta);
pair O=(0,0);

// pic 2
draw(pic2,arc(O,1,-10,100),black+1.pt);



draw(pic2,O--P,black+1.pt);
draw(pic2,O--Q,black+1.pt);
draw(pic2,P--Q,red+1.pt);
draw(pic2,O--(1,0),black+1.pt);


draw(pic2,Label("$\alpha$",MidPoint,Fill(white)),arc(O,0.26,0,alpha),black+1.pt);
draw(pic2,Label("$\beta$",MidPoint,Fill(white)),arc(O,0.45,0,beta),blue+1.pt);
draw(pic2,Label("$\alpha-\beta$",MidPoint,Fill(white)),arc(O,0.6,alpha,beta),red+1.pt);

label(pic2,"$P(\cos\alpha,\sin\alpha)$",P+(0.6,0.12),blue);
label(pic2,"$Q(\cos\beta,\sin\beta)$",Q+(0.56,0.2),blue);

dot(pic2,P,blue+4pt);
dot(pic2,Q,blue+4pt);


draw(pic2,Label("$x$",Relative(0.99)),(-.2,0)--(1.2,0),black+1.pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.2)--(0,1.2),black+1.pt,Arrow(TeXHead));


// pic3

draw(pic3,arc(O,1,0,100),black+1.pt);

pair P=dir(alpha-beta);

draw(pic3,O--P,black+1.pt);
draw(pic3,P--(1,0),red+1.pt);

draw(pic3,Label("$x$",Relative(0.99)),(-.2,0)--(1.2,0),black+1.pt,Arrow(TeXHead));
draw(pic3,Label("$y$",Relative(0.99)),(0,-.2)--(0,1.2),black+1.pt,Arrow(TeXHead));

draw(pic3,Label("$\alpha-\beta$",MidPoint,Fill(white)),arc(O,0.27,0,alpha-beta),red+1.2pt);

label(pic3,"$P(\cos(\alpha-\beta),\sin(\alpha-\beta))$",P+(0.4,0.25),blue);
label(pic3,"$Q(1,0)$",(1.2,-0.21),blue);
label(pic3,"$d$",(.78,0.28),red);
label(pic2,"$d$",(.6,0.54),red);

dot(pic3,P,blue+4pt);
dot(pic3,(1,0),blue+4pt);

add(shift(2.7,0)*pic3);
add(pic2);
