import graph;
import geometry;
import gsl;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

real a=1.2; 
real b=.8; 
real h=4;

pen p =black+1pt;
pen pd =dashed+1pt;

void draw_a_cube(picture pic, real a, real b, real c)
{
  pair A=(0,0);
  pair B=(a,0);
  pair C=(a,c);
  pair D=(0,c);

  draw(pic,A--B--C--D--cycle,p);

  pair xx=0.7*a*dir(40);

  pair A1=(0,0)+xx;
  pair B1=(a,0)+xx;
  pair C1=(a,c)+xx;
  pair D1=(0,c)+xx;

  draw(pic,A1--B1,pd);
  draw(pic,A1--D1,pd);
  draw(pic,B1--C1--D1,p);

  draw(pic,B--B1,p);
  draw(pic,C--C1,p);
  draw(pic,D--D1,p);
  draw(pic,A--A1,pd);

  draw(pic,"$90^\circ$",arc(C,0.8C+0.2D,0.8C+0.2B),PenMargins);
  draw(pic,"$90^\circ$",arc(C,0.8C+0.2C1,0.8C+0.2D),PenMargins);
  draw(pic,"$90^\circ$",arc(C,0.85C+0.15B,0.8C+0.2C1),PenMargins);
  dot(pic,C,red+3pt);
}

picture pic1, pic2, pic3;

// pic1

real a = 1.5;

draw_a_cube(pic1,a,a,a);


add(pic1);

// pic2

draw(pic2,unitsquare,p);
draw(pic2,shift(0,1)*unitsquare,p);
draw(pic2,shift(1,0)*unitsquare,p);
pair O=(1,1);
dot(pic2,O,red+3pt);

add(shift(3,0)*pic2);


