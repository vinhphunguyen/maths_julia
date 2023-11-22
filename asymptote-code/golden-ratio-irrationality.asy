import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));


void plot_label(pair A, pair B, string s, real l)
{
	pair AB=B-A;
	AB=AB/length(AB);
	real alpha=degrees(acos(AB.x));
	if ( AB.y < 0 ) alpha = -alpha;
	pair normal=(-AB.y,AB.x);
	label(rotate(alpha)*s,.5(A+B)+l*normal);
}

real alpha1=90;
real alpha2=90+360/5;
real alpha3=90+2*360/5;
real alpha4=90+3*360/5;
real alpha5=90+4*360/5;

pair A1=dir(alpha1);
pair A2=dir(alpha2);
pair A3=dir(alpha3);
pair A4=dir(alpha4);
pair A5=dir(alpha5);

pen p = black + .7pt;
pen pg = gray + .7pt;
pen pr = red + 1pt;

pair H = intersectionpoint(A5--A3, A1--A4);

markangle("$36^\circ$",A3,A1,A4,n=1,radius=9mm,Fill(orange));
markangle("$72^\circ$",A1,A4,A3,n=1,radius=5mm,Fill(cyan));
markangle("$72^\circ$",A4,A3,A1,n=1,radius=5mm,Fill(cyan));
markangle("$72^\circ$",A3,H,A4,n=1,radius=5mm,Fill(cyan));


draw(A1--A2--A3--A4--A5--cycle,p);
draw(unitcircle,p);
draw(A1--A3,pr);
draw(H--A3,pr);
draw(A1--A4,pr);
draw(A3--A4,pr);

label("$A_1$",A1+.17NE);
label("$A_2$",A2+.17W);
label("$A_3$",A3+.17SW);
label("$A_4$",A4+.17E);
label("$A_5$",A5+.17E);
label("$H$",H+.14E);
label("$a$",.5(A1+A3)+.14E);
label("$b$",.5(A4+A3)+.12S);
label("$b$",.5(H+A3)+.14N);
label("$b$",.5(H+A1)+.14E);
plot_label(H, A4, "$a-b$",.13);

dot(A1,red+4pt);
dot(A2,red+4pt);
dot(A3,red+4pt);
dot(A4,red+4pt);
dot(A5,red+4pt);
dot(H,red+4pt);



