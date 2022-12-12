import graph;
import geometry;
import gsl;
import BezierLib;

usepackage("amsmath");
usepackage("mtpro2");

size(12cm, 12cm,keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf

picture pic1, pic2, pic3;

real b=3;
real h=6;

pen p =black+1pt;

fill(pic1,shift(-0.5b,-0.5h)*scale(b,h)*unitsquare,mediumgray);
draw(pic1,shift(-0.5b,-0.5h)*scale(b,h)*unitsquare,p);

draw(pic1,Label("$x$",Relative(0.99)),(0,0)--(.5b+.8,0),black+.9pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(0,.5h+0.8),black+.9pt,Arrow(TeXHead));

pair O=(0,0);
Label L1=Label("$b$",align=O,MidPoint,Fill(white));
Label L2=Label("$h$",align=O,MidPoint,Fill(white));

real yy=-0.5h-0.7;
real xx=-0.5b-0.7;

draw(pic1,L1,(-0.5b,yy)--(0.5b,yy),Arrows(TeXHead),Bars);
draw(pic1,L2,(xx,-0.5h)--(xx,0.5h),Arrows(TeXHead),Bars);

string s="\begin{minipage}{3cm}
\begin{align*}
I_x &= \iint y^2 dx dy\\
&= \int_{-b/2}^{b/2}\left(\int_{-h/2}^{h/2}y^2dy \right)dx\\
&= \frac{bh^3}{12}
\end{align*}
\end{minipage}
";


label(pic1,s,(0.5b+5.5,.3), red);

add(pic1);

// pic2

real b=1, h=2;
pair A=(0,0);
pair B=A+(b,0);
pair C=A+(b,h);
pair D=A+(0,h);

real lx=4.5, ly=2;
pair B1=B+(lx,ly);
pair C1=C+(lx,ly);
pair D1=D+(lx,ly);

pair cen=0.25*(C+D+C1+D1);
real ll=1.5;
draw(pic2,cen+(0,ll)--cen,p,ArcArrow(3pt));

label(pic2,"$F$",cen+(0.5,ll));

real alpha=degrees(atan2(B1.y-B.y,B1.x-B.x));

label(pic2,rotate(alpha)*"stronger",0.5(B+B1)+(0.5,0.99));

draw(pic2,A--B--C--D--cycle,p);
draw(pic2,B--B1,p);
draw(pic2,C--C1,p);
draw(pic2,D--D1,p);
draw(pic2,B1--C1,p);
draw(pic2,D1--C1,p);

real r=b/2;

draw(pic2,shift(0.5b,-0.5b)*scale(r)*unitcircle,p);

draw(pic2,(0,-2r)--(2r,-2r),p);

real rr=b/3;
pair D2=B1-(0,rr+0.1);
draw(pic2,arc(D2,rr,0,360),p);

draw(pic2,(D2-(rr,rr))--(D2+(rr,-rr)),p);


add(shift(12,0)*pic2);

// pic3

real b=2, h=1;
pair A=(0,0);
pair B=A+(b,0);
pair C=A+(b,h);
pair D=A+(0,h);

real lx=4.5, ly=2;
pair B1=B+(lx,ly);
pair C1=C+(lx,ly);
pair D1=D+(lx,ly);

pair cen=0.25*(C+D+C1+D1);
label(pic3,"$F$",cen+(0.4,ll));

draw(pic3,cen+(0,ll)--cen,p,ArcArrow(3pt));

draw(pic3,A--B--C--D--cycle,p);
draw(pic3,B--B1,p);
draw(pic3,C--C1,p);
draw(pic3,D--D1,p);
draw(pic3,B1--C1,p);
draw(pic3,D1--C1,p);

real r=h/2;

draw(pic3,shift(0.5b,-r)*scale(r)*unitcircle,p);

real rr=h/3;
pair D2=B1-(0,rr+0.09);
draw(pic3,arc(D2,rr,0,360),p);

draw(pic3,(0,-2r)--(b,-2r),p);
draw(pic3,(D2-(rr,rr))--(D2+(rr,-rr)),p);

add(shift(12,-4)*pic3);
