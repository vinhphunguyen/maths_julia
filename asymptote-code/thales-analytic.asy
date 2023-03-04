import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2, pic3;


real theta=50;
pair A=dir(theta);

draw(pic1,Label("$x$",Relative(0.99)),(-1.1,0)--(1.5,0),Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.2),Arrow(TeXHead));

markangle(pic1,"$\alpha$",(1,0),(-1,0),A,n=1,radius=6mm,Fill(orange));
markangle(pic1,"$\alpha$",(2,0),(1,0),A,n=2,radius=4mm,Fill(yellow));

draw(pic1,unitcircle,black+1.pt);


label(pic1,"$A$",(-1.2,0.15),red);
label(pic1,"$(-1,0)$",(-1.4,-0.15),red);
label(pic1,"$B(1,0)$",(1.2,-.3),red);



draw(pic1,(-1,0)--A,black+1.pt);
draw(pic1,(1,0)--A,black+1.pt);
label(pic1,"$P(x,y)$",A+(0.1,0.25),blue);

dot(pic1,(1,0),red+4pt);
dot(pic1,(-1,0),red+4pt);
dot(pic1,A,blue+4pt);



add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
