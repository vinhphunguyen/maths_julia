import graph;
usepackage("amsmath");

settings.outformat="pdf"; // output is pdf

size(9cm); // size of the image

defaultpen(fontsize(12pt));

pen p1=black+1.9pt;
pen p2=black+1.pt;

picture pic1, pic2, pic3, pic4;

draw(pic1,(0,0)--(0.5,0),p1);
draw(pic1,(1,0)--(0.5,0),p2);

real y1=-0.05, y2=0.05;

draw(pic1,(0,y1)--(0,y2),p2);
draw(pic1,(0.5,y1)--(0.5,y2),p2);
draw(pic1,(1,y1)--(1,y2),p2);


Label L1=Label("$1/2$",align=(0,0),MidPoint,Fill(white));

draw(pic1,L1,(0.5,0.2)--(1,0.2),Arrows(TeXHead),Bars);

add(pic1);

// pic2
draw(pic2,(0,0)--(0.5,0),p1);
draw(pic2,(1,0)--(0.5,0),p2);

real y1=-0.05, y2=0.05;

draw(pic2,(0,y1)--(0,y2),p2);
draw(pic2,(0.5,y1)--(0.5,y2),p2);
draw(pic2,(1,y1)--(1,y2),p2);

draw(pic2,(1/4,y1)--(1/4,y2),p2);
draw(pic2,(3/4,y1)--(3/4,y2),p2);


Label L1=Label("$1/4$",align=(0,0),MidPoint,Fill(white));

draw(pic2,L1,(0.75,0.2)--(1,0.2),Arrows(TeXHead),Bars);

add(shift(0,-.5)*pic2);

// pic3
draw(pic3,(0,0)--(0.5,0),p1);
draw(pic3,(1,0)--(0.5,0),p2);

real y1=-0.05, y2=0.05;

draw(pic3,(0,y1)--(0,y2),p2);
draw(pic3,(0.5,y1)--(0.5,y2),p2);
draw(pic3,(1,y1)--(1,y2),p2);

draw(pic3,(1/6,y1)--(1/6,y2),p2);
draw(pic3,(2/6,y1)--(2/6,y2),p2);
draw(pic3,(4/6,y1)--(4/6,y2),p2);
draw(pic3,(5/6,y1)--(5/6,y2),p2);

label(pic3,"$1/6$",(.9165,0.25));

draw(pic3,(5/6,0.2)--(1,0.2),Arrows(TeXHead),Bars);

add(shift(0,-1)*pic3);

label(pic4,"$\displaystyle\frac{1}{2}=\frac{2}{4}=\frac{3}{6}$",(0,0));
label(pic4,"$\displaystyle\frac{a}{b}=\frac{c}{d} \Longrightarrow ad=bc$",(0.14,-0.35));

add(shift(-.7,-0.2)*pic4);
