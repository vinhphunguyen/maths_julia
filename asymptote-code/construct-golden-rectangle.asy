import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p = black + 1pt;
pen pg = gray + .7pt;

real Phi=0.5(1+sqrt(5));

draw(unitsquare,p);

pair A = (0,0);
pair B = (1,0);
pair C = (1,1);
pair D = (0,1);
pair M = (.5,0);
pair M1 = (Phi,0);

draw(M--C,pg);
draw(line(A,B),pg);
draw(arc(M,length(M-C),-10,10),pg);
pair P=(Phi,1);
draw(M1--P--C,p);
draw(arc(M1,length(M1-B),90,180),pg);
pair Q=(Phi,1/Phi);
pair Q1=(Phi-1/Phi^2,1/Phi);
draw(Q--(1,Q.y),p);
draw(Q1--(Q1.x,1),p);
draw(arc(Q,length(Q-P),90,180),pg);
draw(arc(C,length(C-(Q1.x,1)),270,360),pg);
draw(A--M1,p);

pair[] intersectionPoint = intersectionpoints(line(B,C),circle(C,length(C-(Q1.x,1))));
pair x=intersectionPoint[2];
draw(x--(Q1.x,x.y),p);

label("$A$",A+.1S);
label("$B$",B+.1S);
label("$C$",C+.1N);
label("$D$",D+.1N);
label("$M$",M+.1S);
label("$E$",M1+.1SE);
label("$F$",P+.1N);
label("$H$",Q+.1E);
label("$G$",(1,Q.y)+.1W);
label("$P$",Q1+.1S);
label("$Q$",(Q1.x,1)+.1N);

label("$1$", (-0.1,0.5) );
label("$1$", (0.5,1.1) );
label("$\sqrt{5}/2$", 0.5(M+C)+.17W );
label("$1/\phi$", 0.5(B+M1)+.1S );
label("$1/\phi$", 0.5(Q+M1)+.13E );
label("$1/\phi^2$", 0.5(P+Q)+.15E );

dot(A,blue+4pt);
dot(B,blue+4pt);
dot(C,blue+4pt);
dot(D,blue+4pt);
dot(M,blue+4pt);
dot(P,blue+4pt);
dot(Q,blue+4pt);
dot(Q1,blue+4pt);
dot((Q1.x,1),blue+4pt);
dot(M1,blue+4pt);
dot((1,Q.y),blue+4pt);

