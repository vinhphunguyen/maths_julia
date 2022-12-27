import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm); // size of the image
defaultpen(fontsize(12pt));

pair O=(0,0);
pair A=(1,.6);
pair B=(2,.6);
pair F1=(.4,.3);
pair F2=(.4,-.3);

pen p = black+1pt;
pen p1 = black+.6pt;
pen pg = gray+.6pt;

draw(B--(0,B.y),pg);
draw(O--(0,B.y),pg);

draw(O--A,p,ArcArrow);
draw(O--B,p,ArcArrow);
draw(A--A+F1,p,ArcArrow);
draw(B--B+F2,p,ArcArrow);
draw(A--A+(.4,0),p,ArcArrow);
draw(B--B+(-.4,0),p,ArcArrow);



perpendicular((0,B.y),SE);

label("$m_1$", A+.2N);
label("$m_2$", B+.2N);
label("$O$", O+.2E);
label("$\boldsymbol{F}_1$", A+F1+.1E);
label("$\boldsymbol{F}_2$", B+F2+.1E);
label("$\boldsymbol{F}_{12}$", A+(.4,0)+.1S);
label("$\boldsymbol{F}_{21}$", B+(-.4,0)+.15N);

dot(O,black+4pt);
dot(A,black+7pt);
dot(B,black+5pt);