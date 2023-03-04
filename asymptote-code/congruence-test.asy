import graph;
import geometry;
import markers;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p = black+1.pt;
pen p1 = black+.5pt;


pair A = (-0.3,0);
pair B = (1,0);
pair C = (0.4,0.85);

pair A1 = shift(1.9,0)*rotate(20)*A;
pair B1 = shift(1.9,0)*rotate(20)*B;
pair C1 = shift(1.9,0)*rotate(20)*C;

pair A2 = shift(3.5,0)*A;
pair B2 = shift(3.5,0)*B;
pair C2 = shift(3.5,0)*C;

//fill(pic3,A--B--C--cycle,mediumgray);


markangle(pic3,"$\alpha$",B,A,C,n=1,radius=4mm,Fill(orange));
draw(A--B,StickIntervalMarker(1,1,angle=25 ) );
draw(A--C,StickIntervalMarker(1,2,angle=25 ) );

draw(pic3,A--B--C--cycle,p);


label(pic3,"$A$",A+.13S);
label(pic3,"$B$",B+.13S);
label(pic3,"$C$",C+.13N);



dot(pic3,A,black+4pt);
dot(pic3,B,black+4pt);
dot(pic3,C,black+4pt);

markangle(pic3,"$\alpha$",B1,A1,C1,n=1,radius=4mm,Fill(orange));
draw(A1--B1,StickIntervalMarker(1,1,angle=25 ) );
draw(A1--C1,StickIntervalMarker(1,2,angle=25 ) );

draw(pic3,A1--B1--C1--cycle,p);

label(pic3,"$A'$",A1+.13S);
label(pic3,"$B'$",B1+.13S);
label(pic3,"$C'$",C1+.13N);


dot(pic3,A1,black+4pt);
dot(pic3,B1,black+4pt);
dot(pic3,C1,black+4pt);

label(pic3,"SAS",(A.x-0.5,0.5));

add(pic3);

// pic 2
pair A = (-0.3,0);
pair B = (1,0);
pair C = (0.4,0.85);

pair A1 = shift(1.9,0)*rotate(30)*A;
pair B1 = shift(1.9,0)*rotate(30)*B;
pair C1 = shift(1.9,0)*rotate(30)*C;

//fill(pic3,A--B--C--cycle,mediumgray);


markangle(pic2,"$\alpha$",B,A,C,n=1,radius=4mm,Fill(orange));
markangle(pic2,"$\beta$",C,B,A,n=2,radius=4mm,Fill(yellow));
draw(pic2,A--B,StickIntervalMarker(1,1,angle=25 ) );

draw(pic2,A--B--C--cycle,p);

label(pic2,"$A$",A+.13S);
label(pic2,"$B$",B+.13S);
label(pic2,"$C$",C+.13N);


dot(pic2,A,black+4pt);
dot(pic2,B,black+4pt);
dot(pic2,C,black+4pt);

markangle(pic2,"$\alpha$",B1,A1,C1,n=1,radius=4mm,Fill(orange));
markangle(pic2,"$\beta$",C1,B1,A1,n=2,radius=4mm,Fill(yellow));
draw(pic2,A1--B1,StickIntervalMarker(1,1,angle=25 ) );

draw(pic2,A1--B1--C1--cycle,p);

label(pic2,"$A'$",A1+.13S);
label(pic2,"$B'$",B1+.13S);
label(pic2,"$C'$",C1+.13N);


dot(pic2,A1,black+4pt);
dot(pic2,B1,black+4pt);
dot(pic2,C1,black+4pt);

label(pic2,"ASA",(A.x-0.5,0.5));

add(shift(0,-1.5)*pic2);

// pic1

pair A = (-0.3,0);
pair B = (1,0);
pair C = (0.4,0.85);

pair A1 = shift(1.9,0)*rotate(30)*A;
pair B1 = shift(1.9,0)*rotate(30)*B;
pair C1 = shift(1.9,0)*rotate(30)*C;

//fill(pic3,A--B--C--cycle,mediumgray);


draw(pic1,A--B,StickIntervalMarker(1,1,angle=25 ) );
draw(pic1,B--C,StickIntervalMarker(1,2,angle=25 ) );
draw(pic1,A--C,StickIntervalMarker(1,3,angle=25 ) );

draw(pic1,A--B--C--cycle,p);

label(pic1,"$A$",A+.13S);
label(pic1,"$B$",B+.13S);
label(pic1,"$C$",C+.13N);


dot(pic1,A,black+4pt);
dot(pic1,B,black+4pt);
dot(pic1,C,black+4pt);

draw(pic1,A1--B1,StickIntervalMarker(1,1,angle=25 ) );
draw(pic1,B1--C1,StickIntervalMarker(1,2,angle=25 ) );
draw(pic1,A1--C1,StickIntervalMarker(1,3,angle=25 ) );

draw(pic1,A1--B1--C1--cycle,p);

label(pic1,"$A'$",A1+.13S);
label(pic1,"$B'$",B1+.13S);
label(pic1,"$C'$",C1+.13N);


dot(pic1,A1,black+4pt);
dot(pic1,B1,black+4pt);
dot(pic1,C1,black+4pt);

label(pic1,"SSS",(A.x-0.5,0.5));

add(shift(0,-3)*pic1);
