import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

pair A=(0,0); // location of the mass m1
pair B=(4,0); // location of the mass m2
pair C=(0,3); // location of the mass m3
pair D=(-3,3); // location of the mass m3
pair Ee=(-3,0); // location of the mass m3
pair F=(0,-4); // location of the mass m3
pair G=(4,-4); // location of the mass m3

perpendicular((0,0),NE,(0,0)--(1,0),blue);

fill(A--C--D--Ee-- cycle, orange);
fill(A--B--G--F-- cycle, green);

real alpha=90-degrees(atan2(3,4));
pair H = B+5*dir(alpha);
pair K = H+5*dir(90+alpha);

fill(B--H--K-- C--cycle, blue);

label("$a$",(-0.1,1.5),1.01*SE);
label("$b$",(2,0.1),1.01*SE);
label("$c$",(1.92,1.26),1.01*SE);

label("$a^2$",(-1.5,1.5));
label("$b^2$",(2,-2));
label("$c^2$",(3.3,3.));

draw(A--B--C-- cycle,black+1.05pt);
