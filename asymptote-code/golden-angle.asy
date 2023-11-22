import geometry;
import graph;

settings.outformat="pdf"; // output is pdf

size(5cm, keepAspect=true);
defaultpen(fontsize(12pt));


real goldenAngle = degrees(2*pi*(1 - (sqrt(5) - 1)/2));  // Golden angle in radians

// Function to draw an arc
void drawArc(pair center, real rad, real startAngle, real endAngle, pen color) {
	draw(center--(center + rad * dir(startAngle)), color);
	draw(center--(center + rad * dir(endAngle)), color);
    draw(arc(center, rad, startAngle, endAngle), color);
}

// Draw the unit circle
//draw(Circle((0,0), 1), linewidth(1));
//write(goldenAngle);
//markangle("$\theta$",(1,0),(0,0),dir(goldenAngle),n=1,radius=4mm,Fill(orange));
//drawArc((0,0), 1, 0,           goldenAngle, red+1pt);
//drawArc((0,0), 1, goldenAngle, 360, blue+1pt);

// Label the angles
//label("$a$", dir(goldenAngle/2), dir(goldenAngle/2), red);
//label("$b$", dir(3*goldenAngle/2), dir(3*goldenAngle/2), blue);




// size(150);

// // Function to draw a filled simple leaf
// path makeLeaf(real x, real y, real scale) {
//     pair leafTop   = (x, y + 0.2*scale);
//     pair leafLeft  = (x - 0.2*scale, y);
//     pair leafRight = (x + 0.2*scale, y);
    
//     path leaf = leafTop .. controls 
//           (leafLeft + (0.1*scale, -0.1*scale)) and 
//           (leafLeft - (0.1*scale, -0.1*scale)) .. leafTop .. cycle;
    
//     return leaf;
// }

// // Draw a filled green leaf
// real scale = 0.1;
// path leaf = makeLeaf(0, 0, scale);
// path l1   = rotate(goldenAngle,(0,0.2*scale))*leaf;
// path l2   = rotate(2*goldenAngle,(0,0.2*scale))*leaf;
// path l3   = rotate(3*goldenAngle,(0,0.2*scale))*leaf;
// path l4   = rotate(4*goldenAngle,(0,0.2*scale))*leaf;
// //label("$1$",(0,0.2*scale) - (.008,.008));
// //label("$2$",(0,0.2*scale) + (.008,.002));
// //label("$3$",(0,0.2*scale) + (-.008,.007));

// filldraw(leaf,green);
// filldraw(l1,green);
// filldraw(l2,green);
// filldraw(l3,green);
// filldraw(l4,green);

// dot((0,0.2*.1),blue+4pt);
pen p = black + 2pt;

void doo(pen p, int level, real ang){
	for (int i = 0; i < level; ++i){
		real theta = i*ang;
		pair pt = sqrt(i)*(cos(theta),sin(theta));
		dot(pt,p);
	}

}

real ang1 = radians(360/4);
real ang2 = pi*(3-sqrt(5));
real ang3 = radians(360/pi);

doo(p,800,ang2);