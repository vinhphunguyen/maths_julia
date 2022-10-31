import graph;
import palette;
import contour;

settings.outformat="pdf";

size(10cm,10cm);


real f1(real x, real y) {
  real rho = 0.8;
  real aa = 1.0 / ( 2pi*sqrt(1-rho^2) );
  real bb = -1.0/(2*(1-rho^2));
  return aa*exp(bb*(x*x+y*y-2*rho*x*y));
}

pair a=(-4,-4);
pair b=(4,4);

real f(real x, real y) {return cos(x)*sin(y);}

int N=200;
int Divs=10;
int divs=1;
int n=Divs*divs;

defaultpen(1bp);
pen Tickpen=black;
pen tickpen=gray+0.5*linewidth(currentpen);
pen[] Palette=BWRainbow();
//pen[] Palette=quantize(BWRainbow(),n);

bounds range=image(f1,Automatic,a,b,N,Palette);

// Major contours
real[] Cvals=uniform(range.min,range.max,Divs);
draw(contour(f1,a,b,Cvals,N,operator --),Tickpen+squarecap+beveljoin);

// Minor contours (if divs > 1)
real[] cvals;
for(int i=0; i < Cvals.length-1; ++i)
  cvals.append(uniform(Cvals[i],Cvals[i+1],divs)[1:divs]);
draw(contour(f1,a,b,cvals,N,operator --),tickpen+squarecap+beveljoin);

xaxis("$x$",BottomTop,LeftTicks,above=true);
yaxis("$y$",LeftRight,RightTicks,above=true);


palette("$f(x,y)$",range,point(SE)+(0.5,0),point(NE)+(1,0),Right,Palette,
        PaletteTicks("$%+#0.1f$",N=Divs,n=divs,Tickpen,tickpen));
