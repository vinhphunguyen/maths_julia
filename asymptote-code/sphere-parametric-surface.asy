import graph3;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf";
settings.render = 0;
defaultrender.merge=true;

size(8cm,0);
currentprojection=orthographic((10,10,7),zoom=.99);

// pic2 

real a=3, b=1, dy=.5;

triple f(pair p){
  real phi=p.x;
  real theta=p.y;
  real x=a*sin(phi)*cos(theta) ;
  real y=a*sin(phi)*sin(theta);
  real z=a*cos(phi) ;
  return (x,y,z);
}

picture pic1;
surface s2=surface(f,(0,0),(pi/2,pi),nu=20, nv=20);
draw(pic1,s2,lightgray+opacity(.6),meshpen=blue);

xaxis3(pic1,"$x$",0,a+0.9,Arrow3);
yaxis3(pic1,"$y$",0,a+0.9,Arrow3);
zaxis3(pic1,"$z$",0,a+0.9,Arrow3);

add(shift(0,0,0)*pic1);

