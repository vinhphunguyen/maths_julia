import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(16pt));

size(24cm, keepAspect=true);

picture pic1, pic2, pic3;

// pic1

fill(pic1,(1,0)--(0,1)--(-1,0)--(0,-1)--cycle,mediumgray);

draw(pic1,(1,0)--(0,1)--(-1,0)--(0,-1)--cycle,blue+2pt);

draw(pic1,Label("$v_1$",Relative(0.99)),(-1.2,0)--(1.4,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$v_2$",Relative(0.99)),(0,-1.2)--(0,1.4),black+1.2pt,Arrow(TeXHead));

dot(pic1,(1,0),blue+4pt);
dot(pic1,(-1,0),blue+4pt);
dot(pic1,(0,1),blue+4pt);
dot(pic1,(0,-1),blue+4pt);

//label(pic1,"$x+2y=2$",(1.2,1));
Label L4=Label("$v_1+v_2=1$");
Label L5=Label("$v_1-v_2=-1$");

label(pic1,rotate(-degrees(atan2(2,2)))*L4,(0.67,0.53),red);
label(pic1,rotate(degrees(atan2(2,2)))*L5,(0.67,-0.53),red);
label(pic1,"$\norm{\bm{v}}_1=|v_1|+|v_2|$",(0,-1.4));

// pic 2

fill(pic2,unitcircle,mediumgray);
draw(pic2,unitcircle,blue+2pt);

draw(pic2,Label("$v_1$",Relative(0.99)),(-1.2,0)--(1.4,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$v_2$",Relative(0.99)),(0,-1.2)--(0,1.4),black+1.2pt,Arrow(TeXHead));

dot(pic2,(1,0),blue+6pt);
dot(pic2,(-1,0),blue+6pt);
dot(pic2,(0,1),blue+6pt);
dot(pic2,(0,-1),blue+6pt);

label(pic2,"$v_1^2+v_2^2=1$",(1.45,0.6),red);
label(pic2,"$1$",(1.15,-0.15),red);
label(pic2,"$-1$",(-1.25,-0.15),red);
label(pic2,"$1$",(.25,1.15),red);
label(pic2,"$-1$",(.25,-1.15),red);
label(pic2,"$\norm{\bm{v}}_2=\sqrt{v_1^2+v_2^2}$",(0,-1.4));


add(shift(3.3,0)*pic2);

// pic3

fill(pic3,shift(-1,-1)*scale(2)*unitsquare,mediumgray);
draw(pic3,shift(-1,-1)*scale(2)*unitsquare,blue+2pt);

draw(pic3,Label("$v_1$",Relative(0.99)),(-1.2,0)--(1.4,0),black+1.2pt,Arrow(TeXHead));
draw(pic3,Label("$v_2$",Relative(0.99)),(0,-1.2)--(0,1.4),black+1.2pt,Arrow(TeXHead));

dot(pic3,(1,0),blue+6pt);
dot(pic3,(-1,0),blue+6pt);
dot(pic3,(0,1),blue+6pt);
dot(pic3,(0,-1),blue+6pt);

Label L2=Label("$v_1^2+v_2^2=1$",align=(-0.,.8),MidPoint);
label(pic3,"$\norm{\bm{v}}_\infty=\max\{|v_1|,|v_2|\}$",(0,-1.4));


add(shift(6.6,0)*pic3);
add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
