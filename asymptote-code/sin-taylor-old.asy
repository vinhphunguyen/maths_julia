import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);
defaultpen(fontsize(10pt));


picture pic1, pic2, pic3;

// pic 2

real alpha=20;
real r = 1;

pair O=(0,0);


real alpha1=60;
real alpha2=0;
real alpha3=-60;

draw(pic3,unitcircle,red+1.2pt);

pair A=dir(alpha2);
pair B=dir(alpha1);
pair C=dir(alpha3);
pair D=dir(alpha1/2);
pair D1=dir(-alpha1/2);
pair H = (B.x,0);


draw(pic3,O--A,black+.8pt);
draw(pic3,O--B,black+.8pt);
draw(pic3,O--C,black+.8pt);
draw(pic3,C--B,black+.8pt);
draw(pic3,A--B,black+.8pt);
draw(pic3,C--A,black+.8pt);
draw(pic3,D--A,black+.8pt);
draw(pic3,D--B,black+.8pt);
draw(pic3,D1--A,black+.8pt);
draw(pic3,D1--C,black+.8pt);

label(pic3,"$1$",(.1,.5),blue);
label(pic3,"$O$",(-0.15,-0),blue);
label(pic3,"$A$",A+(0.15,0.),blue);
label(pic3,"$B$",B+(0.15,0.05),blue);
label(pic3,"$C$",C+(0.0,-0.2),blue);
label(pic3,"$D$",D+(0.2,-0.),blue);
label(pic3,"$H$",H+(0.1,-0.1),blue);

label(pic3,"$a)$",(-1,-1),blue);
label(pic2,"$b)$",(-1,-1),blue);

perpendicular(pic3,H,NE,H--A,blue);

real r = 0.22, r1=0.4;
draw(pic3,Label("$\theta/2$",MidPoint ),arc((0,0),r,0,alpha1),gray+.8pt);
draw(pic3,Label("$\theta/2$",MidPoint),arc((0,0),r1,0,-alpha1),gray+.8pt);

fill(O--B--C--cycle,cyan);
fill(A--B--C--cycle,green);
fill(A--B--D--cycle,lightblue);
fill(A--C--D1--cycle,lightblue);

dot(pic3,D,red+3pt);

add(pic3);

// pic

real alpha=20;
real r = 1;

pair O=(0,0);


real alpha1=60;
real alpha2=0;
real alpha3=-60;

draw(pic2,unitcircle,red+1.2pt);

pair A=dir(alpha2);
pair B=dir(alpha1);
pair C=dir(alpha3);

fill(pic2,A--B--C--cycle,lightblue);

draw(pic2,O--A,black+.8pt);
draw(pic2,O--B,black+.8pt);
draw(pic2,O--C,black+.8pt);
draw(pic2,C--B,black+.8pt);
draw(pic2,A--B,black+.8pt);
draw(pic2,C--A,black+.8pt);

label(pic2,"$1$",(.1,.5),blue);
label(pic2,"$O$",(-0.15,-0),blue);
label(pic2,"$D$",A+(0.15,0.),blue);
label(pic2,"$B$",B+(0.15,0.05),blue);
label(pic2,"$A$",C+(0.0,-0.2),blue);


real r = 0.22, r1=0.4;
draw(pic2,Label("$\theta/4$",MidPoint ),arc((0,0),r,0,alpha1),gray+.8pt);
draw(pic2,Label("$\theta/4$",MidPoint),arc((0,0),r1,0,-alpha1),gray+.8pt);


add(shift(2.8,0)*pic2);

// pic1 


