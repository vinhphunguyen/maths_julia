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

real theta=degrees(pi/12);
real theta2=2theta;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

draw(pic2,unitcircle,black+1.pt);
draw(pic2,rotate(theta)*polygon(12),orange+1.pt);

pair C = (1,0)+dir(4theta2);
pair C1 = dir(2theta2);
write(C);
write(C1);

draw(pic2,(0,0)--(1,0),blue,ArcArrow);
draw(pic2,(0,0)--dir(4theta2),blue,ArcArrow);
draw(pic2,(0,0)--dir(2theta2),dashed+blue,ArcArrow);
draw(pic2,(0,0)--dir(8theta2),blue,ArcArrow);
draw(pic2,(0,0)--dir(10theta2),dashed+blue,ArcArrow);


label("$O$",(-0.2,0));
label("$j,j^4$",dir(4theta2)+(0,0.2));
label("$j^2,j^5$",dir(8theta2)+(0,-0.2));
label("$j^3,j^6$",(1,0)+(.2,0.1));
label("$1+j$",dir(2theta2)+(.23,0.1));
label("$1+j^2$",dir(-2theta2)+(0.2,-.1));

draw(pic2,(1,0)--dir(4theta2),red+0.8pt);
draw(pic2,dir(4theta2)--dir(8theta2),red+0.8pt);
draw(pic2,dir(12theta2)--dir(8theta2),red+0.8pt);

//pair H=extension( (0,0),(0,0)+dir(theta),(1,0),dir( theta2 ) );

//perpendicular(pic2,H,NE,(1,0)--dir(degrees(pi/4)),blue);

//draw(pic2,"$\pi/8$",arc((0,0),0.35,0,theta),PenMargins);
//draw(pic2,"$\pi/4$",arc((0,0),0.35,theta2,theta2*2),PenMargins);

draw(pic2,"$120^\circ$",arc((0,0),0.23,0,4theta2),PenMargins);

for( int i = 0; i < 12; ++i)
{
  dot(pic2,dir(i*theta2),black+3pt);
}



dot(pic2,dir(0*theta2),red+5pt);
dot(pic2,dir(4*theta2),red+5pt);
dot(pic2,dir(8*theta2),red+5pt);



add(pic2);
