import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(16pt));

picture pic1, pic2;


// pic2

real theta=degrees(2pi/5);
real alpha=90-theta;
real theta2=90-theta;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

draw(pic2,unitcircle,black+1.pt);
draw(pic2,rotate(-alpha)*polygon(5),orange+1.pt);

pair C = (1,0)+dir(4theta2);
pair C1 = dir(2theta2);
write(C);
write(C1);

draw(pic2,(0,0)--(1,0),blue);
draw(pic2,(0,0)--dir(theta),blue);
draw(pic2,(0,0)--dir(2theta),blue);
draw(pic2,(0,0)--dir(3theta),blue);
draw(pic2,(0,0)--dir(4theta),blue);


label("$O$",(-0.2,0));
label("$k=1$",dir(4theta2)+(0,0.2));
label("$k=2$",dir(2theta)+(-0.2,0.2));
label("$k=3$",dir(3theta)+(-0.2,-0.2));
label("$k=4$",dir(4theta)+(0,-0.2));
label("$k=0$",(1,0)+(.4,0.1));

draw(pic2,(1,0)--dir(4theta2),red+0.8pt);
draw(pic2,dir(4theta2)--dir(8theta2),red+0.8pt);
draw(pic2,dir(12theta2)--dir(8theta2),red+0.8pt);

//pair H=extension( (0,0),(0,0)+dir(theta),(1,0),dir( theta2 ) );

//perpendicular(pic2,H,NE,(1,0)--dir(degrees(pi/4)),blue);

//draw(pic2,"$\pi/8$",arc((0,0),0.35,0,theta),PenMargins);
//draw(pic2,"$\pi/4$",arc((0,0),0.35,theta2,theta2*2),PenMargins);

draw(pic2,"$2\pi/5$",arc((0,0),0.2,0,4theta2),PenMargins);

for( int i = 0; i < 5; ++i)
{
  dot(pic2,dir(i*theta),black+6pt);
}


draw(pic2,Label("$\text{Re}$",Relative(0.99)),(-1.3,0)--(1.8,0),gray+.4pt,Arrow(TeXHead));
draw(pic2,Label("$\text{Im}$",Relative(0.99)),(0,-1.5)--(0,1.5),gray+.4pt,Arrow(TeXHead));

add(pic2);
