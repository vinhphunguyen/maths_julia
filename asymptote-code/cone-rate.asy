import graph;
import geometry;
import gsl;
import BezierLib;

usepackage("amsmath");
usepackage("mtpro2");

size(12cm, 12cm,keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf

picture pic1, pic2, pic3, pic4;

// pic1

pen p =black+1pt;
pen pg =gray+1pt;
pen pd =dashed+1pt;
pen pdr =red+dashed+1pt;

real alpha=60;
real alphar=radians(alpha);
real theta=180-alpha*2;
real s   = 2;
real h   = s-s*cos(alphar/2);
real r   = s*sin(alphar/2);

// for correct tangentcy to ellipse
real radiusx = r;
real radiusy = .2;
real height  = s*cos(alphar/2);
real height0=height;

pair a= (-radiusx*sqrt(1-(radiusy/height)*(radiusy/height)),radiusy*(radiusy/height));
pair b= (radiusx*sqrt(1-(radiusy/height)*(radiusy/height)),radiusy*(radiusy/height));

pair O=(0,0);
pair O1=(0,-s*cos(alphar/2));
pair A=s*dir(-alpha);
pair B=s*dir(-alpha-theta);

draw(pic3,O--a+(0,height),p);
draw(pic3,O--b+(0,height),p);

//draw(pic3,O1--A,pg);

picture clipped11;
draw(clipped11,shift(0,height)*scale(radiusx,radiusy)*unitcircle,pd);
clip(clipped11,A--B--(B.x,B.y+radiusy+.05)--(A.x,A.y+radiusy+.05)--cycle);
add(clipped11);

picture clipped22;
draw(clipped22,shift(0,height)*scale(radiusx,radiusy)*unitcircle,p);
clip(clipped22,A--B--(B.x,B.y-radiusy-.05)--(A.x,A.y-radiusy-.05)--cycle);
add(shift(0,2.5)*clipped22);

//draw(pic3,O1--A,pg);
//draw(pic3,O1--O,pg);

label(pic3,"$O$", 0+.1N);
//label(pic3,"$r_1$", 0.5(A+O1)+.1S);

//Label L1=Label("$S_1$",align=O,MidPoint,Fill(white));
//draw(pic3,L1,O+.3W--B+.3W,Arrows(TeXHead),Bars);


add(pic3);


