import graph;
import geometry;
import gsl;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

real a=2; 
real b=.8; 
real h=4;

pair ellipse_param(real t)
{
	return (a*cos(t), b*sin(t));
}

pen p =black+1pt;
pen pd =dashed+1pt;

void draw_a_cube(picture pic, real a, real b, real c)
{
  pair A=(0,0);
  pair B=(a,0);
  pair C=(a,c);
  pair D=(0,c);

  pair xx=0.7*a*dir(40);

  pair A1=(0,0)+xx;
  pair B1=(a,0)+xx;
  pair C1=(a,c)+xx;
  pair D1=(0,c)+xx;

  pair ce=(.8a,.8a);

  fill(pic,A--B--B1--A1--cycle,mediumgray);
  fill(pic,A--B--ce--cycle,mediumgray);
  fill(pic,B--B1--ce--cycle,mediumgray);
  fill(pic,A--A1--ce--cycle,mediumgray);
  draw(pic,A--B--C--D--cycle,p);



  draw(pic,A1--B1,pd);
  draw(pic,A1--D1,pd);
  draw(pic,B1--C1--D1,p);

  draw(pic,B--B1,p);
  draw(pic,C--C1,p);
  draw(pic,D--D1,p);
  draw(pic,A--A1,pd);

  draw(pic,B--ce--A,p);
  draw(pic,B1--ce--A1,p);

  draw(pic,A--ce--D,p);
  draw(pic,A1--ce--D1,p);

}

picture pic1, pic2, pic3;

// pic1

real a = 3;

draw_a_cube(pic1,a,a,a);

label("$a$",(0.5a,-0.6));
label("$a$",(1.7a,a));
label("$a$",(1.4a,.5));

string s1="vol=$a^3/6$";

object box1=draw(pic1,s1,box,(.7a,-1.4),xmargin=.2mm,Fill(yellow));

add(pic1);

// pic2

void draw_a_cube1(picture pic, real a, real b, real c)
{
  pair A=(0,0);
  pair B=(a,0);
  pair C=(a,c);
  pair D=(0,c);
  pair xx=0.7*a*dir(40);

  pair A1=(0,0)+xx;
  pair B1=(a,0)+xx;
  pair C1=(a,c)+xx;
  pair D1=(0,c)+xx;
  pair ce=(.7a,1.2c);




  fill(pic,A--B--B1--A1--cycle,mediumgray);
  fill(pic,A--B--ce--cycle,mediumgray);
  fill(pic,B--B1--ce--cycle,mediumgray);
  fill(pic,A--A1--ce--cycle,mediumgray);
  draw(pic,A--B--C--D--cycle,p);

  draw(pic,A1--B1,pd);
  draw(pic,A1--D1,pd);
  draw(pic,B1--C1--D1,p);

  draw(pic,B--B1,p);
  draw(pic,C--C1,p);
  draw(pic,D--D1,p);
  draw(pic,A--A1,pd);

  draw(pic,B--ce--A,p);
  draw(pic,B1--ce--A1,p);

}

real a = 3;

draw_a_cube1(pic2,a,a,a/1.6);

label(pic2,"$a$",(0.5a,-0.6));
label(pic2,"$a/2$",(1.7a,.7a));
label(pic2,"$a$",(1.4a,.5));

string s2="vol=$a^3/6=\displaystyle\frac{1}{3}[(a^2)\frac{a}{2}]$";

object box1=draw(pic2,s2,box,(.7a,-1.4),xmargin=.2mm,Fill(yellow));

add(shift(6,0)*pic2);


