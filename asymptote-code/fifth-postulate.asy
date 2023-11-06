import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

pair A=(1.3,1.2);
pair B=(1.5,4.2);

pair A1=(1.1,4);
pair A2=(3,3);

pair B1=(1,1.2);
pair B2=(3,2.2);


point ppp=intersectionpoint(line(A,B),line(A1,A2));
pair  ppp1=intersectionpoint(line(A,B),line(B1,B2));
pair  ppp2=intersectionpoint(line(A1,A2),line(B1,B2));

markangle("$\alpha$",A,ppp,A2,n=1,radius=4mm,Fill(yellow));
markangle("$\beta$",B2,ppp1,B,n=2,radius=4mm,Fill(orange));

pen p=black+1pt;
pen pr=red+.8pt;

draw(A--B,pr);
draw(A1--A2,p);
draw(B1--B2,p);

label("$(l)$",0.5(A1+A2)+.2N);
label("$(m)$",0.5(B1+B2)+.2S);
label("$(n)$",.5(A+B)+.2W);

label("$\alpha+\beta < 180^\circ \Longrightarrow$",(3,2.5));

dot(ppp1,black+4pt);
dot(ppp,black+4pt);

picture pic2;

draw(pic2,A--B,pr);
draw(pic2,A1--ppp2,p);
draw(pic2,B1--ppp2,p);

label(pic2,"$(l)$",0.5(A1+A2)+.2N);
label(pic2,"$(m)$",0.5(B1+B2)+.2S);
label(pic2,"$(n)$",.5(A+B)+.2W);


dot(pic2,ppp1,black+4pt);
dot(pic2,ppp,black+4pt);
dot(pic2,ppp2,red+4pt);

add(shift(4,0)*pic2);
