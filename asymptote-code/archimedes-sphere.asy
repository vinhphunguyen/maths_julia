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

// parametric representation of the ellipse

pair ellipse_param(real t)
{
	return (a*cos(t), b*sin(t));
}

// derivative of the above function

pair ellipse_param_der(real t)
{
  return (-a*sin(t), b*cos(t));
}



// pens

pen p =black+1pt;
pen pd =dashed+1pt;


picture pic1, pic2, pic3;

// pic3: hemisphere

path half_circle = Arc((0,0), 1, 0, 180);

draw(pic3,scale(2.5)*half_circle,p);

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

draw(pic3,rotate(0)*el_up,pd);
draw(pic3,rotate(0)*el_do,p);

draw(pic3, (0,0)--(a,0));

label("$R$", (0.5a,0.2) );

add(pic3);

// pic2 (an ellipse)

path el_up   = graph(ellipse_param,0,pi);
path el_do   = graph(ellipse_param,pi,2pi);

draw(pic2,el_up,pd);
draw(pic2,el_do,p);

draw(pic2,shift(0,a)*el_up,p);
draw(pic2,shift(0,a)*el_do,p);

draw(pic2, (a,0)--(a,a),p);
draw(pic2, (-a,0)--(-a,a),p);

// tangents to the ellipse

real t0 = -0.2;
pair ellipse_tangent_p01(real t)
{
  pair P0 = ellipse_param(t0);
  pair va = ellipse_param_der(t0);
  return (P0.x + t*va.x, P0.y + t * va.y + a);
}

real t0 = pi+0.2;
pair ellipse_tangent_p02(real t)
{
  pair P0 = ellipse_param(t0);
  pair va = ellipse_param_der(t0);
  return (P0.x + t*va.x, P0.y + t * va.y + a);
}

real tmin=-100., tmax=100.8;

path el_tangent1 = graph(ellipse_tangent_p01,tmin,tmax);
path el_tangent2 = graph(ellipse_tangent_p02,tmin,tmax);


pair Ds []=intersectionpoints(el_tangent1,el_tangent2);
write(Ds);

pair G=Ds[0];


draw(pic2,(-a,a)--G--(a,a),p);

draw(pic2,(0,a)--(a,a),p);

label(pic2, "$R$", (0.5a,a+0.33) );

label(pic2, "$R$", (a+0.3,0.5a) );

add(shift(7,0)*pic2);




