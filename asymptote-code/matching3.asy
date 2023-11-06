unitsize(1cm);
import markers;

usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf


pair A = (0, 0);
pair B = (4, 0);
pair C = (0,3);
pair D = (1,1);
pair F = (1,0);

real alpha = degrees ( atan (3/4) );
pair e = B + 3dir(180-alpha);

fill(F--B--e--D--cycle,lightgray);

draw(F--D,red+.7pt);
draw(e--D,red+.7pt);

draw(B--D,red+.7pt);

label("$1.5$",(2,.3));

draw(A--B, blue+linewidth(1.),marker(dotframe,markuniform(5)));
draw(B--C, blue+linewidth(1.),marker(dotframe,markuniform(6)));
draw(C--A, blue+linewidth(1.),marker(dotframe,markuniform(4)));








