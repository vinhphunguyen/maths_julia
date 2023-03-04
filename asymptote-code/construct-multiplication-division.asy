import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(10pt));


picture pic1, pic2;

point A1=(0,0);
point A2=(1,0);
point B1=dir(45);
point B2=1.5dir(45);
point A3=(1*1.5,0);


pen p = black  + 1pt;

draw(pic1,A1--A3,p);
draw(pic1,A1--B2,p);

draw(A3--B2,p);
draw(A2--B1,p);

Label La=Label("$a$",align=(0,0),MidPoint,Fill(white));
Label Lab=Label("$ab$",align=(0,0),MidPoint,Fill(white));
Label Lb=Label("$b$",align=(0,0),MidPoint,Fill(white));
Label L1=Label("$1$",align=(0,0),MidPoint,Fill(white));

real y = -0.1;
real y1 = -0.3;
draw(pic1,La,(0,y)--(A2.x,y),Arrows(TeXHead),Bars);
draw(pic1,Lab,(0,y1)--(A3.x,y1),Arrows(TeXHead),Bars);

real alpha=atan2(B2.y,B2.x);
draw(pic1,rotate(degrees(atan2(B2.y,B2.x)))*Lb,A1+.4*(-sin(alpha),cos(alpha))--B2+.4*(-sin(alpha),cos(alpha)),Arrows(TeXHead),Bars);
draw(pic1,rotate(degrees(atan2(B2.y,B2.x)))*L1,A1+.2*(-sin(alpha),cos(alpha))--B1+.2*(-sin(alpha),cos(alpha)),Arrows(TeXHead),Bars);

label("$A$",A2 + .15NE);
label("$B$",A3 + .15NE);
label("$C$",B1 + (.15,0));
label("$D$",B2 + .15NE);

dot(pic1,A1,blue+4pt);
dot(pic1,A2,blue+4pt);
dot(pic1,A3,red+4pt);
dot(pic1,B1,blue+4pt);
dot(pic1,B2,blue+4pt);

add(pic1);

// pic 2 (division)


point A1=(0,0);
point A2=(1,0);
point B1=dir(45);
point B2=1.5dir(45);
point A3=(1*1.5,0);


pen p = black  + 1pt;

draw(pic2,A1--A3,p);
draw(pic2,A1--B2,p);

draw(pic2,A3--B2,p);
draw(pic2,A2--B1,p);

Label La=Label("$a/b$",align=(0,0),MidPoint,Fill(white));
Label Lab=Label("$a$",align=(0,0),MidPoint,Fill(white));
Label Lb=Label("$b$",align=(0,0),MidPoint,Fill(white));
Label L1=Label("$1$",align=(0,0),MidPoint,Fill(white));

real y = -0.15;
real y1 = -0.3;
draw(pic2,La,(0,y)--(A2.x,y),Arrows(TeXHead),Bars);
draw(pic2,Lab,(0,y1)--(A3.x,y1),Arrows(TeXHead),Bars);

real alpha=atan2(B2.y,B2.x);
draw(pic2,rotate(degrees(atan2(B2.y,B2.x)))*Lb,A1+.4*(-sin(alpha),cos(alpha))--B2+.4*(-sin(alpha),cos(alpha)),Arrows(TeXHead),Bars);
draw(pic2,rotate(degrees(atan2(B2.y,B2.x)))*L1,A1+.2*(-sin(alpha),cos(alpha))--B1+.2*(-sin(alpha),cos(alpha)),Arrows(TeXHead),Bars);

dot(pic2,A1,blue+4pt);
dot(pic2,A2,blue+4pt);
dot(pic2,A3,red+4pt);
dot(pic2,B1,blue+4pt);
dot(pic2,B2,blue+4pt);

add(shift(2,0)*pic2);

