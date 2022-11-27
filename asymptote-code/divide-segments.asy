import graph;
import markers;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

//add(shift(-1,-1)*grid(19,10,gray+0.2pt));

real a = 4;
real r = 5;
real r1 = 1.5;
real alpha=35;
real theta1=alpha-5;
real theta2=alpha+5;

pair A=(0,0);
pair B=(a,0);
pair C=r*dir(alpha);
pair D=3*r1*dir(alpha);
pair DB=D-B;
real dd=sqrt(DB.x^2+DB.y^2);

draw(A--B,blue+1.3pt);
draw(A--C,black+1pt);
draw(arc(A,r1,theta1,theta2),PenMargins);
draw(arc(A,2r1,theta1,theta2),PenMargins);
draw(arc(A,3r1,theta1,theta2),PenMargins);

draw(B--D,black+1pt);

//draw(arc(A,dd,0,360),PenMargins);
//draw(arc(B,3r1,0,360),PenMargins);

pair Ds []=intersectionpoints(arc(A,dd,0,360),arc(B,3r1,0,360));

draw(A--Ds[1],black+1pt);
draw(B--Ds[1],black+1pt);

pair XX=Ds[1];

real beta=degrees(atan2(abs(Ds[1].y),Ds[1].x));
real eta=180-degrees(atan2(abs(Ds[1].y),B.x-Ds[1].x));
draw(arc(A,dd,-beta+5,-beta-5),PenMargins);
draw(arc(B,3r1,-eta+5,-eta-5),PenMargins);

draw(arc(XX,r1,theta1,theta2),PenMargins);
draw(arc(XX,2r1,theta1,theta2),PenMargins);
draw(arc(XX,3r1,theta1,theta2),PenMargins);

draw(r1*dir(alpha)--XX+r1*dir(alpha),black+1pt);
draw(2r1*dir(alpha)--XX+2r1*dir(alpha),black+1pt);
draw(3r1*dir(alpha)--XX+3r1*dir(alpha),black+1pt);

draw(A--B,StickIntervalMarker(3,2,blue,dotframe(red)));

label("$A$",A+.2N);
label("$B$",B+.2E);
label("$C$",C+.2S);
label("$D$",XX+.2S);



