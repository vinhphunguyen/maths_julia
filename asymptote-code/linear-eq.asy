import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(13cm); // size of the image
defaultpen(fontsize(20pt));

pair A=(0,0);
pair B=(.6,0);

dot(A,black+5.9pt);
dot(B,black+5.9pt);

draw(A--(A.x+.15,0),black+2pt,ArcArrow);
draw(B--(B.x-.15,0),black+2pt,ArcArrow);

label("$x$",(0.15/2,0.03));
label("$x-60$",(B.x-0.15/2+.01,0.03));

Label L1=Label("2400 miles",align=A,MidPoint,Fill(white));
draw(L1,(0,0.15)--(B.x,0.15),black+1.5pt,Arrows(TeXHead),Bars);

real dx = 0.02;
real dx1 = 0.1/2;
draw((B.x+dx1,0)--(B.x+dx1+dx,0)--(B.x+dx1+dx,0.15)--(B.x+dx1,0.15), black+1.2pt );
label("$t=0$",(B.x+0.19-dx1,0.15/2));

//

real z = -0.1;
draw((A.x,z)--(B.x,z),dashed+black+1.2pt);
dot((A.x,z),black+5.9pt);
dot((B.x,z),black+5.9pt);
dot((A.x+.29,z),red+5.9pt);
dot((A.x+.3,z),red+5.9pt);

real z1=z-0.15;
Label L2=Label("$5x$",align=(0,0),MidPoint,Fill(white));
Label L3=Label("$5(x-60)$",align=A,MidPoint,Fill(white));
draw(L2,(0,z1)--(A.x+0.3,z1),black+1.5pt,Arrows(TeXHead),Bars);
draw(L3,(A.x+0.3,z1)--(B.x,z1),black+1.5pt,Arrows(TeXHead),Bars);

draw((B.x+dx1,z1)--(B.x+dx1+dx,z1)--(B.x+dx1+dx,z1+0.15)--(B.x+dx1,z1+0.15),black+1.2pt );
label("$t=5$",(B.x+0.19-dx1,z1+0.15/2));
