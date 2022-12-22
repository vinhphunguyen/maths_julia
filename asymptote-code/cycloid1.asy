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
pen pd =  black + dashed+ 1.0pt;
pen pb =  blue + 1.0pt;
pen pdot =  blue + 3.0pt;
pen pdotr =  red + 4.0pt;

real xxx=pi/2.4;

pair O1=(0,1);
pair O2=(xxx,1);
pair A =(0,0);
pair B =(0,2);
pair B1 =(xxx,0);
pair A1 =(xxx-sin(xxx),1-cos(xxx));
pair Ax=(-1,0);
pair Bx=(pi+.4,0);

draw(pic1,shift(0,1)*unitcircle,pd);
draw(pic1,shift(xxx,1)*unitcircle,p);

draw(pic1,Label("$x$",Relative(0.99)),Ax--Bx,p,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),A--B+.4N,p,Arrow(TeXHead));

draw("$\theta$",arc(O2,0.3,-90,-90-degrees(xxx)),ArcArrow,PenMargins);

draw(pic1,A--O1,p);
draw(pic1,A1--O2,p);
draw(pic1,B1--O2,p);

label("$O$",O1+.23W);
label("$O$",O2+.23E);
label("$A$",A+.23S);
label("$A$",A1+.23W);
label("$B$",B1+.23S);
label("$a$", (-0.2,0.5) );

label("cycloid", (2.4,2.2), red );

draw(arc(O1,1.3,150,120),Arrow,PenMargins);

real yy=-0.4;
Label L2=Label("$a\theta $",align=(0,0),MidPoint,Fill(white));
draw(L2,(A.x,yy)--(O2.x,yy),Arrows(TeXHead),Bars);

dot(pic1,O1,pdot);
dot(pic1,O2,pdot);
dot(pic1,A,pdotr);
dot(pic1,A1,pdotr);
dot(pic1,B1,pdot);

pair F(real t) {
    real a = 1.;
    return ( a*(t - sin(t)), a*(1 - cos(t)) );
}


path g = graph(F, 0, pi,n=200);
draw(g, red+1.2pt);

real xxx=pi/3;
real bb=0.5;
real aa=2.5;
pair O2=(xxx+aa,1+bb);
pair B1 =(xxx+aa,0+bb);
pair A1 =(xxx-sin(xxx)+aa,1-cos(xxx)+bb);

draw("$\theta$",arc(O2,0.3,-90,-90-degrees(xxx)),ArcArrow,PenMargins);

label("$O$",O2+.23E);
label("$A$",A1+.23W);
label("$B$",B1+.23S);
label("$a$",0.5(A1+O2)+.23N);
label("$a\sin\theta$",0.5(A1+(B1.x,A1.y))+.23S);

//draw(pic1,A--O1,p);
draw(pic1,A1--O2,p);
draw(pic1,B1--O2,p);
draw(pic1,A1--(B1.x,A1.y),p);

add(pic1);







