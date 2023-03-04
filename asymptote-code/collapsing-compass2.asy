import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

pair A=(0,0);
pair B=(2,0);
pair C=(3,0);

real ab=length(A-B);
real bc=length(C-B);

pair e=ab*dir(60);
pair f=C+bc*dir(180+60);
pair D=C+ab*dir(60);

pen p=black+1pt;
pen pt=black+.8pt;

draw(A--B--e--cycle,p);
draw(B--C--f--cycle,p);
draw(f--C+1.2ab*dir(60),p);
draw(arc(f,ab+bc,40,80),p);

label("$A$",A+.2S);
label("$B$",B+.2SW);
label("$C$",C+.2E);
label("$D$",D+.2N);
label("$E$",e+.2N);
label("$F$",f+.2S);

label("$a$",.5(A+B)+.18S);
label("$a$",.5(A+e)+.18W);
label("$a$",.5(B+e)+.18E);
label("$a$",.5(C+D)+.18E);

label("$b$",.5(C+B)+.18S);
label("$b$",.5(f+B)+.18S);
label("$b$",.5(f+C)+.18S);


dot(A,blue+3);
dot(B,blue+4);
dot(C,blue+4);
dot(D,red+4);
dot(f,purple+4);
dot(e,purple+4);

