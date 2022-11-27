import graph;
usepackage("amsmath");
usepackage("bm");
usepackage("empheq");
usepackage("color");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

import geometry;

size(14cm, keepAspect=true);
defaultpen(fontsize(14pt));

//add(shift(-1,-1)*grid(19,10,gray+0.2pt));

picture pic1, pic2;

path p=shift(-0.5,-0.5)*unitsquare;

real a=5, b = 0.2;
real c = 0.9;
real xx=a/2-1;

fill(pic1,scale(a,b)*p,lightyellow);
fill(pic1,shift(xx,0)*scale(.2,b)*p,gray);

draw(pic1,scale(a,b)*p,black+1pt);

draw(pic1,(-a/2,-c)--(-a/2,c),dashed+black+.6pt);
draw(pic1,(0,-c)--(0,c),dashed+black+.6pt);

real rad = .5;
path ar = arc((0,0),rad,180,360);

draw(pic1,Label("$\omega$",align=E,EndPoint),yscale(.5)*shift(0,1.9)*ar,Arrow,PenMargins);
draw(pic1,Label("$\omega$",align=E,EndPoint),yscale(.5)*shift(-a/2,1.9)*ar,Arrow,PenMargins);

Label L2=Label("$L$",align=(0,0),MidPoint,Fill(white));
Label L1=Label("$x$",align=(0,0),MidPoint,Fill(white));
real yy = -1.2;
draw(pic1,L2,(-a/2,yy)--(a/2,yy),Arrows(TeXHead),Bars);
draw(pic1,L1,(0,yy/2)--(xx,yy/2),Arrows(TeXHead),Bars);

label(pic1,"$O$",(-0.2,-0.4));
label(pic1,"$A$",(-a/2-0.4,0));
label(pic1,"$dx$",(xx,0.6));

label(pic1,"$a)$",(-a/2,-1.9));
label(pic2,"$b)$",(-a/2,-1.9));

dot(pic1,(0,0),black+3pt);
dot(pic1,(-a/2,0),black+3pt);

add(pic1);

// pic2


path p=shift(-0.5,-0.5)*unitsquare;

real a=5, b = 0.2;
real c = 0.9;
real xx=-a/2+2.3;
real zz=-1;

fill(pic2,scale(a,b)*p,lightyellow);
fill(pic2,shift(xx,0)*scale(.2,b)*p,gray);

draw(pic2,scale(a,b)*p,black+1pt);

draw(pic2,(zz,-c)--(zz,c),dashed+black+.6pt);

real rad = .5;
path ar = arc((0,0),rad,180,360);

draw(pic2,Label("$\omega$",align=E,EndPoint),yscale(.5)*shift(zz,1.9)*ar,Arrow,PenMargins);

Label L2=Label("$L$",align=(0,0),MidPoint,Fill(white));
Label L1=Label("$x$",align=(0,0),MidPoint,Fill(white));
Label L3=Label("$t$",align=(0,0),MidPoint,Fill(white));
real yy = -1.5;
real yy1 = 2yy/3;
real yy2 = yy1/2;
draw(pic2,L2,(-a/2,yy)--(a/2,yy),Arrows(TeXHead),Bars);
draw(pic2,L1,(-a/2,yy1)--(xx,yy1),Arrows(TeXHead),Bars);
draw(pic2,L3,(-a/2,yy2)--(zz,yy2),Arrows(TeXHead),Bars);

label(pic2,"$A$",(-a/2-0.4,0));
label(pic2,"$dx$",(xx,0.6));

dot(pic2,(zz,0),black+3pt);


add(shift(6.,0)*pic2);
