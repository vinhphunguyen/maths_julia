import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

pair m1=(0,0); // location of the mass m1
pair m2=(3,0); // location of the mass m2
pair m3=(5,0); // location of the mass m3
pair m4=(3,3); // location of the mass m3
pair m5=(0,3); // location of the mass m3
pair m6=(5,3); // location of the mass m3
pair m7=(5,5); // location of the mass m3
pair m8=(3,5); // location of the mass m3
pair m9=(0,5); // location of the mass m3

path s1 = m1 -- m2 -- m4;
fill(s1 -- m5 -- cycle, green);

path s2 = m2 -- m3 -- m6;
fill(s2 -- m4 -- cycle, orange);

path s3 = m4 -- m6 -- m7;
fill(s3 -- m8 -- cycle, mediumgray);

path s4 = m5 -- m4 -- m8;
fill(s4 -- m9 -- cycle, orange);

draw(s1--m5--cycle); // draw the function
draw(s2-- m4 -- cycle); // draw the function
draw(s3-- m8 -- cycle); // draw the function
draw(s4-- m9 -- cycle); // draw the function

label("$x$",(1.5,1.5));
label("$\sqrt{x}d(\sqrt{x})$",(4,1.5));
label("$\sqrt{x}d(\sqrt{x})$",(1.5,4));
pair O=(0,0);

Label L1=Label("$x+5$",align=O,MidPoint,Fill(white));
Label L2=Label("$\sqrt{x}$",align=O,MidPoint,Fill(white));
Label L3=Label("$d(\sqrt{x})$",align=O,MidPoint,Fill(white));

draw(L2,(0,-0.6)--(3,-0.6),Arrows(TeXHead),Bars);
draw(L3,(3,-0.6)--(5,-0.6),Arrows(TeXHead),Bars);
draw(L2,(-0.7,0)--(-0.7,3),Arrows(TeXHead),Bars);
draw(L3,(-0.7,3)--(-0.7,5),Arrows(TeXHead),Bars);
