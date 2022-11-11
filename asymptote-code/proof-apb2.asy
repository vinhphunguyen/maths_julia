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

label("$(a-b)^2$",(1.5,1.5));
label("$ab-b^2$",(4,1.5));
label("$ab-b^2$",(1.5,4));
label("$b^2$",(4,4));
pair O=(0,0);

Label L1=Label("$a$",align=O,MidPoint,Fill(white));
Label L2=Label("$a-b$",align=O,MidPoint,Fill(white));
Label L3=Label("$b$",align=O,MidPoint,Fill(white));

draw(L1,(5.8,0)--(5.8,5),Arrows(TeXHead),Bars);
draw(L1,(0,5.5)--(5,5.5),Arrows(TeXHead),Bars);
draw(L2,(0,-0.6)--(3,-0.6),Arrows(TeXHead),Bars);
draw(L3,(3,-0.6)--(5,-0.6),Arrows(TeXHead),Bars);
draw(L2,(-0.6,0)--(-0.6,3),Arrows(TeXHead),Bars);
draw(L3,(-0.6,3)--(-0.6,5),Arrows(TeXHead),Bars);

/* draw(m1--m2,black+1.1pt);
draw(m2--m3,black+1.1pt);
draw(m3--m4,black+1.1pt);
draw(m4--m1,black+1.1pt);
draw(m1--m3,red+1.3pt);


perpendicular(m2,NW,blue); */
