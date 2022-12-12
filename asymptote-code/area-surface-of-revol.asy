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

pair a= (-radiusx*sqrt(1-(radiusy/height)*(radiusy/height)),radiusy*(radiusy/height));
pair b= (radiusx*sqrt(1-(radiusy/height)*(radiusy/height)),radiusy*(radiusy/height));

pair O=(0,0);
pair O1=(0,-s*cos(alphar/2));
pair A=s*dir(-alpha);
pair B=s*dir(-alpha-theta);

path aa=arc(O,s,-alpha,-alpha-theta);
path bb=shift(0,-2s+2h)*rotate(180)*aa;

//draw(pic1,aa,p);
//draw(pic1,bb,pd);
draw(pic1,O--a+(0,-height),p);
draw(pic1,O--b+(0,-height),p);

draw(pic1,O1--A,p);

picture clipped1;
draw(clipped1,shift(0,-height)*scale(radiusx,radiusy)*unitcircle,pd);
clip(clipped1,A--B--(B.x,B.y+radiusy+.05)--(A.x,A.y+radiusy+.05)--cycle);
add(clipped1);

picture clipped2;
draw(clipped2,shift(0,-height)*scale(radiusx,radiusy)*unitcircle,p);
clip(clipped2,A--B--(B.x,B.y-radiusy-.05)--(A.x,A.y-radiusy-.05)--cycle);
add(clipped2);

label(pic1,"$O$", 0+.1N);
label(pic1,"$S$", 0.5(O+B)+.21W);
label(pic1,"$r$", 0.5(A+O1)+.1S);

label(pic1,"$a)$", (-1,0) );

draw(pic1,O+.03W--a+(0,-height)+.03W,pdr);

draw(pic1,(1,-.9)--(2,-.9),p,ArcArrow);

add(pic1);

// pic2

real theta   = 60;
real alpha   = 0.5(180-theta);


pair O1=(0,-s*cos(alphar/2));
pair A=s*dir(-alpha);
pair B=s*dir(-alpha-theta);

path aa=arc(O,s,-alpha,-alpha-theta);

fill(pic2,aa--B--O--A--cycle,lightcyan);
draw(pic2,aa,p);
draw(pic2,O--s*dir(-alpha),p);
draw(pic2,O--s*dir(-alpha-theta),p);


path aa=arc(O,s,-alpha,-alpha-theta);
path bb=shift(0,-2s+2h)*rotate(180)*aa;

pair xx=0.5(A+O1);

label(pic2,"$O$", 0+.1N);
label(pic2,"$S$", 0.5(O+B)+.19W);
label(pic2,"$2\pi r$", (0,xx.y)+.4S);

label(pic2,"$\theta=(2\pi r)/S$", O+1.2S);
label(pic2,"$A=\pi r S$", O+1.5S);

draw(pic2,"$\theta$",arc(O,0.4,-alpha,-alpha-theta),PenMargins);

add(shift(3,0)*pic2);

// pic3
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

draw(pic3,O--a+(0,-height),p);
draw(pic3,O--b+(0,-height),p);

draw(pic3,O1--A,pg);

picture clipped11;
draw(clipped11,shift(0,-height)*scale(radiusx,radiusy)*unitcircle,pd);
clip(clipped11,A--B--(B.x,B.y+radiusy+.05)--(A.x,A.y+radiusy+.05)--cycle);
add(shift(0,-2.5)*clipped11);

picture clipped22;
draw(clipped22,shift(0,-height)*scale(radiusx,radiusy)*unitcircle,p);
clip(clipped22,A--B--(B.x,B.y-radiusy-.05)--(A.x,A.y-radiusy-.05)--cycle);
add(shift(0,-2.5)*clipped22);

draw(pic3,O1--A,pg);
draw(pic3,O1--O,pg);

label(pic3,"$O$", 0+.1N);
label(pic3,"$r_1$", 0.5(A+O1)+.1S);

label(pic3,"$b)$", (-1,0) );

draw(pic3,(1,-.9)--(2,-.9),p,ArcArrow);


Label L1=Label("$S_1$",align=O,MidPoint,Fill(white));
draw(pic3,L1,O+.3W--B+.3W,Arrows(TeXHead),Bars);


real s   = 1;
real h   = s-s*cos(alphar/2);
real r   = s*sin(alphar/2);

// for correct tangentcy to ellipse
real radiusx = r;
real radiusy = .15;
real height  = s*cos(alphar/2);
real dh=height0-height;
write(dh);

pair a= (-radiusx*sqrt(1-(radiusy/height)*(radiusy/height)),radiusy*(radiusy/height));
pair b= (radiusx*sqrt(1-(radiusy/height)*(radiusy/height)),radiusy*(radiusy/height));

pair O1=(0,-s*cos(alphar/2));
pair A=s*dir(-alpha);
pair B=s*dir(-alpha-theta);

picture clipped111;
draw(clipped111,shift(0,-height)*scale(radiusx,radiusy)*unitcircle,pd);
clip(clipped111,A--B--(B.x,B.y+radiusy+.05)--(A.x,A.y+radiusy+.05)--cycle);
add(shift(0,-2.5)*clipped111);

picture clipped222;
draw(clipped222,shift(0,-height)*scale(radiusx,radiusy)*unitcircle,p);
clip(clipped222,A--B--(B.x,B.y-radiusy-.05)--(A.x,A.y-radiusy-.05)--cycle);
add(shift(0,-2.5)*clipped222);


draw(pic3,O1--A,pg);
label(pic3,"$r_2$", 0.5(A+O1)+.23S);
Label L1=Label("$S_2$",align=O,MidPoint,Fill(white));
draw(pic3,L1,O+.3E--A+.3E,Arrows(TeXHead),Bars);
//draw(pic3,L2,(xx,-0.5h)--(xx,0.5h),Arrows(TeXHead),Bars);

add(shift(0,-2.5)*pic3);

// pic4

real theta   = 60;
real alpha   = 0.5(180-theta);

real s   = 2;
pair O1=(0,-s*cos(alphar/2));
pair A=s*dir(-alpha);
pair B=s*dir(-alpha-theta);

path aa=arc(O,s,-alpha,-alpha-theta);


real s   = 1;
real h   = s-s*cos(alphar/2);
real r   = s*sin(alphar/2);

pair O11=(0,-s*cos(alphar/2));
pair A1=s*dir(-alpha);
pair B1=s*dir(-alpha-theta);

path aa1=arc(O,s,-alpha,-alpha-theta);

fill(pic4,A--A1--aa1--B1--B--aa--cycle,lightcyan);

draw(pic4,A1--A,p);
draw(pic4,B1--B,p);
draw(pic4,aa,p);
draw(pic4,aa1,p);
draw(pic4,O--s*dir(-alpha),p);
draw(pic4,O--s*dir(-alpha-theta),p);


path aa=arc(O,s,-alpha,-alpha-theta);
path bb=shift(0,-2s+2h)*rotate(180)*aa;

pair xx=0.5(A+O1);

label(pic4,"$O$", 0+.1N);

draw(pic4,"$\theta$",arc(O,0.4,-alpha,-alpha-theta),PenMargins);

Label L1=Label("$\Delta s$",align=O,MidPoint,Fill(white));
draw(pic4,L1,A1+.3E--A+.3E,Arrows(TeXHead),Bars);

label(pic4,"$A=2\pi \left( \frac{r_1+r_2}{2} \right ) \Delta s$", O+1.5S);

add(shift(3,-2.5)*pic4);
