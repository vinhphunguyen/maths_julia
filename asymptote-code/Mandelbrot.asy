import graph; 
import palette; 
int w=4096;//2048;
size(w,0);
real mandelbrot(pair c, real r, int count=100) {
  int i=0;
  pair z=c;
  do {
    ++i;
    z=z^2+c;
  } while (length(z) <= r && i<count);
  return (i<count) ? i/count : 0;
}
real r=4;
real step=1/w;
real xmin=-2.25, xmax=.75;
real ymin=-1.3, ymax=0;
real fractal(real x, real y){
  return mandelbrot((x,y),r,20);
}
bounds range=image(fractal,(xmin,ymin),(xmax,ymax)
  ,w,Grayscale()); 
add(reflect((0,0),(1,0))*currentpicture);