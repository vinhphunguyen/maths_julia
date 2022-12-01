import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(10pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.2pt;

pair A = (0,0);
pair B = (3,0);
pair C = (0,4);

real alpha=degrees(atan(4/3));

real r1=6.5, r2=8.5;

pair C1 = B + r1*dir(180-alpha);
pair C2 = B + r2*dir(180-alpha);

fill(pic2,A--B--C--cycle,lightgreen);
draw(pic2,A--B--C--cycle,p);
draw(pic2,C--C2--(C2.x,0)--A,p);
draw(pic2,(C1.x,0)--C1,p);

label(pic2,"$A$",A+0.3S);
label(pic2,"$B$",B+0.3S);
label(pic2,"$C$",C+0.4E);

label(pic2,"$A_1$",(C1.x,0)+0.3S);
label(pic2,"$A_2$",(C2.x,0)+0.3S);
label(pic2,"$C_1$",C1+0.4E);
label(pic2,"$C_2$",C2+0.3N);

label(pic2,"$3$",0.5(A+B)+0.3S);
label(pic2,"$4$",0.5(A+C)+0.25W);
label(pic2,"$5$",0.5(B+C)+0.4E);

label(pic2,"$a)$",(C2.x,-0.8));

perpendicular(pic2,A,NE,(0,0)--(1,0),blue);
perpendicular(pic2,(C1.x,0),NE,(0,0)--(1,0),blue);
perpendicular(pic2,(C2.x,0),NE,(0,0)--(1,0),blue);
draw(pic2,"$\alpha$",arc(B,1.,180-alpha,180),PenMargins);

add(pic2);

// pic1
pair A = (0,0);
pair B = (4,0);
pair C = (0,5);


real alpha=degrees(atan(5/4));

path arcc=arc(B,1.5,180-alpha,180);

pair xx= B + 1.5*dir(180-alpha); 
pair yy= B + 1.5*dir(180); 

fill(pic1,B--xx--arcc--yy--cycle,pink);

draw(pic1,A--B--C--cycle,p);

label(pic1,"$A$",A+0.3S);
label(pic1,"$B$",B+0.3S);
label(pic1,"$C$",C+0.25N);

label(pic1,"ADJACENT",0.5(A+B)+0.45S);
label(pic1,rotate(90)*"OPPOSITE",0.5(A+C)+0.35W);
label(pic1,rotate(-alpha)*"HYPOTENUSE",0.5(B+C)+0.45E);

perpendicular(pic1,A,NE,(0,0)--(1,0),blue);
draw(pic1,"$\alpha$",arcc,PenMargins);

label(pic1,"$b)$",(0.4,-0.8));


add(shift(4.5,0)*pic1);

