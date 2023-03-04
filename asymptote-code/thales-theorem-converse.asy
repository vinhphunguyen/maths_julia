import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
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


// pic1 

real alpha1=0;
real alpha2=180;
real alpha3=90+20;
real alpha4=90+40;

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

add(pic1);

// pic2
draw(pic2,unitcircle,red+1.2pt);

pair A=dir(alpha2);
pair B=dir(alpha1);
pair C=dir(alpha3);
pair D=dir(alpha4);


pair Ds []=intersectionpoints(A--C,B--D);
pair Cp=Ds[0];

markangle(pic2,"$90^\circ$",A,Cp,B,n=1,radius=4mm,Fill(orange));

draw(pic2,O--A,black+.8pt);
draw(pic2,O--B,black+.8pt);
draw(pic2,C--A,black+.8pt);
draw(pic2,C--B,black+.8pt);
draw(pic2,Cp--B,black+.8pt);

label(pic2,"$O$",(0.02,-0.2),blue);
label(pic2,"$A$",A+(-0.15,0.),blue);
label(pic2,"$B$",B+(0.15,0.05),blue);
label(pic2,"$C'$",C+(0.05,0.2),blue);
label(pic2,"$C$",Cp+(-0.1,0.1),blue);

perpendicular(pic2, C,NE,C--A,blue);


dot(pic2,O,blue+3pt);
dot(pic2,A,blue+3pt);
dot(pic2,B,blue+3pt);
dot(pic2,C,blue+3pt);
dot(pic2,Cp,blue+3pt);

add(shift(3,0)*pic2);
