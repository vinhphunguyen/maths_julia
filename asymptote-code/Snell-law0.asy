import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf

real a = 2;
real b = 1.5;
real x = 1.8;
real dx = 1.;

real alpha1=degrees(atan(x/a));
real alpha2=degrees(atan(dx/b));

pair O=(0,0);
pair A=(-x,a);
pair B=(dx,-b);

pen p = black+1pt;
pen pr = red+1pt;
pen p2 = black+.6pt;

fill((-x-.4,0)--(dx+1,0)--(dx+1,a+.33)--(-x-.4,a+.33)--cycle,mediumgray);
fill((-x-.4,0)--(dx+1,0)--(dx+1,-b-.33)--(-x-.4,-b-.33)--cycle,lightyellow);

real r1=.5, r2=.5;
draw("$\alpha_1$",arc(O,r1,90,90+alpha1),PenMargins);
draw("$\alpha_2$",arc(O,r2,270,270+alpha2),PenMargins);

fill(O--r1*dir(90)--arc(O,r1,90,90+alpha1)--r1*dir(90+alpha1)--cycle,cyan);
fill(O--r2*dir(270)--arc(O,r2,270,270+alpha2)--r2*dir(270+alpha2)--cycle,orange);


draw((-x-.4,0)--(dx+1,0),pr);
draw((0,-b-0.2)--(0,a+0.3),p2);
draw(A--O--B,p);
draw(A--(0,A.y),p2);
draw(B--(0,B.y),p2);


Label L1=Label("$a$",align=O,MidPoint,Fill(mediumgray));
Label L2=Label("$b$",align=O,MidPoint,Fill(lightyellow));
Label L3=Label("$d$",align=O,MidPoint,Fill(lightyellow));
draw(L1,(A.x-0.2,0)--(A.x-0.2,A.y),Arrows(TeXHead),Bars);
draw(L2,(A.x-0.2,0)--(A.x-0.2,B.y),Arrows(TeXHead),Bars);
draw(L3,(A.x,B.y-0.2)--(B.x,B.y-.2),Arrows(TeXHead),Bars);

label("$v_1,$ air",(1.3,a/2));
label("$v_2,$ water",(1.3,-b/2));
label("boundary",(1,.23));
label("$A$",A+.2N);
label("$B$",B+.2E);
label("$O$",O+(-0.2,-0.2));

label(rotate(-90)*"normal",(0.2,1));

label("$x$",(-0.5x,A.y+.22));
label("$d-x$",(0.5dx-0.05,B.y+.22));

perpendicular((0,A.y),NW,(0,A.y)--(0,10));
perpendicular((0,0),NE,(0,0)--(10,0));
//perpendicular((0,B.y),NE,(0,B.y)--(0,10));

dot(A,black+4pt);
dot(B,black+4pt);