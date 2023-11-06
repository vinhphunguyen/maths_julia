import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm); // size of the image
defaultpen(fontsize(12pt));

pair m1=(0,0); // location of the mass m1
pair m2=(2,0); // location of the mass m2
pair m3=(2,4); // location of the mass m3
pair m4=(0,4); // location of the mass m3
pair m5=(0,1.8); // location of the mass m3
pair m6=(2,1.8); // location of the mass m3
pair O=(0,0);

path s1 = m1 -- m2 -- m3 -- m4;
path s2 = m1 -- m2 -- m6 -- m5;

fill(s2 -- cycle, lightgreen);

draw(s1--cycle,1.1+black);


Label L1=Label("$a$",align=O,MidPoint,Fill(white));
Label L2=Label("$h$",align=O,MidPoint,Fill(white));
Label L3=Label("$x$",align=O,MidPoint,Fill(white));
real y = -0.2;
real y1 = -0.5;
draw(L1,(0,y)--(2,y),Arrows(TeXHead),Bars);
draw(L2,(2-y1,0)--(2-y1,m4.y),Arrows(TeXHead),Bars);
draw(L3,(2-y,0)--(2-y,m5.y),Arrows(TeXHead),Bars);


shipout(bbox(2mm,invisible));

