import graph;
import markers;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(18cm, keepAspect=true);
defaultpen(fontsize(14pt));

//add(shift(-1,-1)*grid(19,10,gray+0.2pt));

picture pic1, pic2, pic3;

pair O = (0,0);
pair A = (1,2.8);
pair B = (4,2.8);
pair M = 0.5(A+B);

draw(A--B,black+1.2pt);


draw(O--A,blue+1.5pt,ArcArrow);
draw(O--B,blue+1.5pt,ArcArrow);
draw(O--M,red+1.5pt, ArcArrow);


label(pic1,"$O$",(-0.1,-0.2));
label(pic1,"$A$",A+(0.,0.3));
label(pic1,"$B$",B+(0.,0.3));
label(pic1,"$M$",M+(0.,0.3));

label(pic1,"$\bm{a}$",0.5(A)+(-0.35,-0.),blue);
label(pic1,"$\bm{b}$",0.5(B)+(0.35,0.0),blue);
label(pic1,"$\bm{m}$",0.5(M)+(-0.35,0.0),red);

label(pic1,"$\boxed{\bm{m}=\displaystyle\frac{1}{2}\bm{a}+\frac{1}{2}\bm{b}}$",(B.x-2,0.0),red);
label(pic2,"$\boxed{\bm{m}=\displaystyle\frac{1}{3}\bm{a}+\frac{2}{3}\bm{b}}$",(B.x-2,0.0),red);

draw(A--B,StickIntervalMarker(2,2,blue));

add(pic1);

// pic2

pair M = A/3+2B/3;

draw(pic2,A--B,black+1.2pt);

draw(pic2,O--A,blue+1.5pt,ArcArrow);
draw(pic2,O--B,blue+1.5pt,ArcArrow);
draw(pic2,O--M,red+1.5pt, ArcArrow);



label(pic2,"$O$",(-0.1,-0.2));
label(pic2,"$A$",A+(0.,0.3));
label(pic2,"$B$",B+(0.,0.3));
label(pic2,"$M$",M+(0.,0.3));

label(pic2,"$\bm{a}$",0.5(A)+(-0.35,-0.),blue);
label(pic2,"$\bm{b}$",0.5(B)+(0.35,0.0),blue);
label(pic2,"$\bm{m}$",0.5(M)+(-0.35,0.0),red);

draw(pic2,A--B,StickIntervalMarker(3,2,blue,dotframe(red)));

add(shift(5,0)*pic2);


// pic3

pair A = (0,0);
pair B = (3,1);
pair C = (2,3);

pair M1 = 0.5(B+C);
pair M2 = 0.5(A+C);
pair M3 = 0.5(B+A);

draw(pic3,A--B--C--cycle,blue+1.5pt);

draw(pic3,A--M1,black+1.2pt);
draw(pic3,B--M2,black+1.2pt);
draw(pic3,C--M3,black+1.2pt);

draw(pic3,A--B,StickIntervalMarker(2,2,blue,dotframe(red)));
draw(pic3,B--C,StickIntervalMarker(2,3,blue,dotframe(red)));
draw(pic3,C--A,StickIntervalMarker(2,2,blue,angle=45,dotframe(red)));

label(pic3,"$A$",A+(0.,-0.3));
label(pic3,"$B$",B+(0.,-0.3));
label(pic3,"$C$",C+(0.,0.3));

label(pic3,"$M_1$",M1+(0.3,0.3));
label(pic3,"$M_2$",M2+(-0.3,0.3));
label(pic3,"$M_3$",M3+(0.,-0.3));

pair G = (1/3)*(A+B+C);
label(pic3,"$G$",G+(0.1,-0.3));
dot(pic3,G,red+4.5pt);

add(shift(10,0)*pic3);
