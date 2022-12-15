import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf

picture pic1, pic2, pic3, pic4;

// pic1

pen p =black+1pt;
pen pt =black+8pt;


real R=1;
real y=0.6;
real r=sqrt(R^2-y^2);
real radiusy=0.2;

real alpha=40;

draw(pic2,scale(R)*unitcircle,p);

pair O=(0,0);
pair A=(r,y);
pair B=(-r,y);


draw(pic2,O--A,p);
draw(pic2,O--(0,y),p);
draw(pic2,A--(0,y),p);

picture clipped2;
draw(clipped2,shift(0,y)*scale(r,radiusy)*unitcircle,pt);
clip(clipped2,A--B--(B.x,B.y-radiusy-.09)--(A.x,A.y-radiusy-.09)--cycle);
add(clipped2);

picture clipped1;
fill(clipped1,shift(0,y)*scale(r,radiusy)*unitcircle,lightgreen);
draw(clipped1,shift(0,y)*scale(r,radiusy)*unitcircle,p);
//clip(clipped1,A--B--(B.x,B.y+radiusy+.05)--(A.x,A.y+radiusy+.05)--cycle);
add(clipped1);



label(pic2,"O",O+.1S);
label(pic2,"$R$",(0.46,0.2) );
label(pic2,"$r$",(.3,y+.1));
label(pic2,"$y$",(-0.13,0.24) );


// pic1

real x=1.8;



picture clipped2;
draw(clipped2,shift(x,y)*scale(r,radiusy)*unitcircle,pt);
clip(clipped2,A+(x,0)--B+(x,0)--(B.x+x,B.y-radiusy-.09)--(A.x+x,A.y-radiusy-.09)--cycle);
add(clipped2);

picture clipped1;
fill(clipped1,shift(x,y)*scale(r,radiusy)*unitcircle,lightgreen);
draw(clipped1,shift(x,y)*scale(r,radiusy)*unitcircle,p);
//clip(clipped1,A--B--(B.x,B.y+radiusy+.05)--(A.x,A.y+radiusy+.05)--cycle);
add(clipped1);

draw(pic2,A+(x,0)--(x,y),p);

label(pic2,"$r^2=R^2-y^2$",(x,0));
label(pic2,"$dV=\pi r^2 dy$",(x,-0.4));
label(pic2,"$r$",(x+.3,y+.1));
// add(pic1);

add(pic2);


//shipout(bbox(0.25cm));



