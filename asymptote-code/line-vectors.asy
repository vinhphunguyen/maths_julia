import graph;
import geometry;
import patterns;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(14pt));

size(16cm, keepAspect=true);

picture pic1, pic2;

real a = -4, b = -4, c = -10;
real x = 2.5, xQ=4.5;

real slope=atan(a/b);

real f(real x){return x+1;}

draw(graph(f,-0,5.9),linewidth(1));

pair O=(0,0);
pair P=(x,f(x));
pair Q=(xQ,f(xQ));
pair n=(a,b);
pair M=0.5(P+Q);

draw(pic1,Label("$\bm{n}$",EndPoint),P--P+2.1dir(90+degrees(slope)),red+1pt,ArcArrow);

label(pic1,"$P(x,y)$",Q+(.99,.0),red);
label(pic1,"$P_0(x_0,y_0)$",P+(.9,-.6),red);

label(pic1,"$\boxed{(x-x_0)a+(y-y_0)b=0}$",(4.2,1.),red);

pair a=extension(P,P+3.1dir(90+degrees(slope)),Q,Q+3.1dir(-90-degrees(slope)));
pair b=extension(P,P+3.1dir(degrees(slope)),Q,Q+3.1dir(-degrees(slope)));

draw(pic1,P--Q,blue+1.2pt,ArcArrow);
draw(pic1,a--Q);
draw(pic1,b--Q);

perpendicular(P,NE,P--Q,blue);
//perpendicular(b,NE,b--Q,blue);

// dots

dot(pic1,P,black+5pt); // plot a dot at (0,0)
dot(pic1,Q,black+5pt); // plot a dot at (0,0)

//axes

draw(pic1,Label("$x$",Relative(0.99)),(0,0)--(7,0),black+1.5pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(0,7),black+1.5pt,Arrow(TeXHead));


// pic2

pair P=(x,f(x)-1);
pair Q=(3,5.6);
pair M=0.5(P+Q);

real aa = Q.x-P.x;
real bb = Q.y-P.y;
real z  = sqrt(aa^2+bb^2);
pair d  = (1/z)*(aa,bb);

real fx (real t){return P.x+t*d.x;}
real fy (real t){return P.y+t*d.y;}

label(pic2,"$P$",Q+(.6,.0),red);
label(pic2,"$P_0(x_0,y_0)$",P+(1.4,.0),red);
label(pic2,"$\bm{d}(a,b)$",P+(-1.,.5),blue);
label(pic2,"$\bm{r}_0$",.5P+(.2,-.3),black);


label(pic2,"$\boxed{\bm{r}_0+t\bm{d}}$",(4.2,1.),red);

draw(pic2,graph(fx,fy,-2,4), black+1.2pt);

string s="\begin{minipage}{3cm}
\begin{empheq}[box=\widefbox]{align*}
  u &=x+2y \\
  v &= x-2y
\end{empheq}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(pic1,s,(2.6,1.8), red);

draw(pic2,P--M,blue+1.2pt,ArcArrow);
draw(pic2,O--P, black+1.2pt,ArcArrow);


// dots

dot(pic2,P,black+5pt); // plot a dot at (0,0)
dot(pic2,Q,black+5pt); // plot a dot at (0,0)

//axes

draw(pic2,Label("$x$",Relative(0.99)),(0,0)--(7,0),black+1.5pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,0)--(0,7),black+1.5pt,Arrow(TeXHead));

add(shift(9,0)*pic2);

add(pic1);
