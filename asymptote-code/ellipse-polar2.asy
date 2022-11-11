import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(11cm, keepAspect=true);


real a = 2.;
real b = 1.8;
real c = sqrt(a^2-b^2);

real t = 0.5;

pair F(real t) {
    return ( a*cos(t), b*sin(t) );
}

pair P=F(t);

path g = graph(F, 0, 2*pi,n=200);
draw(g,red+1.2pt);

dot(P,black+5pt);
dot((0,0),black+5pt);
dot((c,0),black+5pt);

label("$F$",(c-.2,-.2),blue);
label("$P(x,y)$",P+(0.2,.4),black);
label("$r$",(c+0.2,.4),black);
label("$E$",(a+0.6,P.y),black);
label("center",(0.,.2),black);

dot((-a,0),red+3pt);
dot((a,0),red+3pt);

label("$A_1$",(a+.2,0.2),red);
label("$A_2$",(-a-.2,0.2),red);

draw(P--(c,0),black+1pt);
draw(P--(a+.5,P.y),black+1pt);

real beta=atan2(P.y,P.x-c);

Label Lc=Label("$c$",align=(0,0),MidPoint,Fill(white));
Label Ld=Label("$d$",align=(0,0),MidPoint,Fill(white));
Label La=Label("$a$",align=(0,0),MidPoint,Fill(white));
Label Lac=Label("$a-c$",align=(0,0),MidPoint,Fill(white));

draw(Lc,(0,-.5)--(c,-.5),Arrows(TeXHead),Bars);
draw(Lac,(c,-.5)--(a,-.5),Arrows(TeXHead),Bars);
draw(La,(-a,-.5)--(0,-.5),Arrows(TeXHead),Bars);
draw(Ld,(c,1.9)--(a+.5,1.9),Arrows(TeXHead),Bars);

perpendicular((a+.5,P.y),NW,blue);

draw("$\theta$",arc((c,0),0.35,0,degrees(beta)),PenMargins);

draw(Label("$x$",Relative(0.99)),(-1.9,0)--(a+1.5,0),black+1pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(c,-b-.5)--(c,b+.5),black+1pt,Arrow(TeXHead));
draw(Label("directrix",Relative(0.99)),(a+0.5,-1.8)--(a+.5,2.0),blue+1pt);
