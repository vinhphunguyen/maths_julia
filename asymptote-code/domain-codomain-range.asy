import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(13pt));


picture pic1, pic2, pic3;

fill(pic1, scale(1,1.25)*unitcircle, mediumgray);
draw(pic1, scale(1,1.25)*unitcircle, black+1.2pt);

dot(pic1,(0,0),black+4pt);
label(pic1,"$x$",(0,0.2));
label(pic1,"Domain",(0,-1.45));
label(pic2,"Co-domain",(0,-1.45));
label(pic2,"Range",(0,-0.3));



add(pic1);

// pic 2

fill(pic2, scale(1,1.35)*unitcircle, mediumgray);
draw(pic2, scale(1,1.35)*unitcircle, black+1.2pt);


fill(pic2, scale(0.6,0.6)*unitcircle, lightcyan);
draw(pic2, scale(.6,.6)*unitcircle, black+1.2pt);

dot(pic2,(0,0),black+4pt);
label(pic2,"$f(x)$",(0,0.2));

draw(pic2,(-2.8,0)--(-0.2,0),black+1.2pt,ArcArrow);


add(shift(3,0)*pic2);



