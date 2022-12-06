import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

unitsize(9cm,9cm);
//size(14cm, keepAspect=true);
defaultpen(fontsize(16pt));

settings.outformat="pdf"; // output is pdf


picture pic1, pic2;


pen p1= black+1pt;
pen p2= black+1.2pt;
pen p0= black+.7pt;

// axes
real xmax=0.6;

draw(pic1,Label("$x$",Relative(0.99)),(-.1,0)--(xmax+0.1,0),black+1pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.1)--(0,.5),black+1pt,Arrow(TeXHead));

// function and derivative and tangent ...
real f(real x){return x^3-3x^2+2x;}
real fp(real x){return 3x^2-6x+2;}


real xP = 0.1;
real xQ = 0.5;

pair O=(0,0);
pair P=(xP,f(xP));
pair Q=(xQ,f(xQ));

fill(pic1,P--Q--(Q.x,P.y)--cycle,mediumgray);

draw(pic1, P -- Q ,p1);
draw(pic1, P -- (P.x,0) ,p0);
draw(pic1, P -- (0,P.y) ,p0);
draw(pic1, Q -- (Q.x,0) ,p0);
draw(pic1, Q -- (0,Q.y) ,p0);

draw(pic1, P -- (Q.x,P.y) ,p0);

draw(pic1, graph(f,0,xmax,350),red+1.3pt);


// labels
label(pic1,"$f(x)$",(xmax,0.5),red);

real yy=-.1;
label(pic1,"$P$",P+0.1N);
label(pic1,"$Q$",Q+0.1N);

label(pic1,"$x_0$", (P.x,yy) );
label(pic1,"$x_0+h$", (Q.x,yy) );

Label L1=Label("$f(x_0)$",align=O,MidPoint,Fill(white));
Label L2=Label("$f(x_0+h)$",align=O,MidPoint,Fill(white));
Label L3=Label("$\Delta f$",align=O,MidPoint,Fill(white));

real xx=-0.1;
real xx2=-0.2;
draw(L1,(xx,0)--(xx,P.y),Arrows(TeXHead),Bars);
draw(rotate(90)*L2,(xx2,0)--(xx2,Q.y),Arrows(TeXHead),Bars);
draw(rotate(0)*L3,(Q.x-xx,P.y)--(Q.x-xx,Q.y),Arrows(TeXHead),Bars);

real theta=degrees(atan2(Q.y-P.y,Q.x-P.x));
draw(pic1,"$\alpha$",arc(P,.2,0,theta),PenMargins);

// plot the points

dot(pic1,P,black+6pt);
dot(pic1,Q,black+6pt);

label(pic1,"$a)$", (xx,0.5) );

add(pic1);

// pic2

real xmax=.8;
draw(pic2,Label("$x$",Relative(0.99)),(-.1,0)--(xmax+0.1,0),black+1pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.1)--(0,.5),black+1pt,Arrow(TeXHead));

real tang(real x){
	real x0=0.2;
	return f(x0) + fp(x0)*(x-x0);
}

real xP = 0.2;
real xQ = xmax-0.2;
real xQ1 = xQ-0.2;
real xQ2 = xQ1-0.1;

pair O=(0,0);
pair P=(xP,f(xP));
pair Q=(xQ,f(xQ));
pair Q1=(xQ1,f(xQ1));
pair Q2=(xQ2,f(xQ2));


draw(pic2, graph(f,0,xmax,350),red+1.3pt);
draw(pic2, graph(tang,xP-0.1,xP+.17,350),blue+1.3pt);
draw(pic2, P -- Q ,p1);
draw(pic2, P -- Q1 ,p1);
draw(pic2, P -- Q2 ,p1);
draw(pic2, P -- (P.x,0) ,p0);
draw(pic2, P -- (0,P.y) ,p0);
draw(pic2, Q -- (Q.x,0) ,p0);
draw(pic2, Q1 -- (Q1.x,0) ,p0);
draw(pic2, Q2 -- (Q2.x,0) ,p0);

// labels
label(pic1,"$f(x)$",(xmax,.5),red);

real yy=-.1;
label(pic2,"$P$",P+0.1N);
label(pic2,"$Q$",Q+0.1N);
label(pic2,"$Q'$",Q1+.1NE);
label(pic2,"$Q''$",Q2+0.1N);

label(pic2,"$x_0$", (P.x,yy) );
label(pic2,"$x_0+h$", (Q.x,yy) );

label(pic2,"$b)$", (xx,.5) );


// plot the points

dot(pic2,P,black+6pt);
dot(pic2,Q,black+6pt);
dot(pic2,Q1,black+6pt);
dot(pic2,Q2,black+6pt);


add(shift(1,0)*pic2);



