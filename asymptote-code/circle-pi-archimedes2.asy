import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2;


// pic2

int n = 6;
real theta=degrees(2pi/n);
real thetad2=0.5theta;

//fill(pic2,(0,0)--(1,0)--dir(theta2)--cycle,mediumgray);

real factor=1/cos(pi/n);
pair O=(0,0);
pair A=dir(theta);
pair Ap=factor*dir(0);
pair Bp=factor*dir(theta);
pair Hp=dir(thetad2);
pair H=extension( (0,0),(0,0)+dir(thetad2),(1,0),dir( theta ) );


fill(pic2,(0,0)--H--A--cycle,pink);
fill(pic2,(0,0)--H--(1,0)--cycle,mediumgreen);

draw(pic2,unitcircle,black+1.1pt);
draw(pic2,polygon(n),purple+1.pt);
draw(pic2,scale(factor)*polygon(6),blue+1.pt);
//draw(pic2,scale(1/cos(pi/12))*polygon(12),red+1.pt);

draw(A--Bp,black+1pt);
draw(pic2,(0,0)--(1,0),blue);


perpendicular(pic2,H,NE,(1,0)--dir(theta),blue);
perpendicular(pic2,Hp,NW,Ap--Bp,blue);

//draw(pic2,"$\pi/8$",arc((0,0),0.35,0,theta),PenMargins);
//draw(pic2,"$\pi/4$",arc((0,0),0.35,theta2,theta2*2),PenMargins);

pen p = black + 1.2pt;
draw(pic2,(0,0)--dir(theta),p);
draw(pic2,(0,0)--dir(thetad2),p);
draw(pic2,(0,0)--Ap,p);

label(pic2,"$O$",(-0,-0.1));
label(pic2,"$A$",(1,-0.1));
label(pic2,"$A'$",Ap+.1S);
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

clip(pic2,(-0.05,-0.02)--Ap+(0.03,-.02)--(Ap.x,Bp.y)+.1N -- (-0.05,Bp.y+.1) -- cycle );

add(pic2);

label(pic1,"$O$",(-0,-0.1));
label(pic1,"$A$",(1,-0.1));
label(pic1,"$A'$",Ap+.1S);

add(pic1);


