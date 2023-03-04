import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10.5cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic2, pic3;

// pic 2
draw(pic2,unitcircle,black+1.pt);

pair O=(0,0);
pair A=dir(200);
pair B=dir(-30);
pair C=dir(96);
pair H=.5(A+B);

pen p = black + 1pt;
draw(pic2,A--B--C--cycle,p);
draw(pic2,O--B--A--cycle,p);
draw(pic2,O--H,p);

markangle("$C$",A,C,B,n=1,radius=5mm);
markangle("$C$",H,O,B,n=1,radius=3mm);
markangle("$C$",A,O,H,n=1,radius=3mm);

label(pic2,"$O$",.15NE);
label(pic2,"$A$", A + .15W );
label(pic2,"$B$", B + .15E );
label(pic2,"$C$", C + .15N );
label(pic2,"$H$", H + .15S );
label(pic2,"$r$", .5(O+B) + .15N );
label(pic2,"$c/2$", .5(H+B) + .15S );

perpendicular(H,NE,H--B,blue);

dot(pic2,(0,0),blue+3pt);

add(pic2);


draw(pic3,unitcircle,black+1.pt);


draw(pic3,A--B--C--cycle,p);

markangle(pic3,"$C$",A,C,B,n=1,radius=5mm);
markangle(pic3,"$A$",B,A,C,n=2,radius=5mm);
markangle(pic3,"$B$",C,B,A,n=3,radius=5mm);

label(pic3,rotate(-54)*"$\sin A$", .6(B+C) + .15E );
label(pic3,rotate(56)*"$\sin B$", .53(A+C) + .15W );
label(pic3,rotate(-6)*"$\sin C$", .5(B+A) + .15S );

label(pic3,"$A$", A + .1W );
label(pic3,"$B$", B + .1E );
label(pic3,"$C$", C + .1N );


add(shift(3,0)*pic3);
