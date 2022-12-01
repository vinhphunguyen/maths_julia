import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(14pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.2pt;

real alpha = 60;

pair O = (0,0);
pair C = (1,0);
pair A = dir(alpha);

path arcc=arc(O,.3,0,alpha);

pair xx= O + 0.3*dir(0); 
pair yy= O + 0.3*dir(alpha); 

fill(pic2,O--xx--arcc--yy--cycle,pink);

draw(pic2,unitcircle,p);
draw(pic2,O--A,p);
draw(pic2,O--C,p);

label(pic2,"$O$",O+0.12W);
label(pic2,"$A$",A+0.12NE);
label(pic2,"$B$",C+0.12E);
label(pic2,"$r$",(.1,.5));


draw(pic2,"$1$ rad",arc(O,.3,0,alpha),PenMargins);
draw(pic2,"$r$",arc(O,1,0,alpha),red+1.2pt);



add(pic2);


