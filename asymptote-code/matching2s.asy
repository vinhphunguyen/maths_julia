unitsize(3cm);
import markers;
import geometry;

usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf


pair A = (0, 0);
pair B = (1, 0);
pair C = (1,1);
pair D = (0,1);

real x = 0.3;
pair AB = (0.5,0);
pair cen = (0.5,0.5);
pair CD = (0.5,1);
pair e  = (0.5+x,0);
pair f  = (0.5-x,1);

real alpha=30;

pair P = CD + .5dir(alpha-90);
pair Q = AB + .5dir(alpha+90);

picture pic1, pic2;

fill(pic1,A--AB--Q--P--CD--D--cycle,lightgray);

draw(pic1,CD--P--Q--AB,red+1);

draw(pic1,AB--CD,dashed);

draw(pic1, A--B, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic1, B--C, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic1, C--D, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic1, A--D, blue+linewidth(1.),marker(dotframe,markuniform(3)));

draw(pic1,arc(AB,cen,A));
draw(pic1,arc(CD,cen,C));

add(pic1);

// pic2 


real alpha=60;

pair P = CD + .5dir(alpha-90);
pair Q = AB + .5dir(alpha+90);

picture pic1, pic2;

fill(pic2,A--AB--Q--P--CD--D--cycle,lightgray);

draw(pic2,CD--P--Q--AB,red+1);

draw(pic2,AB--CD,dashed);

draw(pic2, A--B, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic2, B--C, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic2, C--D, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic2, A--D, blue+linewidth(1.),marker(dotframe,markuniform(3)));

draw(pic2,arc(AB,cen,A));
draw(pic2,arc(CD,cen,C));

label(pic2, "A", (.5,1.1));
label(pic2, "B", (.5,-.1));

markangle(pic2,scale(.5)*"$60^\circ$",radius=15,cen, CD, P,.5mm+red);

add(shift(1.3,0)*pic2);