import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


picture pic1, pic2;


pen p= black+1pt;
pen ptt= black+1.3pt;
pen pp= black+.5pt;

// axes

draw(pic1,Label("$x$",Relative(0.99)),(-.2,0)--(pi/2+.3,0),black+1pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.2)--(0,1.4),black+1pt,Arrow(TeXHead));

real x01=pi/6;
real x = pi/2-0.3;

// function and derivative and tangent ...
real a=0.2;
real f(real x){return sin(x);}
real xline(real x){return 0;}
real fp(real x){return cos(x);}
real tangent_line(real x){return f(x01)+fp(x01)*(x-x01);}

// x0

fill((x01,f(x01))--(x,f(x01))--(x,tangent_line(x))--cycle,mediumgray);

draw(pic1, graph(f,0.,0.5pi,350),red+1.3pt);
draw(pic1, graph(tangent_line,x01-0.2,x01+1,350),purple+1.3pt);
draw(pic1, (x01,f(x01)) -- (x01,0) ,pp);
draw(pic1, (x,f(x)) -- (x,0) ,pp);
draw(pic1, (x01,f(x01)) -- (0,f(x01)) ,pp);
draw(pic1, (x01,f(x01)) -- (x,f(x01)) ,pp);
draw(pic1, (x,0) -- (x,tangent_line(x)) ,pp);

// labels
//label(pic1,"$f(x_0)$",(x01+1.9,9),red);
pair O=(0,0);
Label L1=Label("$f(x)$",align=O,MidPoint,Fill(white));
Label L2=Label("$Y(x)$",align=O,MidPoint,Fill(white));
draw(L1,(x+.2,0)--(x+.2,f(x)),Arrows(TeXHead),Bars);
draw(L2,(x+.5,0)--(x+.5,tangent_line(x)),Arrows(TeXHead),Bars);

real yy=-.1;
label(pic1,"$x_0$",(x01,yy));
label(pic1,"$x$",(x,yy));
label(pic1,"$f(x_0)$",(-0.22,f(x01)));
label(pic1,"$f(x)$",(x+.2,1.1), red );
label(pic1,"tangent $Y$",(x01+.1,1.1), purple );

real theta=degrees(atan(fp(x01)));
draw(pic1,"$\alpha$",arc((x01,f(x01)),.3,0,theta),PenMargins);

perpendicular((x,f(x01)),NW,(x,f(x01))--(x+2,f(x01)));


// plot the points

dot(pic1,(x01,f(x01)),black+4pt);
dot(pic1,(x,f(x)),black+4pt);
dot(pic1,(x,tangent_line(x)),red+4pt);




add(pic1);





