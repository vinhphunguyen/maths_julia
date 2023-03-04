import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

pen p = black + .7pt;
pen p1 = blue + .6pt;
pen pr = red + .9pt;

draw(unitcircle,p);

pair O=(0,0);
pair A1=dir(10);

//draw(arc(O,1,50,70),p1);
draw(arc(A1,1,110,140),p1);

pair Ds []=intersectionpoints(arc(O,1,50,70),arc(A1,1,110,140));
pair A2=Ds[0];

draw(arc(A2,1,180,210),p1);
pair Ds []=intersectionpoints(arc(O,1,0,360),arc(A2,1,0,360));
pair A3=Ds[1];

draw(arc(A3,1,240,260),p1);
pair Ds []=intersectionpoints(arc(O,1,0,360),arc(A3,1,0,360));
pair A4=Ds[1];

draw(arc(A4,1,300,330),p1);
pair Ds []=intersectionpoints(arc(O,1,0,360),arc(A4,1,0,360));
pair A5=Ds[1];


draw(arc(A5,1,350,390),p1);
pair Ds []=intersectionpoints(arc(O,1,0,360),arc(A5,1,0,360));
pair A6=Ds[1];

draw(A1--A2--A3--A4--A5--A6--cycle,pr);

label("$O$",O+.1S);
label("$A$",A1+.1E);
label("$B$",A2+.1N);
label("$C$",A3+.1E);
label("$D$",A4+.1NE);
label("$E$",A5+.1N);
label("$F$",A6+.1E);

label("$(A,1)$",A2+.3E);
label("$(B,1)$",A3+.3SE);
label("$(C,1)$",A4+.3SE);

dot(O,red+4pt);
dot(A1,blue+4pt);
dot(A2,blue+4pt);
dot(A3,blue+4pt);
dot(A4,blue+4pt);
dot(A5,blue+4pt);
dot(A6,blue+4pt);
