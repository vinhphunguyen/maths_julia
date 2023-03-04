import graph3;

usepackage("amsmath");


settings.render = 24;


size(8cm,0);
currentprojection=orthographic((10,10,7),zoom=.99);

// pic2 

real a=3, b=1, dy=.5;

triple f(pair p){
  real phi=p.x;
  real theta=p.y;
  real x=(b*cos(phi)+a)*cos(theta) ;
  real y=(b*cos(phi)+a)*sin(theta);
  real z=b*sin(phi) ;
  return (x,y,z);
}

picture pic1;
surface s2=surface(f,(0,0),(2pi,pi),nu=40, nv=40);
draw(pic1,s2,lightgray+opacity(.6),meshpen=blue);

xaxis3(pic1,"$x$",0,a+b+0.9,Arrow3);
yaxis3(pic1,"$y$",0,a+b+0.9,Arrow3);
zaxis3(pic1,"$z$",0,b+0.9,Arrow3);

add(shift(0,0,0)*pic1);

