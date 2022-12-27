import graph;
import geometry;
import gsl;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

real a=2; 
real b=1.; 
real h=4;

pair ellipse_param(real t)
{
	return (a*cos(t), b*sin(t));
}

pair circle_param(real t)
{
	return (a*cos(t),a*sin(t));
}

pair projection_point_line(pair P0, pair A, pair B)
{
	pair v  = B-A;
	real lv = length(v);
	real d  = dot(P0-A,v);
	return A + (d/lv^2)*v;
}


// check projection_point_line

pair h0 = projection_point_line((2,2), (0,0), (4,1));
write(h0);
//draw((0,0)--(4,1));
//draw((2,2)--h0);

real tmin=-0.7, tmax=0.8;

path el_up   = graph(ellipse_param,0,2pi);
path el_do   = graph(ellipse_param,pi,2pi);

pair P1=ellipse_param(0);
pair P2=ellipse_param(pi);
pair Q1=shift(0,-h)*P1;
pair Q2=shift(0,-h)*P2;

pen pb =blue+1pt;
pen pr =red+1pt;
pen p =black+.7pt;
pen pd =dashed+.6pt;
pen pg =gray+1pt;

draw(el_up,pb);
draw(shift(0,-h)*el_do,pb);
draw(P1--Q1,pb);
draw(P2--Q2,pb);

Label L=Label("$h$",align=(0,0),MidPoint,Fill(white));
draw(L,Q2+.6W--P2+.6W,Arrows(TeXHead),Bars);

int n=10;
real dt=pi/n;

int i = 2;
pair a=ellipse_param(dt+i*dt);
pair b=ellipse_param(dt+i*dt+dt);
pair c=ellipse_param(-dt-i*dt-dt);
pair d=ellipse_param(-dt-i*dt-2dt);

pair h0 = projection_point_line(a, d, b);
pair g = projection_point_line(c, d, b);

fill(g--c--a--h0--cycle,lightgreen);

for (int i =0;i < n; ++i)
{
	pair a=ellipse_param(dt+i*dt);
	pair b=ellipse_param(-dt-i*dt-dt);
	pair c=shift(0,-h)*ellipse_param(-dt-i*dt-dt);
	draw(a--b,p);
	draw(b--c,p);
}
// plot the cuboids, the line perpendiculars
for (int i = 0; i < 3; ++i)
{
	pair a=ellipse_param(dt+i*dt);
	pair b=ellipse_param(dt+i*dt+dt);
	pair c=ellipse_param(-dt-i*dt-dt);
	pair d=ellipse_param(-dt-i*dt-2dt);

	pair h = projection_point_line(a, d, b);
	pair g = projection_point_line(c, d, b);

    //dot(a); dot(b);dot(c); dot(d);

	draw(a--h,p);
	draw(c--g,p);
}

for (int i = 3; i < n-1; ++i)
{
	pair a=ellipse_param(dt+i*dt);
	pair b=ellipse_param(dt+i*dt+dt);
	pair c=ellipse_param(-dt-i*dt-dt);
	pair d=ellipse_param(-dt-i*dt-2dt);

	pair h = projection_point_line(b, a, c);
	pair g = projection_point_line(d, a, c);

    //dot(a,red); dot(b,blue);dot(c,green); dot(d,cyan);

	draw(b--h,p);
	draw(d--g,p);
}

//
picture pic;

int i = 2;
pair a=circle_param(dt+i*dt);
pair b=circle_param(dt+(i+1)*dt);

pair c=circle_param(-dt-i*dt);
pair d=circle_param(-dt-i*dt-dt);

fill(pic,a--(b.x,a.y)--(d.x,c.y)--c--cycle,lightgreen);

draw(pic,scale(2)*unitcircle,p);

for (int i =0;i < n; ++i)
{
	pair a=circle_param(dt+i*dt);
	pair b=circle_param(-dt-i*dt);
	draw(pic,a--b,p);
}

label(pic,"$A_i$",(.9,2.5));

for (int i =0;i < n/2-1; ++i)
{
	pair a=circle_param(dt+i*dt);
	pair b=circle_param(dt+(i+1)*dt);

	pair c=circle_param(-dt-i*dt);
	pair d=circle_param(-dt-i*dt-dt);
	
	draw(pic,a--(b.x,a.y),p);
	draw(pic,c--(d.x,c.y),p);
}

for (int i = 4;i < n-1; ++i)
{
	pair a=circle_param(dt+i*dt);
	pair b=circle_param(dt+(i+1)*dt);

	pair c=circle_param(-dt-i*dt);
	pair d=circle_param(-dt-i*dt-dt);
	
	draw(pic,b--(a.x,b.y),p);
	draw(pic,d--(c.x,d.y),p);
}

pair a=(2,-3);
pair b=(-2,-3);


Label L=Label("$2r$",align=(0,0),MidPoint,Fill(white));
draw(pic,L,a--b,Arrows(TeXHead),Bars);

string s="\begin{minipage}{3cm}
\begin{align*}
\text{vol} &=\sum \text{vol of cuboids}\\
&= \sum_{i=1}^n h \times A_i\\
&= h \left(\sum_{i=1}^n A_i \right)\\
&= h \times \pi r^2
\end{align*}
\end{minipage}
";

label(pic,s,(7,.5));

add(shift(5.5,-.5h)*pic);