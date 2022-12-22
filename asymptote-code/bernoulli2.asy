import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf



real a = 2;
real b = 1.5;
real w = a+b;
real l = w+2;

int n = 4;
real b=l/n;
real alpha1=60;
real alpha2=50;
real ll=0.5;

pen p=black+1pt;
pen po=purple+.7pt;

pair aa=(0,b*sin(radians(90-alpha1)));
pair bb=(b,0);

for (int i =0; i < n; ++i)
{
	real dy = w/n;
	pair A = (0,-i*dy);
	pair B = (l,-i*dy);
	draw(A--B,p);
	label("medium $"+string(i+1)+"$", (l-.5,0.5dy-i*dy) );
	label("$\boxed{v_"+string(i+1)+"}$", (l-.5+0.8,0.5dy-i*dy) );
	draw(aa--bb,p);
	draw((bb.x,bb.y+ll)--(bb.x,bb.y-ll),po);
	draw("$\alpha_" + string(i+1) +"$",arc(bb,0.4,90,90+alpha1),PenMargins);
	if ( i != n-1) {
		draw(Label("$\alpha_" + string(i+2) +"$",Relative(1.1)),arc(bb,0.45,alpha2-90,-90),PenMargins);

	}
	aa = bb;
	bb = (bb.x+dy*tan(radians(alpha2)),bb.y-dy);
	alpha1=alpha2;
	alpha2 = alpha2-10;
}