import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(16cm, keepAspect=true);
defaultpen(fontsize(11pt));

picture pic1, pic2;


// pic2

int n = 6;
real theta=degrees(2pi/n);
real thetad2=0.5theta;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

real factor=1/cos(pi/n);

pair A=dir(theta);
pair Ap=factor*dir(0);
pair Bp=factor*dir(theta);
pair Hp=dir(thetad2);
pair H=extension( (0,0),(0,0)+dir(thetad2),(1,0),dir( theta ) );


fill(pic2,(0,0)--H--A--cycle,pink);
fill(pic2,(0,0)--Hp--Ap--cycle,mediumgreen);

draw(pic2,unitcircle,black+1.pt);
draw(pic2,polygon(n),red+1.pt);
draw(pic2,scale(factor)*polygon(6),blue+1.pt);


draw(pic2,(0,0)--(1,0),blue);


perpendicular(pic2,H,NE,(1,0)--dir(theta),blue);
perpendicular(pic2,Hp,NW,Ap--Bp,blue);

//draw(pic2,"$\pi/8$",arc((0,0),0.35,0,theta),PenMargins);
//draw(pic2,"$\pi/4$",arc((0,0),0.35,theta2,theta2*2),PenMargins);

pen p = black + 1.2pt;
draw(pic2,(0,0)--dir(theta),p);
draw(pic2,(0,0)--dir(thetad2),p);
draw(pic2,(0,0)--Ap,p);

label(pic2,"$O$",(-0.1,0));
label(pic2,"$A$",(0.8,-0.1));
label(pic2,"$A'$",Ap+.1E);
label(pic2,"$B$",dir(60)+.1S);
label(pic2,"$B'$",factor*dir(60)+.1E);
label(pic2,"$H$",H+.1S);
label(pic2,"$H'$",dir(30)+.1E);
label(pic2,"$1$",(0.2,0.45));

draw(pic2,"$\theta$",arc((0,0),0.25,0,thetad2),PenMargins);
draw(pic2,"$\theta$",arc((0,0),0.25,thetad2,theta),PenMargins);

dot(pic2,(1,0),black+4pt);
dot(pic2,dir(theta),black+4pt);
dot(pic2,factor*dir(0),black+4pt);
dot(pic2,factor*dir(theta),black+4pt);

label(pic2,"$a)$",(-1,-1));
label(pic1,"$b)$",(-1,-1));

add(pic2);

// pic1
int n =12;
real factor=1/cos(pi/n);

real theta=degrees(2pi/n);
real thetad2=0.5theta;

pair A=dir(theta);
pair Ap=factor*dir(0);
pair Bp=factor*dir(theta);
pair Hp=dir(thetad2);
pair H=extension( (0,0),(0,0)+dir(thetad2),(1,0),dir( theta ) );



draw(pic1,unitcircle,black+1.pt);
draw(pic1,polygon(n),red+1.pt);
draw(pic1,scale(factor)*polygon(n),blue+1.pt);



add(shift(2.6,0)*pic1);
