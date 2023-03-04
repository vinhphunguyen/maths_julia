import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

pen p = black + 1pt;

draw(unitcircle,p);
draw(polygon(6),p);

pair O=(0,0);
pair A1=(1,0);
pair A2=dir(60);
pair A3=dir(60*2);
pair A4=dir(60*3);
pair A5=dir(60*4);
pair A6=dir(60*5);


markangle("$60^\circ$",A1,O,A2,n=1,radius=9mm,Fill(orange));

draw(O--A1,StickIntervalMarker(1,2,angle=-25 ) );
draw(O--A2,StickIntervalMarker(1,2,angle=-25 ) );
draw(A1--A2,StickIntervalMarker(1,2,angle=-25 ) );


label("$O$",O+.1S);
label("$A$",A1+.1E);
label("$B$",A2+.1E);

dot(O,red+4pt);
dot(A1,red+4pt);
dot(A2,red+4pt);
dot(A3,red+4pt);
dot(A4,red+4pt);
dot(A5,red+4pt);
dot(A6,red+4pt);