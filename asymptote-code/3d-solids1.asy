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
}

picture pic1, pic2, pic3;

// pic1

real a = 3;

draw_a_cube(pic1,a,a,a);

label("CUBE",(0.7a,a+3));
label(pic2,"CUBOID",(0.7a,6));
label(pic3,"CYLINDER",(0.1a,2));

label("$a$",(0.5a,-0.6));
label("$a$",(-0.5,.5a));
label("$a$",(1.4a,.5));

string s1="vol=$a^3$";
string s2="vol=$abc$";
string s3="vol=$\pi r^2 h$";

object box1=draw(pic1,s1,box,(.7a,-1.4),xmargin=.2mm,Fill(yellow));
object box2=draw(pic2,s2,box,(.7a,-1.4),xmargin=.2mm,Fill(yellow));
object box3=draw(pic3,s3,box,(.1a,-1.4-h),xmargin=.2mm,Fill(yellow));

add(pic1);

// pic2

real a = 2.7, b=2, c=4;

draw_a_cube(pic2,a,b,c);



label(pic2,"$a$",(0.5a,-0.6));
label(pic2,"$c$",(1.8a,.6c));
label(pic2,"$b$",(1.6a,.5));

add(shift(5.5,0)*pic2);


// pic3
real tmin=-0.7, tmax=0.8;

path el_up    = graph(ellipse_param,0,2pi);
path el_do1   = graph(ellipse_param,0,pi);
path el_do2   = graph(ellipse_param,pi,2pi);

pair P1=ellipse_param(0);
pair P2=ellipse_param(pi);
pair Q1=shift(0,-h)*P1;
pair Q2=shift(0,-h)*P2;
pair O2=shift(0,-h)*(0,0);

draw(pic3,el_up,p);
draw(pic3,shift(0,-h)*el_do1,pd);
draw(pic3,shift(0,-h)*el_do2,p);
draw(pic3,P1--Q1,p);
draw(pic3,P2--Q2,p);

draw(pic3,O2--Q1,p);

label(pic3,"$h$",(Q1.x+.6,-2.1));
label(pic3,"$r$", .5(O2+Q1) + .4N );


add(shift(13.5,h)*pic3);

