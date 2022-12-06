import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2; 

real rr=1/sqrt(2);

pen p =  black + 1.0pt;
pen pp = dashed + black + .9pt;
pen pdot = black + 4pt;

pair O=(0,0);
pair A=(-1,0);
pair C=(1,0);
pair B=(0,1);
pair D=0.5(A+B);

path a1 = arc(D,rr,45,180+45);
path a2 = arc(O,1,-180,-270);

fill(pic1,a2--a1--cycle,cyan);
fill(pic1,A--O--B--cycle,mediumgray);

draw(pic1,arc(O,1,0,180),p);
draw(pic1,A--C,p);
draw(pic1,O--B,p);
draw(pic1,A--B,p);

draw(pic1,arc(D,rr,45,180+45),p);

label(pic1,"$A$",A+0.1S);
label(pic1,"$O$",O+0.1S);
label(pic1,"$C$",C+0.1S);
label(pic1,"$B$",B+0.1N);
label(pic1,"$D$",D+0.1W);

label(pic1,"$E$",(-1.1,1));
label(pic1,"$F$",(-0.6,0.7));

dot(pic1,O,pdot);
dot(pic1,A,pdot);
dot(pic1,B,pdot);
dot(pic1,C,pdot);
dot(pic1,D,pdot);

add(pic1);

label(pic2,"$A=\frac{1}{2}\pi \frac{AB^2}{4}-\left(\frac{1}{4}\pi OA^2-AOB\right)$",(.2,1.1));
label(pic2,"$AB^2= 2OA^2$",(.4,.4));

add(shift(1.1,0)*pic2);





