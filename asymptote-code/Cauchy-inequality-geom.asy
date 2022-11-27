import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(16cm); // size of the image
defaultpen(fontsize(14pt));

picture pic1, pic2;

real a = 1;
real c = 3;
real b = 2;
real d = 1;

pair A=(0,0); // location of the mass m1
pair B=(a+c,0); // location of the mass m2
pair C=(a+c,b+d); // location of the mass m3
pair D=(0,b+d); // location of the mass m3
pair Ee=(a,0); // location of the mass m3
pair F=(a+c,d); // location of the mass m3
pair G=(c,b+d); // location of the mass m3
pair H=(0,b); // location of the mass m3

//perpendicular((0,0),NE,(0,0)--(1,0),blue);

filldraw(pic1,A--Ee--H-- cycle,orange);
filldraw(pic1,F--C--G-- cycle, orange);
filldraw(pic1,Ee--B--F-- cycle, green);
filldraw(pic1,H--G--D-- cycle, green);

draw(pic1,A--Ee--H-- cycle,black+1pt);
draw(pic1,F--C--G-- cycle, black+1pt);
draw(pic1,Ee--B--F-- cycle, black+1pt);
draw(pic1,H--G--D-- cycle, black+1pt);

//fill(F--G--H--Ee-- cycle, mediumgray);


//draw(F--G--H--Ee--cycle,black+1.01pt);

pair O=(0,0);

Label La=Label("$a$",align=O,MidPoint,Fill(white));
Label Lb=Label("$b$",align=O,MidPoint,Fill(white));
Label Lc=Label("$c$",align=O,MidPoint,Fill(white));
Label Ld=Label("$d$",align=O,MidPoint,Fill(white));

real dx=0.2;

draw(pic1, La,(A.x,A.y-dx)--(Ee.x,Ee.y-dx),Arrows(TeXHead),Bars);
draw(pic1, Lc,(Ee.x,Ee.y-dx)--(B.x,B.y-dx),Arrows(TeXHead),Bars);
draw(pic1, Lc,(D.x,D.y+dx)--(G.x,G.y+dx),Arrows(TeXHead),Bars);
draw(pic1, La,(G.x,G.y+dx)--(C.x,C.y+dx),Arrows(TeXHead),Bars);
draw(pic1, Lb,(A.x-dx,A.y)--(H.x-dx,H.y),Arrows(TeXHead),Bars);
draw(pic1, Ld,(H.x-dx,H.y)--(D.x-dx,D.y),Arrows(TeXHead),Bars);
draw(pic1, Ld,(B.x+dx,B.y)--(F.x+dx,F.y),Arrows(TeXHead),Bars);
draw(pic1, Lb,(F.x+dx,F.y)--(C.x+dx,C.y),Arrows(TeXHead),Bars);

label("$A$",(.1,.1));
label("$B$",(a+c-.1,.1));
label("$C$",(a+c-.1,b+d-.1));
label("$D$",(.1,b+d-.1));
label("$E$",(a,.2));
label("$F$",(a+c-.18,d+.06));
label("$G$",(c,b+d-.24));
label("$H$",(.2,b-.06));

real theta=-degrees(atan(b/a));
real beta=degrees(atan(d/c));
Label L1=Label("$\sqrt{a^2+b^2}$",align=(0,0),MidPoint);
Label L2=Label("$\sqrt{c^2+d^2}$",align=(0,0),MidPoint);
label(pic1, rotate(theta)*L1,(a/2+.2,b/2));
label(pic1, rotate(beta)*L2,(a+c/2-.1,b/2-.3));

//real theta=degrees(atan2(2,1));
//draw("$\alpha$",arc((2,0),0.3,0,theta),PenMargins);
//draw("$\alpha$",arc((0,1),0.3,270,270+theta),PenMargins);

add(pic1);

// pic2

pair A=(0,0);
pair B=(2,0);
pair C=(3,2);
pair D=(1,2);

fill(pic2,A--B--D--cycle,mediumgray);

draw(pic2,A--B--C--D--cycle,black+1pt);
draw(pic2,B--D,black+1pt);
draw(pic2,D--(D.x,0),black+1pt);

Label Ly=Label("$y$",align=A,MidPoint,Fill(white));
Label Lx=Label("$x$",align=A,MidPoint,Fill(white));
real y = -0.5;
real theta=degrees(atan(D.y/D.x));
draw(pic2,Lx,(0,y)--(B.x,y),Arrows(TeXHead),Bars);
draw(pic2,Ly,(C.x+.2,0)--(C.x+.2,C.y),Arrows(TeXHead),Bars);
draw(pic2,"$\alpha$",arc(A,0.25,0,theta),PenMargins);

label(pic2, "$A=xy\sin\alpha$",(2,1.4));
label(pic2, "$h$",(1.1,1.));

add(shift(5,0.5)*pic2);
