import graph;
import patterns;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

size(10cm,10cm);
settings.outformat="pdf"; // output is pdf

real f(real x) {return x;}
pair F(real x) {return (x,f(x));}

add("bengal", hatch(2mm, blue));
add("crosshatch",crosshatch(3mm));

dotfactor=7;

void subinterval(real a, real b, picture pic)
{
  path g=box((a,0),(b,f(b)));
  filldraw(pic,g,lightgray);
}


picture pic1, pic2;

int a=0, b=3;


int n=2;

for(int i=a; i <= b; ++i) {
  if(i < b) subinterval(i,i+1,pic1);
}



for(int i=a; i < b; ++i) {
  dot(pic1,F((i+1)));
}

int i=0;
labelx("$x_0$",(0.,0));
labelx("$x_1$",(1.,0));
labelx("$x_2$",(2.,0));
labelx("$x_3$",(3.,0));

//draw(pic1,F(2.5)--(2.5,0),dashed+gray+0.4pt);


label(pic1,"$\boxed{y=x}$",(1,2.7));


string s="\begin{minipage}{3cm}
\begin{align*}
  E_1 &= \displaystyle\frac{1}{2}\Delta (y_1-y_0)\\
  E_2 &= \displaystyle\frac{1}{2}\Delta (y_2-y_1)\\
  E_3 &= \displaystyle\frac{1}{2}\Delta (y_3-y_2)\\
\end{align*}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(pic1,s,(4,1.8), red);

draw(pic1,Label("$x$",Relative(0.99)),(0,0)--(4.9,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(0,3),black+.6pt,Arrow(TeXHead));

fill(pic1,(0,0)--(1,1)--(0,1)--cycle,pattern("crosshatch"));
fill(pic1,(1,1)--(2,2)--(1,2)--cycle,pattern("crosshatch"));
fill(pic1,(2,2)--(3,3)--(2,3)--cycle,pattern("crosshatch"));

draw(pic1,graph(f,a,b,operator ..),red+1.2pt);

draw(pic1,Label("$E_1$",align=E),(0.5,1.59)--(0.5,1.),Arrow);  

dot(pic1,(0.,0),red+4pt);
dot(pic1,(1.,0),red+4pt);
dot(pic1,(2.,0),red+4pt);
dot(pic1,(3.,0),red+4pt);

add(pic1);




