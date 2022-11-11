import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

pair A11=(0,0); // location of the mass m1
pair B11=(4,0); // location of the mass m1
pair C11=(4,3); // location of the mass m1
pair D11=(0,3); // location of the mass m1
pair G11=(1,0); // location of the mass m1


filldraw(G11--B11--D11-- cycle, orange);
draw(G11--B11--D11-- cycle, black+1pt);
filldraw(B11--C11--D11-- cycle, green);
filldraw(G11--D11--A11-- cycle, cyan);

//draw(A1--B1--C1-- cycle,black+1pt);
pair O=(0,0);

Label La=Label("$a$",align=O,MidPoint,Fill(white));
Label Lb=Label("$b$",align=O,MidPoint,Fill(white));
Label Lh=Label("$h$",align=O,MidPoint,Fill(white));
Label Lab=Label("$a+b$",align=O,MidPoint,Fill(white));

draw(Lh,(4.2,0)--(4.2,3),Arrows(TeXHead),Bars);
draw(La,(0,-0.2)--(1.,-0.2),Arrows(TeXHead),Bars);
draw(Lb,(1,-0.2)--(4.,-0.2),Arrows(TeXHead),Bars);
draw(Lab,(0,3.2)--(4.,3.2),Arrows(TeXHead),Bars);

label("$\displaystyle\frac{1}{2}(a+b)h$",(3,2.));
label("$\displaystyle\frac{1}{2}ah$",(.4,1.));
label("$\displaystyle\frac{1}{2}bh$",(1.9,1.));
