import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm); // size of the image

pair A=(0,0); // location of the mass m1
pair B=(2,0); // location of the mass m2
pair C=(2,2); // location of the mass m3
pair D=(0,2); // location of the mass m3
pair G=(1,1); // location of the mass m3

fill(A--B--G-- cycle, mediumgray);

draw(A--B--C--D--cycle, black+1pt);
draw(A--C, black+1pt);
draw(B--D, black+1pt);


Label L=Label("$a$",align=(0,0),MidPoint,Fill(white));
Label La=Label("$a/2$",align=(0,0),MidPoint,Fill(white));

draw(L,(0,-0.3)--(2,-0.3),Arrows(TeXHead),Bars);
draw(L,(2.3,0.)--(2.3,2.),Arrows(TeXHead),Bars);

label("$\displaystyle\frac{a^2}{4}$",(1,.5));
label("$\displaystyle\frac{a^2}{4}=0.5a(a/2)$",(4,1.6));


pair A1=(3,0); // location of the mass m1
pair B1=(5,0); // location of the mass m2
pair C1=(4,1); // location of the mass m3

fill(A1--B1--C1--cycle, mediumgray);
draw(A1--B1--C1--cycle, black+1pt);

draw(L,(3,-0.3)--(5,-0.3),Arrows(TeXHead),Bars);
draw(La,(5.3,0.)--(5.3,1.),Arrows(TeXHead),Bars);
