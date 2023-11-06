import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

pen p = black + 1pt;
pen pp = purple + .7pt;

draw(unitcircle,p);
draw(polygon(3),pp);
draw(polygon(5),pp);

pair O=(0,0);
pair A1=(0,1);
pair A2=dir(-30);
pair A3=dir(120+90);
pair A4=dir(90+72);
pair A5=dir(60*4);
pair A6=dir(60*5);

draw(A3--A4,pp);

line per1=perpendicular(O,line(A3,A4));
point[] Ds = intersectionpoints(per1, unitcircle);


draw(O--Ds[1],pp);

label("$O$",O+.1S);
label("$A$",A1+.1N);
label("$B$",A2+.13E);
label("$C$",A3+.1S);
label("$E$",A4+.1W);
label("$D$",Ds[1]+.1W);

dot(O,cyan+4pt);
dot(A1,cyan+4pt);
dot(A2,cyan+4pt);
dot(A3,cyan+4pt);
dot(A4,cyan+4pt);
dot(Ds[1],red+4pt);
