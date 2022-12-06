import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


picture pic1, pic2;


pen p= black+1pt;
pen ptt= black+1.3pt;
pen pp= dashed+black+.9pt;

// axes

draw(pic1,Label("$x$",Relative(0.99)),(-1,0)--(26,0),black+1pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1.2)--(0,20),black+1pt,Arrow(TeXHead));

// function and derivative and tangent ...
real a=0.2;
real f(real x){return 2^(a*x)-2.5;}
real xline(real x){return 0;}
real fp(real x){return 2^(a*x)*log(2)*a;}
real tangent_line(real x0, real x){return f(x0)+fp(x0)*(x-x0);}

// x0
real x01=21;
pair a=extension((0,0),(30,0),(x01,f(x01)), (0,tangent_line(x01,0)) );
real x02=a.x;

pair a=extension((0,0),(30,0),(x02,f(x02)), (0,tangent_line(x02,0)) );
real x03=a.x;

pair a=extension((0,0),(30,0),(x03,f(x03)), (0,tangent_line(x03,0)) );
real x04=a.x;

fill(pic1,(x01,f(x01))--(x02,0)--(x01,0)--cycle,mediumgray);

// true solution x^ast
pair Ds []=intersectionpoints(graph(f,0,23,operator ..),graph(xline,0,25,operator ..));
pair sol = Ds[0];

draw(pic1, graph(f,0,22,350),red+1.3pt);
draw(pic1, (x01,f(x01)) -- (x02,0) ,p);
draw(pic1, (x02,f(x02)) -- (x03,0) ,p);
draw(pic1, (x03,f(x03)) -- (x04,0) ,p);

draw(pic1, (x01,f(x01)) -- (x01,0) ,pp);
draw(pic1, (x02,f(x02)) -- (x02,0) ,pp);
draw(pic1, (x03,f(x03)) -- (x03,0) ,pp);

// labels
label(pic1,"$f(x)$",(20.,18),red);
label(pic1,"$f(x_0)$",(x01+1.9,9),red);
label(pic1,"$\boxed{\displaystyle\frac{f(x_0)}{x_0-x_1}=f'(x_0)}$",(x03-2,10),red);

real yy=-1;
label(pic1,"$x^\ast$",(sol.x,1));
label(pic1,"$x_0$",(x01,yy));
label(pic1,"$x_1$",(x02,yy));
label(pic1,"$x_2$",(x03,yy));
label(pic1,"$x_3$",(x04,yy));

real theta=degrees(atan2(f(x01),x01-x02));
perpendicular((x01,0),NE,(0,0)--(10,0),blue);
draw(pic1,"$\alpha$",arc((x02,0),2,0,theta),PenMargins);

// plot the points

dot(pic1,sol,red+6pt);
dot(pic1,(x01,f(x01)),black+6pt);
dot(pic1,(x01,0),black+6pt);
dot(pic1,(x02,0),black+6pt);
dot(pic1,(x03,0),black+6pt);
dot(pic1,(x04,0),black+6pt);




add(pic1);





