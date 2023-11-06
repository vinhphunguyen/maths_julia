import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm); // size of the image

pair O=(0,0); // location of the mass m1
pair A=(5,0); // location of the mass m2
pair B=(2,3); // location of the mass m3
pair C=A+B;

fill(O--A--C--B-- cycle, lightgreen);
draw(O--A--C--B-- cycle, black+1pt);
draw(O--A, black+1pt,ArcArrow);
draw(O--B, black+1pt,ArcArrow);


label("$a$",(2.5,-.5));
label("$b$",(-.5,1.5) );

shipout(bbox(2mm,invisible));

//perpendicular(H,NW,blue);



