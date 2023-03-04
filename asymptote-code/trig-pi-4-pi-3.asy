import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");


settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2;


// draw a rectangle via 4 points

pair A=(0,0);
pair B=(1,0);
pair C=(1,1);
pair D=(0,1);

pen p=black+1pt;

markangle(pic1,"$\frac{\pi}{4}$",B,A,C,n=1,radius=9mm,Fill(purple));


draw(pic1,A--B--C--D--cycle,p);
draw(pic1,A--C,p);

label(pic1,"$1$",(.5,-.1));	
label(pic1,"$1$",(1.1,.5));	
label(pic1,"${\sqrt{2}}$",(.45,.7));	

perpendicularmark(pic1,line(A,B),line(B,C),quarter=2);
add(pic1);

// pic2 

pair O=(0,0);
pair A1=(-1,0);
pair B1=(1,0);
pair C1=(0,sqrt(3));

markangle(pic2,"$\frac{\pi}{3}$",B1,A1,C1,n=1,radius=9mm,Fill(orange));
markangle(pic2,"$\frac{\pi}{3}$",C1,B1,A1,n=1,radius=9mm,Fill(orange));
markangle(pic2,"$\frac{\pi}{6}$",O,C1,B1,n=2,radius=9mm,Fill(cyan));


draw(pic2,A1--B1--C1--cycle,p);
draw(pic2,C1--(0,0),p);

label(pic2,"$2$", .5(A1+C1) + .15W) ;
label(pic2,"$2$", .5(B1+C1) + .15E) ;
label(pic2,"$1$", (-0.5,-0.1) ) ;
label(pic2,"$1$", ( 0.5,-0.1) ) ;
label(pic2,"${\sqrt{3}}$",(.2,.5*sqrt(3)));	

perpendicular(pic2,(0,0),NE,(0,0)--(1,0),blue);

add(shift(3,0)*pic2);



