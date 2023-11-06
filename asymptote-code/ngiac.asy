import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(16pt));

picture pic2;

real theta=degrees(2pi/5);
real alpha=90-theta;
real theta2=90-theta;
real theta3=90+theta;
//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

draw(pic2,polygon(5),black+1.pt);

pair C = (1,0);
pair B = dir(60);


label("$A$",dir(theta3)+(0,0.1));
label("$C$",dir(theta2)+(0,0.1));
label("$B'$",dir(90)+(0,0.1));
label("$B$",B+(0,0.2));

draw(pic2,dir(theta2)--dir(theta3),black+0.8pt);
draw(pic2,dir(theta2)--B,black+0.8pt);
draw(pic2,dir(theta3)--B,black+0.8pt);

//perpendicular(pic2,H,NE,(1,0)--dir(degrees(pi/4)),blue);

//draw(pic2,"$\pi/8$",arc((0,0),0.35,0,theta),PenMargins);
//draw(pic2,"$\pi/4$",arc((0,0),0.35,theta2,theta2*2),PenMargins);

add(pic2);
