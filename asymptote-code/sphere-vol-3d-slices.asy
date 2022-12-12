import solids;

settings.render=0;
settings.prc=false;

size(12cm,0);
settings.outformat="pdf"; // output is pdf
currentprojection = orthographic(20,30,10);


real R=4, h=0; // radius of the sphere

int n=6; // number of cylinders

real st = R/n; // thickness of one cylinder

// O1-----------0----------A
// --------R----x-----R----x
triple O=(0,0,0);
triple O1=(sqrt(R^2-h^2),0,h);
triple A=(0,0,R);

// make an arc, then rotate it around Z axis 360 degrees to get the hemisphere
path3 ar=arc(O,O1,A);
revolution cc=revolution(O,ar,axis=Z,0,360);



// now plot the cylinders
path3 l; real h1;

real f(real t) {return sqrt(R^2-t^2);}

// loop to build n cylinder
for(int i=0;i < n;++i)
{
	real z1=st*i+h;      // z-coord of the bottom surface of "i" cylinder
	real z2=st*(i+1)+h;  // z-coord of the top surface of "i" cylinder
	real x1=f(z1);       // radius 
	h1  = z2;
	l=l--(x1,0,z1)--(x1,0,z2); // 
}

l=l--(0,0,h1);
revolution sur=revolution(O,l,Z,0,360);
draw(surface(sur), mediumgray+opacity(.6), meshpen=gray, light=White);


//draw(cc.silhouette(),black+1pt);
draw(surface(cc), blue, meshpen=gray, nolight);

//dot(A,red+4pt);
//dot(O,blue+4pt);
//dot(O1,cyan+4pt);


//shipout(bbox(1mm,invisible,FillDraw(white)));

