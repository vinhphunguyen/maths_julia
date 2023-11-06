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

// three vertices of the original triangle ABC
pair A = (-0.3,0);
pair B = (1,0);
pair C = (0.4,0.85);

draw(pic3,A--B--C--cycle,p);

label(pic3,"$A$",A+.13S);
label(pic3,"$B$",B+.13S);
label(pic3,"$C$",C+.13N);

label(pic3,"$a$",0.5(B+C)+.16E);
label(pic3,"$b$",0.5(A+C)+.16W);
label(pic3,"$c$",0.5(B+A)+.13S);


// three vertices of the new triangle A'B'C'
real k = 1.3;
pair A1 = shift(1.9,0)*scale(k)*A;
pair B1 = shift(1.9,0)*scale(k)*B;
pair C1 = shift(1.9,0)*scale(k)*C;


draw(pic3,A1--B1--C1--cycle,p);

label(pic3,"$A'$",A1+.13S);
label(pic3,"$B'$",B1+.13S);
label(pic3,"$C'$",C1+.13N);

label(pic3,"$ka$",0.5(B1+C1)+.22E);
label(pic3,"$kb$",0.5(A1+C1)+.22W);
label(pic3,"$kc$",0.5(B1+A1)+.13S);

label(pic3,"SSS",(A.x-0.5,0.5));

add(pic3);

//


label(pic2,"$A$",A+.13S);
label(pic2,"$B$",B+.13S);
label(pic2,"$C$",C+.13N);

label(pic2,"$a$",0.5(B+C)+.16E);
label(pic2,"$b$",0.5(A+C)+.16W);



label(pic2,"$A'$",A1+.13S);
label(pic2,"$B'$",B1+.13S);
label(pic2,"$C'$",C1+.13N);

label(pic2,"$ka$",0.5(B1+C1)+.22E);
label(pic2,"$kb$",0.5(A1+C1)+.22W);

markangle(pic2,"$\alpha$",A,C,B,n=1,radius=4mm,Fill(orange));
markangle(pic2,"$\alpha$",A1,C1,B1,n=1,radius=4mm,Fill(orange));

draw(pic2,A--B--C--cycle,p);
draw(pic2,A1--B1--C1--cycle,p);

label(pic2,"SAS",(A.x-0.5,0.5));

add(shift(0,-1.6)*pic2);

//

label(pic1,"$A$",A+.13S);
label(pic1,"$B$",B+.13S);
label(pic1,"$C$",C+.13N);


label(pic1,"$A'$",A1+.13S);
label(pic1,"$B'$",B1+.13S);
label(pic1,"$C'$",C1+.13N);


markangle(pic1,"$\alpha$",A,C,B,n=1,radius=4mm,Fill(blue));
markangle(pic1,"$\alpha$",B,A,C,n=1,radius=4mm,Fill(orange));
markangle(pic1,"$\alpha$",B1,A1,C1,n=1,radius=4mm,Fill(orange));
markangle(pic1,"$\alpha$",A1,C1,B1,n=1,radius=4mm,Fill(blue));

draw(pic1,A--B--C--cycle,p);
draw(pic1,A1--B1--C1--cycle,p);

label(pic1,"AA",(A.x-0.5,0.5));

add(shift(0,-3.2)*pic1);


