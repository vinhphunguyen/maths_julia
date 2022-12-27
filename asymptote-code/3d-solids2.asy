import graph;
import geometry;
import gsl;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

real a=2.6; 
real b=.47; 
real h=4;

pair ellipse_param(real t)
{
	return (a*cos(t), b*sin(t));
}

pair ellipse_param_der(real t)
{
  return (-a*sin(t), b*cos(t));
}



pen p =black+1pt;
pen pd =dashed+1pt;


picture pic1, pic2, pic3;

// pic1

pair A=(0,0);
pair B=(3,0);
pair C=(4,1.5);
pair D=(1,1.5);
pair cen=0.25(A+B+C+D);
pair G=(cen.x,5);

draw(pic1,A--B--G,p);
draw(pic1,A--G,p);
draw(pic1,C--G,p);
draw(pic1,D--G,pd);
draw(pic1,D--A,pd);
draw(pic1,B--C,p);
draw(pic1,D--C,pd);


label(pic1,"PYRAMID",(0.7a,6));
label(pic2,"CONE",(0.2a,6));
label(pic3,"SPHERE",(0.1a,6-1.9));

add(pic1);

// pic2

path el_up   = graph(ellipse_param,0,pi);
path el_do   = graph(ellipse_param,pi,2pi);

pair P1=ellipse_param(0);
pair P2=ellipse_param(pi);

draw(pic2,el_up,pd);
draw(pic2,el_do,p);

real t0 = 0.1;
pair ellipse_tangent_p01(real t)
{
  pair P0 = ellipse_param(t0);
  pair va = ellipse_param_der(t0);
  return (P0.x + t*va.x, P0.y + t * va.y);
}


real tmin=-10., tmax=10.8;

path el_tangent1 = graph(ellipse_tangent_p01,tmin,tmax);


real t0 = pi-0.1;
pair ellipse_tangent_p02(real t)
{
  pair P0 = ellipse_param(t0);
  pair va = ellipse_param_der(t0);
  return (P0.x + t*va.x, P0.y + t * va.y);
}

path el_tangent2 = graph(ellipse_tangent_p02,tmin,tmax);

//draw(pic2,el_tangent1,p);
//draw(pic2,el_tangent2,p);

pair Ds []=intersectionpoints(el_tangent1,el_tangent2);
write(Ds);

pair G=Ds[0];
draw(pic2,P1--G--P2,p);

add(shift(7,0)*pic2);


// pic3

draw(pic3,scale(2.5)*unitcircle,p);

real a=2.5; 
real b=.6; 

pair ellipse_param(real t)
{
  return (a*cos(t), b*sin(t));
}

pair ellipse_param_der(real t)
{
  return (-a*sin(t), b*cos(t));
}

path el_up   = graph(ellipse_param,0,pi);
path el_do   = graph(ellipse_param,pi,2pi);

draw(pic3,rotate(90)*el_up,p);
draw(pic3,rotate(90)*el_do,pd);

add(shift(13.5,1.9)*pic3);

