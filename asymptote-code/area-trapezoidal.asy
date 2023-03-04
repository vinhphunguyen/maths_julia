import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(11cm); // size of the image
defaultpen(fontsize(12pt));

picture pic1, pic2;

pair D=(0,0); // location of the mass m1
pair C=(2,0); // location of the mass m1
pair A=(.5,1); // location of the mass m1
pair H=(A.x,0);
pair B=(2.5,1);
pair O=(0,0);

fill(A--D--C--cycle,mediumgray);
fill(A--B--C--cycle,pink+white);
draw(A--B--C--D-- cycle, black+1pt);
draw(A--H, black+1pt);
draw(A--C, gray+.6pt);

draw(A--B,StickIntervalMarker(1,2,angle=-25 ) );
draw(D--C,StickIntervalMarker(1,2,angle=-25 ) );

draw(A--D,StickIntervalMarker(1,1,angle=-25 ) );
draw(B--C,StickIntervalMarker(1,1,angle=-25 ) );

//draw(A1--B1--C1-- cycle,black+1pt);

Label Ly=Label("$b$",align=O,MidPoint,Fill(white));

real yy=-0.5;
draw(Ly,(D.x,yy)--(C.x,yy),Arrows(TeXHead),Bars);

perpendicular(H,NE,(0,0)--(1,0));

label("$\boxed{A=bh}$", (1.3,1.3));
label("$h$", (H.x+.15,0.5));

label("$A$", A + (-.2,0));
label("$B$", B + ( .2,0.));
label("$C$", C + (0,-.2));
label("$D$", D + (0,-.2));
label("$H$", H + (0,-.2));

// pic2

pair A=(0,0); // location of the mass m1
pair B=(2,0); // location of the mass m1
pair C=(1.5,1); // location of the mass m1
pair D=(.5,1);
pair H=(D.x,0);


fill(pic2,A--D--B--cycle,mediumgray);
fill(pic2,D--B--C--cycle,pink+white);

draw(pic2,A--B--C--D-- cycle, black+1pt);
draw(pic2,B--D, black+1pt);
draw(pic2,H--D, black+1pt);

//draw(A1--B1--C1-- cycle,black+1pt);

Label Lx=Label("$a$",align=O,MidPoint,Fill(white));
Label Ly=Label("$b$",align=O,MidPoint,Fill(white));

real yy=-0.5;
draw(pic2,Ly,(A.x,yy)--(B.x,yy),Arrows(TeXHead),Bars);


label(pic2,"$\boxed{A=0.5(a+b)h}$", (1.1,1.3));
label(pic2,"$h$", (H.x+.15,0.5));
label(pic2,"$a$", (1.1,0.9));

label(pic2,"$A$", A + (-.2,0));
label(pic2,"$B$", B + ( .2,0.));
label(pic2,"$C$", C + (0.2,0));
label(pic2,"$D$", D + (-.2,0));

add(shift(3.7,0)*pic2);


