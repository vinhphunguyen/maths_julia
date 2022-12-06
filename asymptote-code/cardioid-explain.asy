import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(14cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2; 

// axes

draw(pic1,Label("$x$",Relative(0.99)),(0,0)--(3.5,0),black+.9pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(0,2.8),black+.9pt,Arrow(TeXHead));


real rr=1/sqrt(2);

pen p =  black + 1.0pt;
pen pb =  blue + 1.0pt;
pen pr =  red + 1.0pt;
pen pp1 = dashed + black + .7pt;
pen pp = blue + black + 1.0pt;
pen pdot = black + 4pt;
pen pdotr = red + 4pt;

real alphar=pi/4;
real alpha=degrees(alphar);

pair O1=(0,0);
pair O2=(2,0);
pair P1=(1,0);
pair P2=(3,0);

pair Q=(cos(alphar),sin(alphar));
pair O3=(2cos(alphar),2sin(alphar));

pair P = (O2.x-cos(alphar),O2.y+sin(alphar));
pair Xx = O3 + rotate(alpha)*(-cos(alphar),-sin(alphar));

draw(pic1,unitcircle,p);
draw(pic1,shift(2,0)*unitcircle,pp1);
draw(pic1,arc(O3,1,0,360),pp);

draw(pic1,O1--O2,p);
draw(pic1,O1--O3,p);
draw(pic1,O2--P,p);
draw(pic1,O3--Xx,p);

label("$O_1$",O1+.18S);
label("$O_2$",O2+.18S);
label("$O_3$",O3+.18N);

label("$a$",(.3,.5));

label("$Q$",P+.18N);
label("$Q'$",Q+.21N);

label("$P$",P1+(-0.14,-0.18),red);
label("$P'$",Xx+(-0.,-0.19),red);

draw("$\alpha$",arc(O1,0.25,0,alpha),PenMargins);
draw("$\alpha$",arc(O2,0.25,180-alpha,180),PenMargins);
draw("$\alpha$",arc(O3,0.33,-90,-90-alpha),PenMargins);

draw("$\omega$",arc(O2,1.2,20,40),Arrow,PenMargins);

dot(pic1,O1,pdot);
dot(pic1,O2,pdot);
dot(pic1,O3,pdot);
dot(pic1,P,pdot);
dot(pic1,Q,pdot);
dot(pic1,P1,pdotr);
dot(pic1,Xx,pdotr);


label(pic1,"$a)$",(1,2.8));

add(pic1);



draw(pic2,Label("$x$",Relative(0.99)),(0,0)--(3,0),black+.9pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,0)--(0,2.8),black+.9pt,Arrow(TeXHead));

draw(pic2,O1--O3,p);

draw(pic2,O3--(O3.x+0.4,O3.y+0),pb,Arrow(TeXHead));
draw(pic2,O3--(0+O3.x,O3.y+0.4),pb,Arrow(TeXHead));

draw(pic2,O3--O3+0.5dir(45),pr,Arrow(TeXHead));
draw(pic2,O3--O3+0.5dir(45+90),pr,Arrow(TeXHead));

draw(pic2,arc(O3,1,0,360),pp);

label(pic2,"$O_1$",O1+.18S);
label(pic2,"$O_3$",O3+(.1,-0.2));

label(pic2,"$b)$",(1,2.8));

draw(pic2,"$\alpha$",arc(O1,0.25,0,alpha),PenMargins);
draw(pic2,"$\alpha$",arc(O3,0.25,0,alpha),PenMargins);

dot(pic2,O1,pdot);
dot(pic2,O3,pdot);

add(shift(4,0)*pic2);



