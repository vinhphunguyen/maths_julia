import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p = black+1pt;
pen p1 = black+.7pt;

real r=0.6;
pair O=(0,0);
pair A=r*dir(180+10);
pair C=r*dir(30);
pair B=r*dir(-10);
pair D=r*dir(90+10);
pair CD=C-D;
pair AB=B-A;



pair F1(real t) {
    return ( D.x+CD.x*t, D.y +CD.y*t );
}

pair F2(real t) {
    return ( A.x+AB.x*t, A.y +AB.y*t );
}

path g1 = graph(F1, 0, 6*pi,n=200);
path g2 = graph(F2, 0, 6*pi,n=200);



//fill(A--P--C--cycle,mediumgray);
//fill(P--B--D--cycle,cyan);
pair Ds []=intersectionpoints(g2,g1);
pair P = Ds[0];


markangle("$\alpha$",B,D,C,n=1,radius=7mm,Fill(orange));
markangle("$\alpha$",B,A,C,n=1,radius=7mm,Fill(orange));
markangle("$\beta$",D,P,A,n=2,radius=7mm,Fill(yellow));

draw(circle(O,r),p);


draw(A--B,p);
draw(D--C,p);
draw(D--B,p);
draw(A--C,p);
draw(P--C,p);
draw(P--B,p);

pen pdot=blue+3pt;

label("$A$",A+(-.1,-.1));
label("$B$",B+.15SE);
label("$C$",C+.14N);
label("$D$",D+.1N);
label("$P$",P+.15E);

dot(A,pdot);
dot(B,pdot);
dot(C,pdot);
dot(D,pdot);
dot(P,pdot);
