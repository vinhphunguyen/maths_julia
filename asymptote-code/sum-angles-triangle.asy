import graph;
import geometry;
import markers;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.pt;
pen p1 = black+.7pt;


pair A = (-0.3,0);
pair B = (1,0);
pair C = (0.4,0.85);

pair C1 = (0.,0.85);
pair C2 = (0.9,0.85);

//fill(pic3,A--B--C--cycle,mediumgray);


markangle(pic3,"$\alpha$",B,A,C,n=1,radius=4mm,Fill(orange));
markangle(pic3,"$\alpha$",C1,C,A,n=1,radius=4mm,Fill(orange));

markangle(pic3,"$\beta$",C,B,A,n=1,radius=4mm,Fill(yellow));
markangle(pic3,"$\beta$",B,C,C2,n=1,radius=4mm,Fill(yellow));
markangle(pic3,"$\gamma$",A,C,B,n=1,radius=4mm,Fill(purple));

draw(pic3,A--B--C--cycle,p);
draw(C1--C2,p1);

label(pic3,"$A$",A+.1S);
label(pic3,"$B$",B+.1S);
label(pic3,"$C$",C+.1N);

label(pic3,"$l$",C2+.15NW);


dot(pic3,A,black+4pt);
dot(pic3,B,black+4pt);
dot(pic3,C,black+4pt);


add(pic3);



