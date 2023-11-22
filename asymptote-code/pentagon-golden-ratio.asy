import graph;
import geometry;
import markers;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(14cm, keepAspect=true);
defaultpen(fontsize(14pt));

picture pic1, pic2;


// pic2

real theta  = pi/5;
real thetad = degrees(theta);
real alphad = 90-degrees(2pi/5);
real rad    = 0.5/cos(theta);

pair O = (0,0);
pair A = rad*dir(alphad);
pair B = rad*dir(alphad+degrees(2pi/5));
pair C = rad*dir(alphad+2degrees(2pi/5));
pair D = rad*dir(alphad+3degrees(2pi/5));
pair Ee = rad*dir(alphad+4degrees(2pi/5));

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

pen p = black+1.pt;
pen p1 = red+1.pt;
pen p2 = gray+.7pt;
draw(pic2,scale(rad)*unitcircle,p);
draw(pic2,scale(rad)*polygon(5),p1);

draw(pic2,A--C,p);
draw(pic2,Ee--C,p);
draw(pic2,O--A,p2);
draw(pic2,O--C,p2);
draw(pic2,O--Ee,p2);

label(pic2,"$O$",O+.1N);
label(pic2,"$A$",A+.1E);
label(pic2,"$B$",B+.1N);
label(pic2,"$C$",C+.1W);
label(pic2,"$D$",D+.1W);
label(pic2,"$E$",Ee+.1E);
label(pic2,"$1$",0.5(A+B)+.1E);
label(pic2,"$1$",0.5(C+B)+.1N);
label(pic2,"$d$",0.5(A+C)+.1N);
label(pic2,"$d$",0.5(Ee+C)+.1S);

label(pic2,"$a)$",(-.6,-0.6));
label(pic1,"$b)$",(-.6,-0.6));

//perpendicular(pic2,(1,0),NE,(1,0)--(2,0),blue);

dot(pic2,O,black+5pt);
dot(pic2,A,black+5pt);
dot(pic2,B,black+5pt);
dot(pic2,C,black+5pt);
dot(pic2,D,black+5pt);
dot(pic2,Ee,black+5pt);

add(pic2);

// pic1

pair H=extension( A,D,C,Ee );

fill(pic1,H--A--C--cycle,pink);
fill(pic1,H--D--Ee--cycle,cyan);


markangle(pic1,"$\alpha$",Ee,C,A,n=1,radius=4mm,Fill(orange));
markangle(pic1,"$\alpha$",Ee,D,A,n=1,radius=4mm,Fill(orange));
markangle(pic1,"$\beta$",D,H,Ee,n=2,radius=4mm,Fill(yellow));
markangle(pic1,"$\beta$",A,H,C,n=2,radius=4mm,Fill(yellow));

draw(pic1,scale(rad)*unitcircle,p);
draw(pic1,scale(rad)*polygon(5),p1);

draw(pic1,A--C,p);
draw(pic1,Ee--C,p);
draw(pic1,D--A,p);

label(pic1,"$A$",A+.1E);
label(pic1,"$B$",B+.1N);
label(pic1,"$C$",C+.1W);
label(pic1,"$D$",D+.1W);
label(pic1,"$E$",Ee+.1E);
label(pic1,"$H$",H+.13W);
label(pic1,"$d$",0.5(A+C)+.1N);
label(pic1,"$1$",0.5(Ee+D)+.05S);
label(pic1,"$1$",0.5(C+H)+.09S);
label(pic1,"$1/d$",0.5(Ee+H)+(.12,.05));


//perpendicular(pic2,(1,0),NE,(1,0)--(2,0),blue);

dot(pic1,A,black+5pt);
dot(pic1,B,black+5pt);
dot(pic1,C,black+5pt);
dot(pic1,D,black+5pt);
dot(pic1,Ee,black+5pt);

add(shift(1.8,0)*pic1);
