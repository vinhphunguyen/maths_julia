import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(14cm, keepAspect=true);
defaultpen(fontsize(16pt));

picture pic1, pic2, pic3, pic4;


// pic1

pair p1 = dir(80);
pair p2 = dir(250);

pen p = black+1.pt;

draw(pic1,unitcircle,p);

draw(pic1,p1--p2,p);

dot(pic1,p1,black+4pt);
dot(pic1,p2,black+4pt);

label(pic1,"$n=2$",(0,-1.4));
label(pic1,"2 regions",(0,-2));

add(pic1);

// pic 2

pair p1 = dir(40);
pair p2 = dir(150);
pair p3 = dir(280);

pen p = black+1.pt;

draw(pic2,unitcircle,p);

fill(pic2,p1--p2--p3--cycle,mediumgray);
draw(pic2,p1--p2--p3--cycle,p);

dot(pic2,p1,black+4pt);
dot(pic2,p2,black+4pt);
dot(pic2,p3,black+4pt);

label(pic2,"$1$",(0,0));
label(pic2,"$2$",(0,.8));
label(pic2,"$3$",(-.7,-0.1));
label(pic2,"$4$",(0.7,0));


label(pic2,"$n=3$",(0,-1.4));
label(pic2,"4 regions",(0,-2));

add(shift(3,0)*pic2);

// pic 3

pair p1 = dir(30);
pair p2 = dir(100);
pair p3 = dir(180);
pair p4 = dir(280);

pen p = black+1.pt;

draw(pic3,unitcircle,p);

draw(pic3,p1--p2--p3--p4--cycle,p);
draw(pic3,p1--p3,p);
draw(pic3,p2--p4,p);

label(pic3,"$n=4$",(0,-1.4));
label(pic3,"8 regions",(0,-2));

dot(pic3,p1,black+4pt);
dot(pic3,p2,black+4pt);
dot(pic3,p3,black+4pt);
dot(pic3,p4,black+4pt);

add(shift(6,0)*pic3);

// pic 4

pair p1 = dir(30);
pair p2 = dir(100);
pair p3 = dir(180);
pair p4 = dir(230);
pair p5 = dir(310);


draw(pic4,unitcircle,p);

draw(pic4,p1--p2--p3--p4--p5--cycle,p);
draw(pic4,p1--p3,p);
draw(pic4,p1--p4,p);
draw(pic4,p1--p5,p);
draw(pic4,p2--p4,p);
draw(pic4,p2--p5,p);
draw(pic4,p3--p5,p);

label(pic4,"$n=5$",(0,-1.4));
label(pic4,"16 regions",(0,-2));

dot(pic4,p1,black+4pt);
dot(pic4,p2,black+4pt);
dot(pic4,p3,black+4pt);
dot(pic4,p4,black+4pt);
dot(pic4,p5,black+4pt);

add(shift(9,0)*pic4);
