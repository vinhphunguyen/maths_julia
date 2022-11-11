import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

real xmax=3.5;

pair m1=(0,0); // location of the mass m1
pair m2=(3,0); // location of the mass m2
pair m3=(xmax,0); // location of the mass m3
pair m4=(3,3); // location of the mass m3
pair m5=(0,3); // location of the mass m3
pair m6=(xmax,3); // location of the mass m3
pair m7=(xmax,xmax); // location of the mass m3
pair m8=(3,xmax); // location of the mass m3
pair m9=(0,xmax); // location of the mass m3

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

label("$x^2$",(1.5,1.5));

pair O=(0,0);

Label L1=Label("$x+5$",align=O,MidPoint,Fill(white));
Label L2=Label("$x$",align=O,MidPoint,Fill(white));
Label L3=Label("$dx$",align=O,MidPoint,Fill(white));

draw(L2,(0,-0.4)--(3,-0.4),Arrows(TeXHead),Bars);
draw(L3,(3,-0.4)--(xmax,-0.4),Arrows(TeXHead),Bars);
draw(L2,(-0.5,0)--(-0.5,3),Arrows(TeXHead),Bars);
draw(L3,(-0.5,3)--(-0.5,xmax),Arrows(TeXHead),Bars);
