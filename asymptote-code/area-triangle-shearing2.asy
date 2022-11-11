import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm); // size of the image

pair A=(0,0); // location of the mass m1
pair B=(2,0); // location of the mass m2
pair G=(1,1); // location of the mass m3
pair H=(1,2); // location of the mass m3

fill(A--B--G-- cycle, mediumgray);
draw(A--B--G--cycle, black+1pt);
draw(A--B--H--cycle, black+1pt);


Label L=Label("$a$",align=(0,0),MidPoint,Fill(white));
Label La2=Label("$a/2$",align=(0,0),MidPoint,Fill(white));
Label Lh=Label("$h$",align=(0,0),MidPoint,Fill(white));

draw(L,(0,-0.3)--(2,-0.3),Arrows(TeXHead),Bars);
draw(La2,(2.2,0.)--(2.2,1.),Arrows(TeXHead),Bars);
draw(Lh,(2.5,0.)--(2.5,2.),Arrows(TeXHead),Bars);

pair A1=(3,0); // location of the mass m1
pair B1=(5,0); // location of the mass m2
pair C1=(4,1); // location of the mass m3

pair D1=(3,1); // location of the mass m3
pair E1=(5,1); // location of the mass m3
pair F1=(3.4,1); // location of the mass m3

fill(A1--B1--C1--cycle, mediumgray);
draw(A1--B1--C1--cycle, black+1pt);
draw(A1--B1--F1--cycle, red+1pt);

draw(D1--E1, dashed);

draw(L,(3,-0.3)--(5,-0.3),Arrows(TeXHead),Bars);
draw(Lh,(5.5,0.)--(5.5,1.),Arrows(TeXHead),Bars);

/*
draw(L,(3,-0.3)--(5,-0.3),Arrows(TeXHead),Bars);
draw(La,(5.3,0.)--(5.3,1.),Arrows(TeXHead),Bars); */
