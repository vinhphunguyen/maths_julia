import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.2pt;
pen pd = dashed+1.pt;

pair A = (0,0);
pair B = (2,0);
pair B1 = (4,0);
pair C = (2,2);
pair C1 = (4,4);
pair D = (4,2);

draw(pic2,A--B1--C1,p);
draw(pic2,B--C,p);
draw(pic2,B1--C1,p);
draw(pic2,A--C1,pd);
draw(pic2,C--D,pd);
draw(pic2,B--D,pd);

label(pic2,"$A$",A+0.3N);
label(pic2,"$B$",B+0.3NE);
label(pic2,"$B'$",B1+0.3E);
label(pic2,"$C$",C+0.4N);
label(pic2,"$C'$",C1+0.4E);

label(pic2,"$5$",.5(B+C)+0.2E);
label(pic2,"$5$",.5(B1+D)+0.2E);
label(pic2,"$5$",.5(D+C1)+0.2E);

Label L1=Label("$4$",align=(0,0),MidPoint,Fill(white));
Label L2=Label("$8$",align=(0,0),MidPoint,Fill(white));
draw(pic2,L1,A+.3S--B+.3S,black+1pt,Arrows(TeXHead),Bars);
draw(pic2,L2,A+.7S--B1+.7S,black+1pt,Arrows(TeXHead),Bars);

dot(pic2,A,orange+4pt);
dot(pic2,B,orange+4pt);
dot(pic2,B1,orange+4pt);
dot(pic2,C,orange+4pt);
dot(pic2,C1,orange+4pt);

add(pic2);


