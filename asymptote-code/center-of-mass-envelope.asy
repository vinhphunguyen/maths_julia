import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));

real f(real x) { return (x-2)^2+1.4; }
real xmax=4.5;
real xmin=0.5;

path s1  = graph(f,xmin,xmax, n=200);
//draw(s1,red+1.1pt);

real x2=1.5,x3=3.1, xmm=2.25;

pair m1=(xmin,f(xmin));
pair m2=(x2,f(x2));
pair m3=(x3,f(x3));
pair m4=(xmax,f(xmax)-2);
pair xm=(xmm,f(xmm)+1.8);
pair xm0=(xmm,f(xmm));

fill(m1--m2--m3--m4--cycle,mediumgray);

draw(m1--m2--m3--m4--cycle,blue+1pt);


draw(m1--(m1.x,0),dashed+gray); // draw the dotted line showing the projections
draw(m2--(m2.x,0),dashed+gray); // draw the dotted line showing the projections
draw(m3--(m3.x,0),dashed+gray); // draw the dotted line showing the projections
draw(m4--(m4.x,0),dashed+gray); // draw the dotted line showing the projections
draw(xm--(xm.x,0),dashed+gray); // draw the dotted line showing the projections
draw(xm--(0,xm.y),dashed+gray); // draw the dotted line showing the projections


dot(m1,orange+5pt); // plot a dot at (0,0)
dot(m2,orange+5pt); // plot a dot at (0,0)
dot(m3,orange+5pt); // plot a dot at (0,0)
dot(m4,orange+5pt); // plot a dot at (0,0)

dot(xm,red+5pt); // plot a dot at (0,0)

label("$m_1$",m1+(0,0.4));  // draw the;abel v0y
label("$m_2$",m2+(-0.4,-0.3));  // draw the;abel v0y
label("$m_3$",m3+(0.4,0.0));  // draw the;abel v0y
label("$m_4$",m4+(0,0.4));  // draw the;abel v0y

label("CM",xm+(0,0.4));  // draw the;abel v0y

label("$x_1$",(m1.x,0)+(0,-0.4));  // draw the;abel v0y
label("$x_2$",(m2.x,0)+(0,-0.4));  // draw the;abel v0y
label("$x_3$",(m3.x,0)+(0,-0.4));  // draw the;abel v0y
label("$x_4$",(m4.x,0)+(0,-0.4));  // draw the;abel v0y
label("$x_\text{CM}$",(xm.x,0)+(0,-0.4));  // draw the;abel v0y

Label L3=Label("$y_\text{CM}$",align=(0,0),MidPoint,Fill(white));

draw(L3,(-1.1,0)--(-1.1,xm.y),Arrows(TeXHead),Bars);

//xlimits(-3,3);
//ylimits(-20,20);

label("$x_1 < x_\text{CM} = \displaystyle\frac{\sum_i m_i x_i}{\sum_i m_i} < x_4$",m4+(3.7,-1.8));  // draw the;abel v0y
label("$y_1 < y_\text{CM} = \displaystyle\frac{\sum_i m_i y_i}{\sum_i m_i} < y_4$",m4+(3.7,-3.4));  // draw the;abel v0y

xaxis(Label("$x$",position=EndPoint, align=NE),Arrow(TeXHead));
yaxis(Label("$y$",position=EndPoint, align=NE),Arrow(TeXHead));
