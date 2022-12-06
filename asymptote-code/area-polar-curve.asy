import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(18cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


picture pic1, pic2, pic3;


pen p= black+1pt;
pen pr= red+1.3pt;
pen pp= black+.7pt;


// pic2

real a=1;
real f(real t){ 
  return a*(1+cos(t));
}

draw(pic2,Label("$x$",Relative(0.99)),(-.1,0)--(2.2,0),black+.9pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.1)--(0,1.6),black+.9pt,Arrow(TeXHead));

real xu=pi/18;
real xm=pi/3;

pair B= (f(xu)*cos(xu),f(xu)*sin(xu)); 
pair A= (f(xm)*cos(xm),f(xm)*sin(xm)); 


int n=500;
guide g=polargraph(f,xu,xm,n,operator ..);

label(pic2,"$r=f(\theta)$",(1.,1.6));

real theta1=degrees(atan2(B.y,B.x));
real theta2=degrees(atan2(A.y,A.x));

real Dtheta=theta2-theta1;
int n = 4;
real dtheta=Dtheta/n;
real fac=pi/180;

for ( int i = 0; i < n; ++i)
{
  real alpha= theta1 + (0.5+i)*dtheta;
  real rr = length(f(fac*alpha));
  path ggg = arc((0,0),rr,theta1+i*dtheta,theta1+i*dtheta+dtheta);
  path hhh1 = (0,0)--rr*dir(theta1+i*dtheta);
  path hhh2 = (0,0)--rr*dir(theta1+i*dtheta+dtheta);
  fill(pic2,hhh1--ggg--hhh2--cycle,cyan);
}


draw(pic2,g,pr);
draw(pic2,"$\theta_1$",arc((0,0),.8,0,theta1),black+.8pt);
draw(pic2,"$\theta_2$",arc((0,0),.4,0,theta2),black+.8pt);
draw(pic2,"$\Delta\theta$",arc((0,0),1,theta1,theta1+dtheta),black+.8pt);

for ( int i = 0; i < n; ++i)
{
  real alpha= theta1 + (0.5+i)*dtheta;
  real rr = length(f(fac*alpha));
  draw(pic2,arc((0,0),rr,theta1+i*dtheta,theta1+i*dtheta+dtheta),pp);
  draw(pic2,(0,0)--rr*dir(theta1+i*dtheta+dtheta),pp);
}

  real alpha= theta1 + (0.5+1)*dtheta;
  real rr = length(f(fac*alpha));
  pair Xx= rr*dir(alpha);
  dot(pic2,Xx,black+5pt);
  label(pic2,("$(f(\theta_i^\ast),\theta_i^\ast)$"),Xx+(0.1,.3));

draw(pic2,(0,0)--A,pr);
draw(pic2,(0,0)--B,pr);

add(pic2);

// pic1

real a=1;
real f(real t){ 
  return a*(1+cos(t));
}

draw(pic1,Label("$x$",Relative(0.99)),(-.1,0)--(2.2,0),black+.9pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.1)--(0,1.6),black+.9pt,Arrow(TeXHead));

pair B= (f(xu)*cos(xu),f(xu)*sin(xu)); 
pair A= (f(xm)*cos(xm),f(xm)*sin(xm)); 


int n=500;
guide g=polargraph(f,xu,xm,n,operator ..);

label(pic2,"$r=f(\theta)$",(1.,1.6));

real theta1=degrees(atan2(B.y,B.x));
real theta2=degrees(atan2(A.y,A.x));

real Dtheta=theta2-theta1;
int n = 8;
real dtheta=Dtheta/n;
real fac=pi/180;

for ( int i = 0; i < n; ++i)
{
  real alpha= theta1 + (0.5+i)*dtheta;
  real rr = length(f(fac*alpha));
  path ggg = arc((0,0),rr,theta1+i*dtheta,theta1+i*dtheta+dtheta);
  path hhh1 = (0,0)--rr*dir(theta1+i*dtheta);
  path hhh2 = (0,0)--rr*dir(theta1+i*dtheta+dtheta);
  fill(pic1,hhh1--ggg--hhh2--cycle,cyan);
}


draw(pic1,g,p);
draw(pic1,(0,0)--A,p);
draw(pic1,(0,0)--B,p);

for ( int i = 0; i < n; ++i)
{
  real alpha= theta1 + (0.5+i)*dtheta;
  real rr = length(f(fac*alpha));
  draw(pic1,arc((0,0),rr,theta1+i*dtheta,theta1+i*dtheta+dtheta),pp);
  draw(pic1,(0,0)--rr*dir(theta1+i*dtheta+dtheta),pp);
}

label(pic1,"$n=8$",(1.,1.6));

add(shift(2.5,0)*pic1);


// pic3

real a=1;
real f(real t){ 
  return a*(1+cos(t));
}

draw(pic3,Label("$x$",Relative(0.99)),(-.1,0)--(2.2,0),black+.9pt,Arrow(TeXHead));
draw(pic3,Label("$y$",Relative(0.99)),(0,-.1)--(0,1.6),black+.9pt,Arrow(TeXHead));

pair B= (f(xu)*cos(xu),f(xu)*sin(xu)); 
pair A= (f(xm)*cos(xm),f(xm)*sin(xm)); 


int n=500;
guide g=polargraph(f,xu,xm,n,operator ..);

label(pic2,"$r=f(\theta)$",(1.,1.9));

real theta1=degrees(atan2(B.y,B.x));
real theta2=degrees(atan2(A.y,A.x));

real Dtheta=theta2-theta1;
int n = 15;
real dtheta=Dtheta/n;
real fac=pi/180;

for ( int i = 0; i < n; ++i)
{
  real alpha= theta1 + (0.5+i)*dtheta;
  real rr = length(f(fac*alpha));
  path ggg = arc((0,0),rr,theta1+i*dtheta,theta1+i*dtheta+dtheta);
  path hhh1 = (0,0)--rr*dir(theta1+i*dtheta);
  path hhh2 = (0,0)--rr*dir(theta1+i*dtheta+dtheta);
  fill(pic3,hhh1--ggg--hhh2--cycle,cyan);
}


draw(pic3,g,p);
draw(pic3,(0,0)--A,p);
draw(pic3,(0,0)--B,p);

for ( int i = 0; i < n; ++i)
{
  real alpha= theta1 + (0.5+i)*dtheta;
  real rr = length(f(fac*alpha));
  draw(pic3,arc((0,0),rr,theta1+i*dtheta,theta1+i*dtheta+dtheta),pp);
  draw(pic3,(0,0)--rr*dir(theta1+i*dtheta+dtheta),pp);
}

label(pic3,"$n=15$",(1.,1.6));

add(shift(5,0)*pic3);
