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

pair A1 = shift(1.2,1)*rotate(30)*A;
pair B1 = shift(1.2,1)*rotate(30)*B;
pair C1 = shift(1.2,1)*rotate(30)*C;

//fill(pic3,A--B--C--cycle,mediumgray);


markangle(pic3,"$\alpha$",B,A,C,n=1,radius=4mm,Fill(orange));
markangle(pic3,"$\beta$",C,B,A,n=1,radius=4mm,Fill(yellow));
markangle(pic3,"$\gamma$",A,C,B,n=1,radius=4mm,Fill(purple));

draw(pic3,A--B--C--cycle,p);

label(pic3,"$A$",A+.13S);
label(pic3,"$B$",B+.13S);
label(pic3,"$C$",C+.13N);


dot(pic3,A,black+4pt);
dot(pic3,B,black+4pt);
dot(pic3,C,black+4pt);

markangle(pic3,"$\alpha$",B1,A1,C1,n=1,radius=4mm,Fill(orange));
markangle(pic3,"$\beta$",C1,B1,A1,n=1,radius=4mm,Fill(yellow));
markangle(pic3,"$\gamma$",A1,C1,B1,n=1,radius=4mm,Fill(purple));

draw(pic3,A1--B1--C1--cycle,p);

label(pic3,"$A'$",A1+.13S);
label(pic3,"$B'$",B1+.13S);
label(pic3,"$C'$",C1+.13N);


dot(pic3,A1,black+4pt);
dot(pic3,B1,black+4pt);
dot(pic3,C1,black+4pt);

add(pic3);



