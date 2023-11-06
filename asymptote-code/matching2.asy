unitsize(3cm);
import markers;

usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf


pair A = (0, 0);
pair B = (1, 0);
pair C = (1,1);
pair D = (0,1);

real x = 0.3;
pair AB = (0.5,0);
pair CD = (0.5,1);
pair e  = (0.5+x,0);
pair f  = (0.5-x,1);


picture pic1, pic2;

fill(pic1,A--B--D--cycle,lightgray);

draw(pic1,B--D,red+1);

draw(pic1, A--B, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic1, B--C, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic1, C--D, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic1, A--D, blue+linewidth(1.),marker(dotframe,markuniform(3)));

add(pic1);

fill(pic2,A--e--f--D--cycle,lightgray);

draw(pic2,AB--CD,dashed);
draw(pic2,e--f,red+1pt);

draw(pic2, A--B, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic2, B--C, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic2, C--D, blue+linewidth(1.),marker(dotframe,markuniform(3)));
draw(pic2, A--D, blue+linewidth(1.),marker(dotframe,markuniform(3)));

label(pic2, "$1$",(.6,.75));
label(pic2, "$x$",(.35,.95));


add(shift(1.3,0)*pic2);