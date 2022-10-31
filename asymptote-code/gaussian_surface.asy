import graph3;
import palette;
import contour;

settings.outformat="pdf";
settings.render = 0;

unitsize(1cm,1cm,13cm);
currentprojection=orthographic(2,1,.05,zoom=.8);

defaultrender.merge=true;

real f(pair z) {
real rho = 0.8;
real aa = 1.0 / ( 2*3.14*sqrt(1-rho^2) );
real bb = -1.0/(2*(1-rho^2));
return aa*exp(bb*(z.x*z.x+z.y*z.y-2*rho*z.x*z.y));
}


real a=4;
surface s=surface(f,(-a,-a),(a,a),25,Spline);
draw(s,mean(palette(s.map(zpart),Rainbow(40))),black);

xaxis3("$x$",-a-1,a+1,Arrow3);
yaxis3("$y$",-a-1,a+1,Arrow3);
zaxis3("$z$",0.,0.3,Arrow3);
