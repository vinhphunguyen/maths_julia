import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);


picture pic1, pic2;

draw(pic1,Label("$x$",Relative(0.99)),(-1.5,0)--(1.5,0),Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1.5)--(0,1.5),Arrow(TeXHead));


draw(pic1,unitcircle,black+1.1pt);
dot(pic1,(1,0),red+3pt);
dot(pic1,(0,1),red+3pt);
dot(pic1,(0,-1),red+3pt);
dot(pic1,(-1,0),red+3pt);

label(pic1,"$0^{\circ}$",(1.2,0.15),red);
label(pic1,"$1$",(1.2,-0.15),red);
label(pic1,"$90^{\circ}$",(0.2,1.2),red);
label(pic1,"$i$",(-0.1,1.2),red);
label(pic1,"$180^{\circ}$",(-1.2,0.15),red);
label(pic1,"$-1$",(-1.2,-0.15),red);
label(pic1,"$270^{\circ}$",(-.1,-1)+.2SW,red);
label(pic1,"$-i$",(.4,-1)+.2SW,red);

real theta=50;
pair A=dir(theta);
draw(pic1,(0,0)--A);
draw(pic1, A--(A.x,0),gray+.8pt);
draw(pic1, A--(0,A.y),gray+.8pt);

label(pic1,"$a$",(A.x,0)+.2S);
label(pic1,"$b$",(0,A.y)+.2W);

draw("$\alpha$",arc((0,0),0.26,0,theta),Arrow,PenMargins);
label(pic1,"$A$",A+(0.2,0.2),blue);
label(pic1,"$O$",(-0.1,-0.1),blue);
label(pic2,"$O$",(-0.1,-0.1),blue);
dot(pic1,A,blue+3pt);


add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
