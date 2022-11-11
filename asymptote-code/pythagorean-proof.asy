import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm); // size of the image

pair D=(0,0); // location of the mass m1
pair C=(3,0); // location of the mass m2
pair B=(3,3); // location of the mass m3
pair A=(0,3); // location of the mass m3
pair Ee=(2,0); // location of the mass m3
pair F=(3,2); // location of the mass m3
pair G=(1,3); // location of the mass m3
pair H=(0,1); // location of the mass m3

perpendicular((0,0),NE,(0,0)--(1,0),blue);

fill(A--G--H-- cycle, orange);
fill(D--Ee--H-- cycle, orange);
fill(C--F--Ee-- cycle, orange);
fill(F--B--G-- cycle, orange);

fill(F--G--H--Ee-- cycle, mediumgray);


draw(A--B--C--D--cycle,black+1.05pt);
draw(F--G--H--Ee--cycle,black+1.01pt);

pair O=(0,0);

Label La=Label("$a$",align=O,MidPoint,Fill(white));
Label Lb=Label("$b$",align=O,MidPoint,Fill(white));

draw(Lb,(0,-0.2)--(2,-0.2),Arrows(TeXHead),Bars);
draw(La,(2,-0.2)--(3,-0.2),Arrows(TeXHead),Bars);

draw(Lb,(-0.2,1)--(-0.2,3),Arrows(TeXHead),Bars);
draw(La,(-0.2,0)--(-0.2,1),Arrows(TeXHead),Bars);

draw(Lb,(1,3.2)--(3,3.2),Arrows(TeXHead),Bars);
draw(La,(0,3.2)--(1,3.2),Arrows(TeXHead),Bars);

draw(Lb,(3.2,0.)--(3.2,2),Arrows(TeXHead),Bars);
draw(La,(3.2,2)--(3.2,3),Arrows(TeXHead),Bars);

label("$c$",(1.,.6));
label("$c$",(2.5,1.3));
label("$c$",(2.3,2.2));
label("$c$",(0.9,2.3));

perpendicular((0,0),NE,(0,0)--(1,0),blue);
perpendicular((2,0),NE,(2,0)--(3,2),blue);

real theta=degrees(atan2(2,1));
draw("$\alpha$",arc((2,0),0.3,0,theta),PenMargins);
draw("$\alpha$",arc((0,1),0.3,270,270+theta),PenMargins);
