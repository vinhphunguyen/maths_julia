import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);

picture pic1, pic2;


// pic2

pen p = black+1pt;

fill(pic2,polygon(5),mediumgray);
draw(pic2,polygon(5),p);
pair A=(0.1,0.1);
pair B=(-0.1,-0.6);
dot(pic2,A,blue+3pt);
dot(pic2,B,blue+3pt);
draw(pic2,A--B,blue+.8pt);

add(pic2);

pair A=(0,-.8);
pair B=(0,1);
pair C=(2,1);
pair D=(0.6,0.3);

fill(pic1,A--B--C--D--cycle,mediumgray);
draw(pic1,A--B--C--D--cycle,p);

dot(pic1,A,blue+3pt);
dot(pic1,C,blue+3pt);
draw(pic1,C--A,blue+.8pt);

add(shift(3,0)*pic1);
