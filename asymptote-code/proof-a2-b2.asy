import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm); // size of the image
defaultpen(fontsize(12pt));

pair m1=(0,0); // location of the mass m1
pair m2=(5,0); // location of the mass m2
pair m3=(5,5); // location of the mass m2
pair m4=(0,5); // location of the mass m2

pair b1=(3,0); // location of the mass m2
pair b2=(5,0); // location of the mass m2
pair b3=(5,2); // location of the mass m2
pair b4=(3,2); // location of the mass m2

pen p = black + 1pt;

path s1 = m1 -- m2 -- m3 -- m4;
fill(s1 -- cycle, mediumgray);
draw(s1 -- cycle, p);

path s1 = b1 -- b2 -- b3 -- b4;
fill(s1 -- cycle, orange);
draw(s1 -- cycle, p);


pair O=(0,0);

Label L1=Label("$a$",align=O,MidPoint,Fill(white));
Label L3=Label("$b$",align=O,MidPoint,Fill(white));

real x = -0.5; 
real y = m4.y + .5;
real y1 =-.5;

draw(L1,(x,0)--(x,m4.y),Arrows(TeXHead),Bars);
draw(L1,(0,y)--(m2.x,y),Arrows(TeXHead),Bars);
draw(L3,(b1.x,y1)--(b2.x,y1),Arrows(TeXHead),Bars);
draw(L3,(b2.x+.5,b2.y)--(b2.x+.5,b3.y),Arrows(TeXHead),Bars);

// pic2
picture pic1;

path s1 = m1 -- m2 -- m3 -- m4;
fill(pic1,s1 -- cycle, mediumgray);
draw(pic1,s1 -- cycle, p);

path s1 = b1 -- b2 -- b3 -- b4;
fill(pic1,s1 -- cycle, orange);
draw(pic1,s1 -- cycle, p);

pair A=(0,2);
draw(pic1,b4--A,p);

Label L1=Label("$a-b$",align=O,MidPoint,Fill(white));
Label L3=Label("$b$",align=O,MidPoint,Fill(white));

label(pic1,"$(a-b)a$",(2.5,3.2));
label(pic1,"$(a-b)b$",(1.5,1.1));

real x = -0.5; 
real y = m4.y + .5;
real y1 =-.5;

draw(pic1,L3,(x,0)--(x,A.y),Arrows(TeXHead),Bars);
draw(pic1,L1,(0,y1)--(b1.x,y1),Arrows(TeXHead),Bars);
draw(pic1,rotate(90)*L1,(x,A.y)--(x,m4.y),Arrows(TeXHead),Bars);

add(shift(7.5,0)*pic1);


