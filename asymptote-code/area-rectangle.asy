import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm); // size of the image
defaultpen(fontsize(12pt));

pair m1=(0,0); // location of the mass m1
pair m2=(3,0); // location of the mass m2
pair m3=(3,5); // location of the mass m3
pair m4=(0,5); // location of the mass m3

path s1 = m1 -- m2 -- m3;
fill(s1 -- m4 -- cycle, orange);

pair O=(0,0);


pair m11=(4,0); // location of the mass m1
pair m21=(9,0); // location of the mass m2
pair m31=(9,3); // location of the mass m3
pair m41=(4,3); // location of the mass m3

path s11 = m11 -- m21 -- m31;
fill(s11 -- m41 -- cycle, green);

Label L1=Label("$5$",align=O,MidPoint,Fill(white));
Label L2=Label("$3$",align=O,MidPoint,Fill(white));
draw(L1,(-.35,0)--(-.35,5),Arrows(TeXHead),Bars);
draw(L2,(0,-.35)--(3,-.35),Arrows(TeXHead),Bars);

draw(L1,(4,-.35)--(9,-.35),Arrows(TeXHead),Bars);
draw(L2,(3.5,0)--(3.5,3),Arrows(TeXHead),Bars);
