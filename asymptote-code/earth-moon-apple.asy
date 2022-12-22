import graph;
import gsl; // for newton() solver

usepackage("amsmath");
usepackage("mtpro2");

size(6cm);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf

real re = 1.2;
real rm = 2;

pair O=(0,0);
pair A=(0,re);
pair M=rm*dir(40);

pen p=black+.8pt;

draw(unitcircle,p);
draw(O--A,p);
draw(O--M,p);

label("Earth",(0,-0.7));
label("$m_E$", O+.2W );
label("$r_E$", (-0.2,0.5) );
label("$r_M$", (1,0.6) );
label("apple",A + .4E);
label("Moon",M + .4W);

dot(O,black+9pt);
dot(A,black+3pt);
dot(M,black+5pt);

