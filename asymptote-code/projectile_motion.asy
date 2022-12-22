import graph;
usepackage("amsmath");

size(6cm); // size of the image

// parabola of the projectile
real f(real x) {return x-x^2;}
pair F(real x) {return (x,f(x));}

// plot the function f, from xmin to xmax
real xmin=0, xmax=.6;
draw(graph(f,xmin,xmax,operator..),linewidth(1));

real r=.3,theta=45;
pair z=r*dir(theta),O=(0,0); // z=(r*cos theta,r*sin theta), 0 is (0,0): good

// velocity vector v0, its x-component and y-component
draw(Label("$\boldsymbol{v}_0$",align=N,EndPoint),O--z,red,Arrow);
draw(Label("$v_{0x}=v_0\cos\alpha$",align=S,EndPoint),O--(z.x,0),blue,Arrow);
draw("$v_{0y}$",align=W,O--(0,z.y),blue,Arrow);
draw((0,z.y)--z--(z.x,0),dotted+gray);

pair m_pos=F(0.5); // location of the mass m

dot(O,black+5pt); // plot a dot at (0,0) 
dot("$m$",align=SE,m_pos,black+5pt);
draw(Label("$mg$",align=E,EndPoint),m_pos--m_pos+.15dir(-90),Arrow);  // draw the force


Label L1=Label("$y(t)$",align=O,MidPoint,Fill(white));
Label L2=Label("$x(t)$",align=O,MidPoint,Fill(white));
draw(L1,(-.15,0)--(-.15,m_pos.y),Arrows(TeXHead),Bars);
draw(L2,(0,.31)--(m_pos.x,.31),Arrows(TeXHead),Bars);

xaxis("$x$",Arrow(TeXHead));
yaxis("$y$",-.1,f(.5)+.15,Arrow(TeXHead));
