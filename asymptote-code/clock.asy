import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2;


// pic2


real alpha = 30;
real rr    = 0.9;
real rr2    = 0.8;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

pen p = black+1.pt;
pen p1 = red+1.pt;
pen p2 = blue+1.pt;

pair O = (0,0);
draw(pic2,arc(O,1,0,360),p);

for(int i=0; i<12; ++i){
	real beta=i*alpha;
	draw(pic2,rr*dir(beta)--dir(beta),p);
}

for(int i=0; i<12; ++i){
	real beta=i*alpha;
	label(pic2, "$"+string(12-i)+"$", rr2*dir(90+beta) );
}

add(pic2);

// pic1

real alpha = 30;
real rr    = 0.9;
real rr3   = 0.6;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

pen p = black+1.pt;
pen p1 = red+1.pt;
pen p2 = blue+1.pt;

pair O = (0,0);
draw(pic1,arc(O,1,0,360),p);

for(int i=0; i<12; ++i){
	real beta=i*alpha;
	draw(pic1,rr*dir(beta)--dir(beta),p);
}

for(int i=0; i<12; ++i){
	real beta=i*alpha;
	label(pic1, "$"+string(12-i)+"$", rr2*dir(90+beta) );
	label(pic1, "$"+string(24-i)+"$", rr3*dir(90+beta) );
}

add(shift(2.3,0)*pic1);
