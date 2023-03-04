import graph;
import geometry;
import markers;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10.5cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.pt;
pen p1 = black+.5pt;


pair B = (0,0);
pair C = (2,0);
pair A = (0.8,1.2);

pair P = .6B + .4A;
pair Q = .6C + .4A;


//fill(pic3,A--B--C--cycle,mediumgray);


//draw(A--B,StickIntervalMarker(1,1,angle=25 ) );
//draw(A--C,StickIntervalMarker(1,2,angle=25 ) );
fill(A--P--Q--cycle,mediumgray);

markangle("$\alpha$",B,A,C,n=1,radius=4mm,Fill(orange));
markangle("$\beta$",C,B,A,n=2,radius=4mm,Fill(purple));
markangle("$\gamma$",A,C,B,n=3,radius=4mm,Fill(yellow));

markangle("$\beta$",Q,P,A,n=2,radius=4mm,Fill(purple));
markangle("$\gamma$",A,Q,P,n=3,radius=4mm,Fill(yellow));


draw(A--B--C--cycle,p);
draw(P--Q,p);


label("$A$",A+.13N);
label("$B$",B+.13S);
label("$C$",C+.13S);
label("$P$",P+.13W);
label("$Q$",Q+.13E);

label("$a)$",B+.4W);


// pic1 

pair B = (0,0);
pair C = (2,0);
pair A = (0.8,1.2);

pair P = .6B + .4A;
pair Q = .6C + .4A;
pair A1=shift(B-P)*A;
pair Q1=shift(B-P)*Q;

path pp=A--P--Q--cycle;

fill(pic1,shift(B-P)*pp,mediumgray);

markangle(pic1,"$\alpha$",B,A1,Q1,n=1,radius=4mm,Fill(orange));
markangle(pic1,"$\gamma$",A1,Q1,B,n=3,radius=4mm,Fill(yellow));


draw(pic1,A--B--C--cycle,p);
draw(pic1,shift(B-P)*pp,p);


label(pic1,"$A$",A+.13N);
label(pic1,"$P,B$",B+.13S);
label(pic1,"$C$",C+.13S);
label(pic1,"$A'$",P+.13W);
label(pic1,"$Q'$",Q1+.13S);

label(pic1,"$b)$",B+.4W);

add(shift(3,0)*pic1);
