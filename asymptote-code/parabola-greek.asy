import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p =black+1pt;
pen pr =red+.8pt;
pen pp =purple+.5pt;

//draw(A--B--C--cycle,p);

real a = 1;
real x0 = 0;
real delta = 1;
int  n = 5;

pair O=(0,0);
pair A=(2a,0);

draw(O--A,p);

path myCurve = O;

for (int i = 0; i <= n; ++i) {
	real xi = x0 + i * delta;
	pair Bi = (-xi,0);
	draw(O--Bi,p);
	path circle = Circle(0.5(A+Bi), .5*length(A-Bi));
	draw(circle,pp);
	real y = sqrt(2a*xi);
	pair Z=(0,y);
	draw(O--Z,p);
	//dot(Z,red+4pt);

	if ( i >= 1 ){
		draw(Z--(Bi.x,Z.y)--Bi);

		myCurve = myCurve .. (Bi.x,Z.y);
	}
}

label("$2a$", (a,-0.4) );
label("$x$", (-delta/2,-0.4) );

real f(real x) { return sqrt(-2*a*x); }

// Create paths for both branches of the parabola
path parabola_top = graph(f, 0, -5); // Adjust the range of x as needed

// Draw the parabola
draw(parabola_top, red+1pt);
