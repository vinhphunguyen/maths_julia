import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);

// pic 2
int fsize=11;

void plot_label(pair A, pair B, string s, real l)
{
	pair AB=B-A;
	AB=AB/length(AB);
	real alpha=degrees(acos(AB.x));
	if ( AB.y < 0 ) alpha = -alpha;
	pair normal=(-AB.y,AB.x);
	label(rotate(alpha)*s,.5(A+B)+l*normal,blue+fontsize(fsize));
}

pen p = black + 1pt;

real theta=45;
real thetaR = theta * pi/180;

pair O=(0,0);
pair A=dir(0);
pair B=sqrt(2)*dir(theta);

perpendicularmark(line(O,A),line(A,B),quarter=2,size=5);

label("$1$",(0.5,-0.1),blue+fontsize(fsize));
label("$1$",(1.1,0.5),blue+fontsize(fsize));

draw(O--A--B--cycle,p);


void draw_one_trig(int i)
{
	real theta1=90+theta;
	pair B1=B + dir(theta1);
    draw(O--B--B1--cycle,p);
    perpendicularmark(line(O,B),line(B,B1),quarter=2,size=5);
  	theta += degrees(atan(1/sqrt(i+1)));
	plot_label(B1, B, "$1$",.13);
	B = B1;
}

void write_label(int i)
{
	real theta1=90+theta;
	pair B1=B + dir(theta1);
  	theta += degrees(atan(1/sqrt(i+1)));
    pair loc = 0.5(O+B1);
    label("$\sqrt{" + string(i+2) + "}$",loc,Fill(white), p=blue+ fontsize(fsize));
	B = B1;
}

void draw_spiral(int n)
{
	for(int i = 1; i < n; ++i)
	{
	   draw_one_trig(i);
	}
	theta=45;
	B = sqrt(2)*dir(theta); 

	for(int i = 1; i < n; ++i)
	{
	   write_label(i);
	}
}

// now, draw the spiral

int n = 16;

draw_spiral(n);

label("$\sqrt{" + string(2) + "}$",0.5(O+sqrt(2)*dir(45))+.1W,Fill(white),p=blue+fontsize(fsize));

