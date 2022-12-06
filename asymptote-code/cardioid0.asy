import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2; 

// axes

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

label("$O_1$",O1+.23S);
label("$O_2$",O2+.23S);
label("$P$",P1+(-0.14,-0.18),red);
label("$P'$",Xx+(.2,-0.19),red);

draw("$\omega$",arc(O2,1.2,20,60),Arrow,PenMargins);

dot(pic1,O1,pdot);
dot(pic1,O2,pdot);
dot(pic1,P1,pdotr);
dot(pic1,Xx,pdotr);

pair F(real t) {
    real a = 1.;
    return ( a*(2*cos(t) - cos(2t)), a*(2*sin(t) - sin(2t)) );
}


path g = graph(F, 0, 6*pi,n=200);
draw(g, red+1.2pt);


add(pic1);







