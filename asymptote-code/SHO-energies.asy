import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, 6cm, keepAspect=false);
defaultpen(fontsize(12pt));


real k = 1;
real m = 2;
real omega0 = sqrt(k/m);
real T = 2pi/omega0;
real A = 1;
real phi = 0.;

write(omega0);
write(T);

real kinetic(real t){
   return .5*k*A^2*(sin(omega0*t-phi))^2;
}

real potential(real t){
   return .5*k*A^2*(cos(omega0*t-phi))^2;
}

real xmin=0, xmax=2T, ymin=0, ymax=0.5k*A^2;

int n = 200;
draw(graph(kinetic,xmin,xmax,n),red+1pt,"$KE$" );
draw(graph(potential,xmin,xmax,n),blue+1pt,"$U$");

xaxis("$t$",BottomTop,LeftTicks);
yaxis("",LeftRight,RightTicks(trailingzero));

label("$KE$",(2.35,0.33),red);
label("$T$",(2.35,0.11),blue);
