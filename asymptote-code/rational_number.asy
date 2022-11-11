import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

pair m1=(0,0); // location of the mass m1
pair m2=(1,0); // location of the mass m2
pair m3=(2,0); // location of the mass m3
pair m4=(0,1); // location of the mass m3
pair m5=(0,2); // location of the mass m3
pair m6=(2,2); // location of the mass m3
pair m7=(1,2); // location of the mass m3
pair m8=(2,1); // location of the mass m3

path s1 = m2 -- m8 -- m7;
fill(s1 -- m4 -- cycle, orange);
draw(s1 -- m4 -- cycle);
draw(m1--m3--m6--m5 -- cycle,red);

draw(m4--m8,black);
draw(m2--m7,black);

label("$A$",(1,2),1.01N);
label("$B$",(2,1),1.01E);
label("$C$",(1,0),1.01S);
label("$D$",(0,1),1.01W);

label("$d$",(0.5,0.4),1.01W);
label("$d$",(0.5,1.65),1.01W);

label("$1$",(0.5,1.1),1.01W);
label("$1$",(1.05,1.5),1.01W);

perpendicular((1,0),NE,(1,0)--(2,1),blue);
