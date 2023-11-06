import graph;
import geometry;
import gsl;
import BezierLib;

usepackage("amsmath");
usepackage("mtpro2");

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


picture pic1, pic2;

pen p=black+1pt;
pen pthin=black+.6pt;
pen pr=red+1pt;
pair O=(0,0);

draw(pic1,arc(O,1,0,180),pr);

int n = 3;

fill(pic1,O--(sqrt(1-(1/n)^2),0)--(sqrt(1-(1/n)^2),1/n)--cycle,mediumgray);

for ( int i = 0; i < n; ++i)
{
	real r = sqrt(1-(i/n)^2);
	real yy = i/n;
	real yy1 = yy + 1/n;
	path rec = (-r,yy)--(r,yy)--(r,yy1)--(-r,yy1)--cycle ;
	draw(pic1,rec,p);
}



label(pic1,"$r_1$",(0.5,-0.15));
label(pic1,"$O$",(0.,-0.15));
label(pic1,"$1$",(0.7,0.1));
//label(pic1,"$r_3$",(0.4,0.55));
label(pic1,"$A$",(sqrt(1-(1/n)^2),-0.15));
label(pic1,"$B$",(sqrt(1-(1/n)^2),1/n)+(.1,.1));

draw(pic1,O--(sqrt(1-(1/n)^2),1/n),pthin);
draw(pic1,(sqrt(1-(1/n)^2),1/n)--(sqrt(1-(1/n)^2),0),pthin);
draw(pic1,O--(sqrt(1-(2/n)^2),2/n),pthin);

label(pic1,"$a)$",(-0.3,-0.15));
label(pic2,"$b)$",(-0.3,-0.15));

dot(pic1,O,black+4pt);

add(pic1);



int n = 8;

for ( int i = 0; i < n; ++i)
{
	real r = sqrt(1-(i/n)^2);
	real yy = i/n;
	real yy1 = yy + 1/n;
	path rec = (-r,yy)--(r,yy)--(r,yy1)--(-r,yy1)--cycle ;
	fill(pic2,rec,mediumgray);
	draw(pic2,rec,p);
}
draw(pic2,arc(O,1,0,180),pr);

add(shift(3,0)*pic2);