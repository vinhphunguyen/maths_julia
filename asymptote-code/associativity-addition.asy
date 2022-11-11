import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

pair m1=(0,0); // location of the mass m1
pair m2=(2,0); // location of the mass m2
pair m3=(6,0); // location of the mass m3
pair m4=(2,3); // location of the mass m3
pair m5=(0,3); // location of the mass m3
pair m6=(6,3); // location of the mass m3

path s1 = m1 -- m2 -- m4;
fill(s1 -- m5 -- cycle, green);

path s2 = m2 -- m3 -- m6;
fill(s2 -- m4 -- cycle, orange);

draw(s1--m5--cycle); // draw the function
draw(s2-- m4 -- cycle); // draw the function

label("$3\times 2$",(1,1.5));
label("$3\times 4$",(4,1.5));
pair O=(0,0);

Label L1=Label("$6$",align=O,MidPoint,Fill(white));

Label L2=Label("$3$",align=O,MidPoint,Fill(white));
Label L3=Label("$4$",align=O,MidPoint,Fill(white));
Label L4=Label("$2$",align=O,MidPoint,Fill(white));

draw(L1,(0,3.5)--(6,3.5),Arrows(TeXHead),Bars);

draw(L4,(0,-0.6)--(2,-0.6),Arrows(TeXHead),Bars);
draw(L3,(2,-0.6)--(6,-0.6),Arrows(TeXHead),Bars);
draw(L2,(-0.6,0)--(-0.6,3),Arrows(TeXHead),Bars);
