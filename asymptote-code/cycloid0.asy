import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2; 

// axes

pen p =  black + 1.0pt;
pen pb =  blue + 1.0pt;
pen pdot =  blue + 3.0pt;
pen pdotr =  red + 4.0pt;

real alphar=pi/4;
real alpha=degrees(alphar);

pair O1=(0,1);
pair O2=(pi,1);
pair O3=(2pi,1);

pair A =(0,0);
pair B =(0,2);
pair B1 =(pi,0);
pair B2 =(2pi,2);
pair A1 =(pi,2);
pair A2 =(2pi,0);
pair Ax=(-1,0);
pair Bx=(2pi+1,0);

draw(pic1,shift(0,1)*unitcircle,p);
draw(pic1,shift(pi,1)*unitcircle,p);
draw(pic1,shift(2pi,1)*unitcircle,p);

draw(pic1,Ax--Bx,p);
draw(pic1,A--O1,p);
draw(pic1,A1--O2,p);
draw(pic1,A2--O3,p);

label("$O$",O1+.23W);
label("$O$",O2+.23S);
label("$O$",O3+.23W);
label("$A$",A+.23S);
label("$A$",A1+.23N);
label("$A$",A2+.23S);
label("$B$",B2+.23N);
label("$B$",B1+.23S);
label("$B$",B+.23N);
label("$a$", (-0.2,0.5) );

draw(arc(O1,1.4,150,120),Arrow,PenMargins);

real yy=-0.7;
Label L1=Label("$2\pi a$",align=(0,0),MidPoint,Fill(white));
Label L2=Label("$\pi a$",align=(0,0),MidPoint,Fill(white));
draw(L2,(A.x,yy)--(A1.x,yy),Arrows(TeXHead),Bars);
draw(L1,(A.x,1.5yy)--(A2.x,1.5yy),Arrows(TeXHead),Bars);

dot(pic1,O1,pdot);
dot(pic1,A,pdotr);
dot(pic1,A1,pdotr);
dot(pic1,A2,pdotr);
dot(pic1,B,pdot);
dot(pic1,B1,pdot);
dot(pic1,B2,pdot);

pair F(real t) {
    real a = 1.;
    return ( a*(t - sin(t)), a*(1 - cos(t)) );
}


path g = graph(F, 0, 2pi,n=200);
draw(g, red+1.2pt);


add(pic1);







