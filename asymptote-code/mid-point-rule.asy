import graph;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

size(300,150,IgnoreAspect);
settings.outformat="pdf"; // output is pdf

real f(real x) {return 3x;}
pair F(real x) {return (x,f(x));}

real f1(real x) {return x^2;}
pair F1(real x) {return (x,f1(x));}

dotfactor=4;

void subinterval(real a, real b, picture pic)
{
  path g=box((a,0),(b,f(0.5(a+b))));
  filldraw(pic,g,lightgray);
}

void subinterval1(real a, real b, picture pic)
{
  path g=box((a,0),(b,f1(0.5(a+b))));
  filldraw(pic,g,lightgray);
}

picture pic1, pic2;

int a=0, b=4;


int n=2;

for(int i=a; i <= b; ++i) {
  if(i < b) subinterval(i,i+1,pic1);
}

draw(pic1,graph(f,a,b,operator ..),red+1.2pt);


for(int i=a; i < b; ++i) {
  dot(pic1,F(0.5(i+i+1)));
}

int i=0;
labelx("$x_0$",(0.5,0));
labelx("$x_1$",(1.5,0));
labelx("$x_2$",(2.5,0));
labelx("$x_3$",(3.5,0));

draw(pic1,F(0.5)--(0.5,0),dashed+gray+0.4pt);
draw(pic1,F(1.5)--(1.5,0),dashed+gray+0.4pt);
draw(pic1,F(2.5)--(2.5,0),dashed+gray+0.4pt);
draw(pic1,F(3.5)--(3.5,0),dashed+gray+0.4pt);


label(pic1,"$\boxed{y=x}$",(2,12));


draw(pic1,Label("$x$",Relative(0.99)),(-.1,0)--(4.5,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.1)--(0,16),black+.6pt,Arrow(TeXHead));


dot(pic1,(0.5,0),red+2pt);
dot(pic1,(1.5,0),red+2pt);
dot(pic1,(2.5,0),red+2pt);
dot(pic1,(3.5,0),red+2pt);

add(pic1);

// pic2

int b = 4;

for(int i=a; i <= b; ++i) {
  if(i < b) subinterval1(i,i+1,pic2);
}

draw(pic2,graph(f1,a,b,operator ..),red+1.2pt);


for(int i=a; i < b; ++i) {
  dot(pic2,F1(0.5(i+i+1)));
}

int i=0;
labelx(pic2,"$x_0$",(0.5,0));
labelx(pic2,"$x_1$",(1.5,0));
labelx(pic2,"$x_2$",(2.5,0));
labelx(pic2,"$x_3$",(3.5,0));

draw(pic2,F1(0.5)--(0.5,0),dashed+gray+0.4pt);
draw(pic2,F1(1.5)--(1.5,0),dashed+gray+0.4pt);
draw(pic2,F1(2.5)--(2.5,0),dashed+gray+0.4pt);
draw(pic2,F1(3.5)--(3.5,0),dashed+gray+0.4pt);


label(pic2,"$\boxed{y=x^2}$",(2,12));


draw(pic2,Label("$x$",Relative(0.99)),(-.1,0)--(4.5,0),black+.6pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.1)--(0,16),black+.6pt,Arrow(TeXHead));


dot(pic2,(0.5,0),red+2pt);
dot(pic2,(1.5,0),red+2pt);
dot(pic2,(2.5,0),red+2pt);
dot(pic2,(3.5,0),red+2pt);

add(shift(6.,0)*pic2);
