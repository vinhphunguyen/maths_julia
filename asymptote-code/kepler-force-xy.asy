import math;
import graph;
usepackage("amsmath");

settings.outformat="pdf";

defaultpen(fontsize(12pt));

size(0,100);


fill(circle((0,0),0.22));
fill(circle((3,2),0.1));
label("$M$",(0,0),1.13*SE);
label("$m$",(3,2),1.01*SE);

draw((3,2)--(3,0),dotted+gray); // draw the dotted line showing the projections
draw((3,2)--(0,2),dotted+gray); // draw the dotted line showing the projections
draw((0,0)--(3,2));  // draw the force

draw((3,2)--(1.5,1),red,Arrow);  // draw the force
draw((1.5,1)--(3,1),dotted+gray); // draw the dotted line showing the projections
draw((1.5,1)--(1.5,2),dotted+gray); // draw the dotted line showing the projections
draw((3,2)--(3,1),blue,Arrow);  // draw the force
draw((3,2)--(1.5,2),blue,Arrow);  // draw the force

label("$F_x$",(1.5,2.3),blue);  // draw the;abel v0y
//label("$F_x=F\sin \alpha$",(1.5,1.5),blue);  // draw the;abel v0y
label("$F_y$",(3.3,1),blue);  // draw the;abel v0y
label("$F$",(2.2,1.7),red);  // draw the;abel v0y
label("$r$",(1.1,0.9));  // draw the;abel v0y

path tick = (0,0) -- (0,-0.15cm);
Label xticklabel = Label("$x(t)$", position=EndPoint);
Label yticklabel = Label("$y(t)$", position=EndPoint);
draw((3,0)--(3,-0.1), L=xticklabel);
draw((0,2)--(0-0.1,2), L=yticklabel);

real theta=atan2(2.,3.);
//entered on c with radius r from angle1 to angle2 degrees, drawing counterclockwise if angle2 >= angle1
draw("$\alpha$",arc((3,2),0.4,180+degrees(theta),270),Arrow,PenMargins);

// two axes

xaxis("$x$",-.5,3.8,Arrow(TeXHead));
yaxis("$y$",-.5,2.9,Arrow(TeXHead));
