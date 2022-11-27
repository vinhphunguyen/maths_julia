import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(14cm, keepAspect=true);
defaultpen(fontsize(13pt));

picture pic1, pic2, pic3;

// pic2

real theta=degrees(2pi/5);
real alpha=90-theta;
real theta2=90-theta;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

fill(pic2,unitcircle,mediumgray);
draw(pic2,unitcircle,black+1.pt);

label("$A$",(-0.2,0.2));
label("$B$",(0.2,0.2));
label("$C$",(-0.3,-.2));
label("$X$",(0.2,-0.2));


add(pic2);


fill(pic1,unitcircle,mediumgray);
draw(pic1,unitcircle,black+1.pt);

label(pic1,"$AB\;\; AC\;\; AX$",(-0.15,0.2));
label(pic1,"$BC\;\; BX$",(0.2,-.15));
label(pic1,"$CX$",(0.2,-0.5));

label(pic1,"$S: |S|={4 \choose 2}$",(-0.2,-1.4),red);

add(shift(2.5,0)*pic1);

// pic3

pair A=dir(45);
pair B=dir(180+45);

path upper_arc = arc((0,0),1,45,180+45);
path lower_arc = arc((0,0),1,180+45,360+45);

path p1 = B--A--upper_arc--cycle;
path p2 = lower_arc--A--B--cycle;

fill(pic3,p1,orange);
fill(pic3,p2,green);
draw(pic3,unitcircle,black+1.pt);

label(pic3,"$AB \;\; AC$",(-0.15,0.5));
label(pic3,"$BC$",(-.4,-.1));
label(pic3,"$AX$",(0.4,0.1));
label(pic3,"$BX$",(0.4,-0.3));
label(pic3,"$CX$",(0.2,-.8));

arrow(pic3,"$|S_1|={3 \choose 2}$",(.2,.7),N,black);
arrow(pic3,"$|S_2|={3 \choose 1}$",(0.7,.02),E,black);

label(pic3,"$|S|=|S_1|+|S_2|$",(-0.1,-1.4),red);

add(shift(5,0)*pic3);
