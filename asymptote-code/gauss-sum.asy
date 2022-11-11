import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 8cm, keepAspect=true);


fill((0,0)--(4,0)--(0,4)--cycle,mediumgray); // draw the dotted line showing the projections
fill((5,0)--(5,4)--(1,4)--cycle,mediumgray); // draw the dotted line showing the projections

pair O=(0,0);
Label L5=Label("$5$",align=O,MidPoint,Fill(white));
Label L6=Label("$6$",align=O,MidPoint,Fill(white));

dot((0,0),black+5pt); // plot a dot at (0,0)
dot((1,0),black+5pt); // plot a dot at (0,0)
dot((2,0),black+5pt); // plot a dot at (0,0)
dot((3,0),black+5pt); // plot a dot at (0,0)
dot((4,0),black+5pt); // plot a dot at (0,0)
dot((5,0),orange+5pt); // plot a dot at (0,0)


dot((0,1),black+5pt); // plot a dot at (0,0)
dot((1,1),black+5pt); // plot a dot at (0,0)
dot((2,1),black+5pt); // plot a dot at (0,0)
dot((3,1),black+5pt); // plot a dot at (0,0)
dot((4,1),orange+5pt); // plot a dot at (0,0)
dot((5,1),orange+5pt); // plot a dot at (0,0)

dot((0,2),black+5pt); // plot a dot at (0,0)
dot((1,2),black+5pt); // plot a dot at (0,0)
dot((2,2),black+5pt); // plot a dot at (0,0)
dot((3,2),orange+5pt); // plot a dot at (0,0)
dot((4,2),orange+5pt); // plot a dot at (0,0)
dot((5,2),orange+5pt); // plot a dot at (0,0)

dot((0,3),black+5pt); // plot a dot at (0,0)
dot((1,3),black+5pt); // plot a dot at (0,0)
dot((2,3),orange+5pt); // plot a dot at (0,0)
dot((3,3),orange+5pt); // plot a dot at (0,0)
dot((4,3),orange+5pt); // plot a dot at (0,0)
dot((5,3),orange+5pt); // plot a dot at (0,0)

dot((0,4),black+5pt); // plot a dot at (0,0)
dot((1,4),orange+5pt); // plot a dot at (0,0)
dot((2,4),orange+5pt); // plot a dot at (0,0)
dot((3,4),orange+5pt); // plot a dot at (0,0)
dot((4,4),orange+5pt); // plot a dot at (0,0)
dot((5,4),orange+5pt); // plot a dot at (0,0)




draw(L6,(0,-0.25)--(5.,-0.25),Arrows(TeXHead),Bars);
draw(L5,(-0.25,0)--(-0.25,4),Arrows(TeXHead),Bars);

//label("$a$",(a,-0.1));  // draw the;abel v0y
