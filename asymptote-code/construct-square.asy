import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

pair A=(0,0);
pair B=(2,0);

pen p=black+1pt;
pen pt=black+.8pt;

draw(A--B,p);
draw(A--B+.5E,p);
draw(arc(B,.3,0,180),pt);

pair B1=B+.3W;
pair B2=B+.3E;

draw(arc(B1,length(B1-B2),0,100),pt);
draw(arc(B2,length(B1-B2),90,150),pt);

pair Ds []=intersectionpoints(arc(B1,length(B1-B2),0,100),arc(B2,length(B1-B2),90,150));
pair B1 = Ds[0];

line BB1=line(B,B1);
draw(BB1,pt);

draw(arc(B,length(B-A),80,100),pt);

pair C = (B.x,length(A-B));
draw(C--(A.x,C.y)--A,pt);

label("$A$",A+.12S);
label("$B$",B+.12S);
label("$C$",C+.12S);
label("$D$",(A.x,C.y)+.12S);

dot(A,blue+20pt);
dot(B,blue+4pt);
dot(B1,blue+4pt);
dot(C,blue+4pt);

