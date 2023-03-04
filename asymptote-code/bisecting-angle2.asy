import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

point B =(0,0);
point B1=(1.2,0);
point B2=1.5dir(30);
point M =1.dir(15);
point B12=1.5dir(30/2);

pen p = black + 1pt;
pen pr = red + 1pt;

line  x = perpendicular(M,line(B,M));
point a1 = intersectionpoint(x,line(B,B1));
point b1 = intersectionpoint(x,line(B,B2));

markangle("$\alpha$",B12,B,B2,n=1,radius=9mm,Fill(orange));
markangle("$\alpha$",B1,B,B12,n=1,radius=9mm,Fill(orange));
perpendicularmark(line(B,M),x,quarter=1);
markangle("$\beta$",M,a1,B,n=2,radius=4mm,Fill(yellow));
markangle("$\beta$",B,b1,M,n=2,radius=4mm,Fill(yellow));



draw(B--a1,StickIntervalMarker(1,2,angle=-25 ) );
draw(B--b1,StickIntervalMarker(1,2,angle=-25 ) );

draw(arc(B,length(b1-B),-5,35),p);

draw(B--B1,p);
draw(B--B2,p);
draw(B--B12,pr);
draw(a1--b1);

dot(M,red+4pt);
dot(a1,red+4pt);
dot(b1,red+4pt);

label("$l_1$",B1+.1S);
label("$l_2$",B2+.1N);
label("$m$",B12+.1N);
label("$M$",M+.1SE);
label("$A$",a1+.1NE);
label("$B$",b1+(.1,.2));
label("$O$",B+(.0,.1));

