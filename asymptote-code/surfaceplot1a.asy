import graph3;
import grid3;
import palette;
import contour;

usepackage("mtpro2");

settings.outformat="pdf";
settings.render = 0;

unitsize(4cm,4cm,2cm);
currentprojection=orthographic(1.5,1.3,-1.5);

defaultrender.merge=true;

defaultpen(fontsize(16pt));

real f(pair z) {
return -z.x*z.x - z.y*z.y + z.x*z.y;
}


real a=1.6;
real a1=1.2;
surface s=surface(f,(-a1,-a1),(a1,a1),40,Spline);
//draw(s,mean(palette(s.map(zpart),Rainbow(10))),black);
s.colors(palette(s.map(zpart),Rainbow()));
draw(s);

real[] myxchoice={-1.5,-1.0,-0.5,0,0.5,1.0,1.5};
real[] myzchoice={0,1,2,3,4,5};

xaxis3("$x$",-a,a,red,OutTicks(myxchoice),Arrow3);
yaxis3("$y$",-a,a,red,OutTicks(2,2),Arrow3);
zaxis3("$z$",0,-6,red,OutTicks(beginlabel=false,myzchoice),Arrow3);