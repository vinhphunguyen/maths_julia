import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

point T1=dir(60);
point T2=dir(-60);

pen p =black+1pt;

draw(unitcircle,p);

line ot1=line(origin,T1);
line ot2=line(origin,T2);

line tangent1=perpendicular(T1,ot1);
line tangent2=perpendicular(T2,ot2);

point P = intersectionpoint(tangent1,tangent2);


markangle("$\alpha$",T1,P,origin,n=1,radius=6mm,Fill(orange));
markangle("$\alpha$",origin,P,T2,n=1,radius=6mm,Fill(orange));

draw(origin--T1,p);
draw(origin--T2,p);
draw(T1--P--T2,p);
draw(P--origin,p);

perpendicularmark(tangent1,ot1,quarter=4);
perpendicularmark(tangent2,ot2,quarter=3);

draw(T1--P,StickIntervalMarker(1,1,angle=25 ) );
draw(T2--P,StickIntervalMarker(1,1,angle=25 ) );

label("$O$", origin + .2 S);
label("$T_1$", T1 + .2N);
label("$T_2$", T2 + .2S);
label("$P$", P + .2S);

dot(origin,red+4pt);
dot(T1,red+4pt);
dot(T2,red+4pt);
dot(P,red+4pt);