import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6.4cm, keepAspect=true);
defaultpen(fontsize(12pt));


void plot_label(picture pic, pair A, pair B, string s, real l)
{
	pair AB=B-A;
	AB=AB/length(AB);
	real alpha=degrees(acos(AB.x));
	if ( AB.y < 0 ) alpha = -alpha;
	pair normal=(-AB.y,AB.x);
	label(pic,rotate(alpha)*s,.5(A+B)+l*normal,blue);
}

picture pic1, pic2, pic3;

// pic 2

real alpha=20;
real r = 1;

pair O=(0,0);


real alpha1=20;
real alpha2=20+90;
real alpha3=180+45;
real alpha4=180+75;

draw(pic3,unitcircle,red+1.2pt);


// pic1 

real alpha1=0;
real alpha2=180;
real alpha3=90+20;
real alpha4=180+85;

draw(pic1,unitcircle,red+1.2pt);

pair A=dir(alpha2);
pair C=dir(alpha1);
pair B=dir(alpha3);
pair D=dir(alpha4);


draw(pic1,O--A,black+.8pt);
draw(pic1,O--C,black+.8pt);
draw(pic1,B--D,black+.8pt);
draw(pic1,A--B--C--D--cycle,black+.8pt);

label(pic1,"$O$",(0.02,-0.2),blue);
label(pic1,"$A$",A+(-0.15,0.),blue);
label(pic1,"$B$",B+.1N,blue);
label(pic1,"$C$",C+(0.05,0.2),blue);
label(pic1,"$D$",D+(0.05,-0.2),blue);

label(pic1,"$|AC|=1$",D+(0.9,0),blue);

perpendicular(pic1, B,SE,B--C,blue);
perpendicular(pic1, D,NE,D--C,blue);

markangle("$\alpha$",C,A,B,n=1,radius=7mm);
markangle("$\beta$",D,A,C,n=2,radius=7mm);

plot_label(pic1, B, C, "$\sin\alpha$",.1);
plot_label(pic1, A, B, "$\cos\alpha$",.1);
plot_label(pic1, D, C, "$\sin\beta$",.1);
plot_label(pic1, A, D, "$\cos\beta$",.1);
plot_label(pic1, D, B, "$\sin(\alpha+\beta)$",.1);

dot(pic1,O,blue+3pt);
dot(pic1,A,blue+3pt);
dot(pic1,B,blue+3pt);
dot(pic1,C,blue+3pt);

add(pic1);


