import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2, pic3;

// pic2

real f(real x){return 1/x;}

path g=graph(f,0.4,2.5);

real x=0.7;
real dx=1;

pair A=(x,f(x));
pair B=(x+dx,f(x+dx));
pair Xx=(A.x,B.y);


path gg=graph(f,x,x+dx);
path ff=(Xx--A--gg--B--cycle);

fill(pic2,(0,B.y)--Xx--A--(0,A.y)--cycle,lightcyan);
fill(pic2,Xx--B--(B.x,0)--(x,0)--cycle,orange);
fill(pic2,ff,mediumgray);

draw(pic2,g,red+1pt);

draw(pic2,A--(A.x,0),black+.5pt);
draw(pic2,B--(B.x,0),black+.5pt);
draw(pic2,A--(0,A.y),black+.5pt);
draw(pic2,B--(0,B.y),black+.5pt);

label(pic2,"$y=1/x$",(A.x+.4,A.y+0.6),red);

label(pic2,"$\approx dxdy$",(.5(2x+dx)+.25,0.5(A.y+B.y)),gray);

label(pic2,"$x$",(.5x,B.y-0.2),black);
label(pic2,"$dx$",(.5(2x+dx),-0.2),black);
label(pic2,"$dy$",(-0.2,0.5(A.y+B.y)),black);
label(pic2,"$1/(x+dx)$",(B.x+0.6,.2),black);

label(pic2,"$O$",(-0.15,-0.2),black);
label(pic2,"$A$",(x,-0.2),black);
label(pic2,"$H$",(-0.2,A.y),black);
label(pic2,"$G$",(-0.2,B.y),black);
label(pic2,"$B$",(x+dx,-.2),black);
label(pic2,"$C$",A+.2E,black);
label(pic2,"$D$",B+.2NE,black);

draw(pic2,Label("$x$",Relative(.99)),(-.25,0)--(2.6,0),black+.8pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.25)--(0,2.5),black+.8pt,Arrow(TeXHead));

dot(pic2,A,black+4pt);
dot(pic2,B,black+4pt);

add(pic2);



//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
