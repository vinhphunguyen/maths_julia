import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);
defaultpen(fontsize(10pt));


picture pic1, pic2, pic3;

// pic 2

real alpha=20;
real r = 1;

pair O=(0,0);


real alpha1=20;
real alpha2=20+90;
real alpha3=180+45;
real alpha4=180+75;

draw(pic3,unitcircle,red+1.2pt);

pair A=dir(alpha2);
pair B=dir(alpha1);
pair C=dir(alpha3);

real r = 0.2;
pair B1 = r*dir(alpha1);
pair A1 = r*dir(alpha2);

path arc1 = arc((0,0),r,alpha1,alpha2);
path ang  = O--B1--arc1--A1--cycle;

fill(pic3,ang,mediumgray);
draw(pic3,ang);

real theta1 = degrees ( atan ( (B.y-C.y)/(B.x-C.x) ) );
real theta2 = degrees ( atan ( (A.y-C.y)/(A.x-C.x) ) );

pair C1= C + r*dir(theta1);
pair C2= C + r*dir(theta2);
path arc1 = arc(C,r,theta1,theta2);
path ang  = C--C1--arc1--C2--cycle;


fill(pic3,ang,cyan);
draw(pic3,ang);

draw(pic3,O--A,black+.8pt);
draw(pic3,O--B,black+.8pt);
draw(pic3,C--A,black+.8pt);
draw(pic3,C--B,black+.8pt);

label(pic3,"$O$",(0.02,-0.1),blue);
label(pic3,"$A$",A+(0.0,0.15),blue);
label(pic3,"$B$",B+(0.15,0.05),blue);
label(pic3,"$C$",C+(0.0,-0.2),blue);

label(pic3,"$2\alpha$",(0.09,0.35),blue);
label(pic3,"$\alpha$",C+(0.2,0.3),blue);

dot(pic3,A,blue+3pt);
dot(pic3,B,blue+3pt);
dot(pic3,C,blue+3pt);

add(pic3);

// pic

draw(pic2,unitcircle,red+1.2pt);

real theta1 = degrees ( atan ( (B.y-C.y)/(B.x-C.x) ) );
real theta2 = degrees ( atan ( (A.y-C.y)/(A.x-C.x) ) );

pair C1=dir(alpha4);


markangle(pic2,"$\alpha$",B,C,A,n=1,radius=4mm,Fill(orange));
markangle(pic2,"$\alpha$",B,C1,A,n=1,radius=4mm,Fill(orange));

draw(pic2,C--A,black+.8pt);
draw(pic2,C--B,black+.8pt);
draw(pic2,C1--A,black+.8pt);
draw(pic2,C1--B,black+.8pt);

label(pic2,"$O$",(0.1,0.18),blue);
label(pic2,"$A$",A+(0.0,0.15),blue);
label(pic2,"$B$",B+(0.15,0.05),blue);
label(pic2,"$C$",C+(-0.0,-0.2),blue);
label(pic2,"$C'$",C1+(-0.0,-0.2),blue);

//label(pic3,"$C$",C+(0.05,-0.2),blue);


dot(pic2,O,blue+3pt);
dot(pic2,A,blue+3pt);
dot(pic2,B,blue+3pt);
dot(pic2,C,blue+3pt);

add(shift(2.8,0)*pic2);

// pic1 

real alpha1=0;
real alpha2=180;
real alpha3=90+20;

draw(pic1,unitcircle,red+1.2pt);

pair A=dir(alpha2);
pair B=dir(alpha1);
pair C=dir(alpha3);


draw(pic1,O--A,black+.8pt);
draw(pic1,O--B,black+.8pt);
draw(pic1,C--A,black+.8pt);
draw(pic1,C--B,black+.8pt);

label(pic1,"$O$",(0.02,-0.2),blue);
label(pic1,"$A$",A+(-0.15,0.),blue);
label(pic1,"$B$",B+(0.15,0.05),blue);
label(pic1,"$C$",C+(0.05,0.2),blue);

perpendicular(pic1, C,NE,C--A,blue);

dot(pic1,O,blue+3pt);
dot(pic1,A,blue+3pt);
dot(pic1,B,blue+3pt);
dot(pic1,C,blue+3pt);

add(shift(5.4,0)*pic1);
