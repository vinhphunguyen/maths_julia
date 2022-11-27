import graph;
size(300,150,IgnoreAspect);
settings.outformat="pdf"; // output is pdf

real f(real x) {return 1/x^(1.1);}
pair F(real x) {return (x,f(x));}

dotfactor=7;

void subinterval_left(real a, real b)
{
  path g=box((a,0),(b,f(a)));
  filldraw(g,lightgray);
}

void subinterval_right(real a, real b, picture pic)
{
  filldraw(pic,box((a,0),(b,f(b))),lightgray);
}

picture pic1, pic2;

int a=1, b=5;

draw(pic1,graph(f,a-0.2,b+0.2,operator ..),red+1.2pt);

int n=2;

for(int i=a; i <= b; ++i) {
  if(i < b) subinterval_left(i,i+1);
  //if(i <= n) labelx(i);
  dot(pic1,F(i));
}

int i=0;
labelx("$x_0$",++i);
labelx("$x_1$",++i);
labelx("$x_2$",++i);
labelx("$x_3$",++i);
labelx("$x_4$",++i);

arrow(pic1,"$f(x)$",F(i-1.5),NE,1.5cm,red,Margin(0,0.5));


draw(pic1,Label("$x$",Relative(0.99)),(-.1,0)--(6.,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.1)--(0,1.2),black+.6pt,Arrow(TeXHead));

add(pic1);

// pic2

draw(pic2,graph(f,a-0.2,b+0.2,operator ..),red+1.2pt);


int n=2;

for(int i=a; i <= b; ++i) {
  if(i < b) subinterval_right(i,i+1,pic2);
  //if(i <= n) labelx(i);
  dot(pic2,F(i));
}

int i=0;
labelx(pic2,"$x_0$",++i);
labelx(pic2,"$x_1$",++i);
labelx(pic2,"$x_2$",++i);
labelx(pic2,"$x_3$",++i);
labelx(pic2,"$x_4$",++i);



arrow(pic2,"$f(x)$",F(i-1.5),NE,1.5cm,red,Margin(0,0.5));

draw(pic2,Label("$x$",Relative(0.99)),(-.1,0)--(6.,0),black+.6pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.1)--(0,1.2),black+.6pt,Arrow(TeXHead));

add(shift(6.9,0)*pic2);
