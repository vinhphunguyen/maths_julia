import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(5cm); // size of the image
defaultpen(fontsize(12pt));

pair B11=(4,0); // location of the mass m1
pair D11=(2,2); // location of the mass m1
pair G11=(1,0); // location of the mass m1
pair H=(D11.x,0);

filldraw(G11--B11--D11-- cycle, orange);
draw(G11--B11--D11-- cycle, black+1pt);

//draw(A1--B1--C1-- cycle,black+1pt);
pair O=(0,0);

Label Lx=Label("$x$",align=O,MidPoint,Fill(white));
Label Ly=Label("$y$",align=O,MidPoint,Fill(white));

real yy=-0.5;
draw(Lx,(G11.x,yy)--(H.x,yy),Arrows(TeXHead),Bars);
draw(Ly,(H.x,yy)--(B11.x,yy),Arrows(TeXHead),Bars);
draw(D11--H);

perpendicular(H,NE,(0,0)--(1,0));

label("$h$",(2.2,1.));
label("$A$",D11+.2N);
label("$B$",G11+.2S);
label("$C$",B11+.2S);
label("$a$",.5(G11+B11)+.2S);
label("$b$",.5(D11+B11)+.25E);
label("$c$",.5(D11+G11)+.2W);
