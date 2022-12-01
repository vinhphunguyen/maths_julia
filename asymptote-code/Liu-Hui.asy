import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(11pt));

picture pic1, pic2;


// pic2

int n = 4;
real theta=degrees(2pi/n);
real thetad2=0.5theta;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

real factor=1/cos(pi/n);

real dd = 1 - sqrt(2)/2;

pair A=dir(0);
pair B=dir(45);
pair C=dir(90);
pair D=dir(90+45);
pair Ee=dir(90+2*45);
pair F=dir(90+3*45);
pair G=dir(90+4*45);
pair H=dir(90+5*45);
pair A1= A + dd*dir(45);
pair B1= C + dd*dir(45);

pair B2= C + dd*dir(45+90);
pair C1= Ee + dd*dir(45+90);

pair C2= Ee + dd*dir(-45-90);
pair D1= G + dd*dir(-45-90);

pair A2= A + dd*dir(-45);
pair D2= G + dd*dir(-45);

fill(pic2,A--B--C--cycle,orange);
fill(pic2,C--D--Ee--cycle,orange);
fill(pic2,Ee--F--G--cycle,orange);
fill(pic2,G--H--A--cycle,orange);
fill(pic2,rotate(45)*polygon(n),yellow);

fill(pic2,A--A1--B--cycle,mediumgray);
fill(pic2,B--B1--C--cycle,mediumgray);

fill(pic2,C--B2--D--cycle,mediumgray);
fill(pic2,D--C1--Ee--cycle,mediumgray);

fill(pic2,Ee--C2--F--cycle,mediumgray);
fill(pic2,G--D1--F--cycle,mediumgray);

fill(pic2,H--A--A2--cycle,mediumgray);
fill(pic2,H--D2--G--cycle,mediumgray);

pen p =black+1.pt;
draw(pic2,unitcircle,p);
draw(pic2,rotate(45)*polygon(n),p);
draw(pic2,rotate(360/16)*polygon(2n),p);

draw(pic2,A1--B1,p);
draw(pic2,A1--A,p);
draw(pic2,C--B1,p);
draw(pic2,C--B2--C1--Ee,p);
draw(pic2,Ee--C2--F--G--D1--F,p);
draw(pic2,H--A--A2--H--D2--G,p);

label(pic2,"$O$",(-0.1,0));
label(pic2,"$A$",A+(0.1,0));
label(pic2,"$B$",C+(0,0.1));
label(pic2,"$C$",Ee+(-0.1,0));
label(pic2,"$D$",G+(0,-0.1));

label(pic2,"$E$",B+(0.1,0));
label(pic2,"$F$",D+(-0.1,0.0));
label(pic2,"$G$",F+(-0.1,-0.1));
label(pic2,"$H$",H+(0.1,-0.1));

add(pic2);


