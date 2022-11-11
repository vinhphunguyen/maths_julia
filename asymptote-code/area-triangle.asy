import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm); // size of the image

pair A=(0,0); // location of the mass m1
pair B=(5,0); // location of the mass m2
pair C=(2,2.6); // location of the mass m3

fill(A--B--C-- cycle, green);
draw(A--B--C-- cycle, black+1pt);


pair A1=(7,0); // location of the mass m1
pair B1=(12,0); // location of the mass m2
pair C1=(9,2.6); // location of the mass m3
pair D=(12,2.6); // location of the mass m3
pair Ee=(7,2.6); // location of the mass m3
pair H=(9,0); // location of the mass m3


fill(A1--H--C1-- cycle, orange);
fill(A1--C1--Ee-- cycle, orange);
fill(H--B1--C1-- cycle, green);
fill(B1--D--C1-- cycle, green);

draw(A1--B1--C1-- cycle,black+1pt);

draw(A1--H--C1-- cycle);
draw(A1--C1--Ee-- cycle);
draw(H--B1--C1-- cycle);
draw(B1--D--C1-- cycle);

label("$A$",(0,-.35));
label("$B$",(5,-.35));
label("$C$",(2,2.86));

label("$A$",(7,-.35));
label("$B$",(12,-.35));
label("$C$",(9,2.86));

label("$D$",(12,2.86));
label("$E$",(7,2.86));
label("$H$",(9,-.35));

perpendicular(H,NW,blue);

Label Lb=Label("$b$",align=(0,0),MidPoint,Fill(white));
Label Lh=Label("$h$",align=(0,0),MidPoint,Fill(white));

draw(Lb,(0,-0.9)--(5,-0.9),Arrows(TeXHead),Bars);
draw(Lh,(5.3,0.)--(5.3,2.6),Arrows(TeXHead),Bars);

/* pair A11=(13,0); // location of the mass m1
pair B11=(17,0); // location of the mass m1
pair C11=(17,3); // location of the mass m1
pair D11=(13,3); // location of the mass m1
pair G11=(14,0); // location of the mass m1


filldraw(G11--B11--D11-- cycle, orange);
filldraw(B11--C11--D11-- cycle, green);
filldraw(G11--D11--A11-- cycle, cyan); */

//draw(A1--B1--C1-- cycle,black+1pt);
