import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

real a=3, b=2,c=1;

pair m1=(0,0); // location of the mass m1
pair m2=(c,0); // location of the mass m2
pair m3=(c,c); // location of the mass m3
pair m4=(0,c); // location of the mass m3

pair m5=(a,0); // location of the mass m1
pair m6=(a+c,0); // location of the mass m2
pair m7=(a+b,0); // location of the mass m3
pair m8=(a+b+c,0); // location of the mass m3

pair m9=(a,c); // location of the mass m1
pair m10=(a+c,c); // location of the mass m2
pair m11=(a+b,c); // location of the mass m3
pair m12=(a+b+c,c); // location of the mass m3

pair m13=(0,b+c); // location of the mass m1
pair m14=(b,b+c); // location of the mass m2
pair m15=(a,b+c); // location of the mass m3
pair m16=(a+b,b+c); // location of the mass m3
pair m17=(a+b+c,b+c); // location of the mass m3


pair m18=(0,a+b+c); // location of the mass m1
pair m19=(a,a+b+c); // location of the mass m2
pair m20=(a+b,a+b+c); // location of the mass m3
pair m21=(a+b+c,a+b+c); // location of the mass m3


pair m22=(a,a+c); // location of the mass m1
pair m23=(a+b,a+c); // location of the mass m2
pair m24=(a+b+c,b+a); // location of the mass m3

pair m25=(a+b,b); // location of the mass m3
pair m26=(a+b+c,b); // location of the mass m3
pair m80=(a+b,a+b); // location of the mass m3

path s1 = m1 -- m2 -- m3 -- m4;
filldraw(s1 -- cycle, green);

path s2 = m5 -- m6 -- m10 -- m9;
filldraw(s2 -- cycle, green);

path s3 = m7 -- m8 -- m12 -- m11;
filldraw(s3 -- cycle, green);

path s4 = m25 -- m26 -- m17 -- m16;
filldraw(s4 -- cycle, green);

path s41 = m80 -- m24 -- m21 -- m20;
filldraw(s41 -- cycle, green);

path s5 = m4 -- (b,c) -- m14 -- m13;
filldraw(s5 -- cycle, orange);

path s6 = m9 -- m11 -- m16 -- m15;
filldraw(s6 -- cycle, orange);

path s7 = m22 -- m23 -- m20 -- m19;
filldraw(s7 -- cycle, orange);

path s8 = m13 -- m15 -- m19 -- m18;
filldraw(s8 -- cycle, mediumgray);

draw(m2--m5--m9--m3);
draw(m6--m7--m11-m10);
draw(m12--m26);
draw(m17--m24);
draw(m16--m80);
//draw((a,c)--m9--m15-m14);
//draw(m16--m17--m24-m80);

label("$a^2$",0.25*(m18+m19+m13+m14));
label("$b^2$",0.25*(m22+m23+m19+m20));
label("$c^2$",0.25*(m80+m24+m21+m20));
label("$b^2$",0.25*(m4+m14+m13+(b,c)));
label("$b^2$",0.25*(m9+m11+m16+m15));
label("$c^2$",0.25*(m25+m26+m16+m17));
label("$c^2$",0.25*(m1+m2+m3+m4));
label("$c^2$",0.25*(m5+m6+m9+m10));
label("$c^2$",0.25*(m8+m7+m11+m12));

pair O=(0,0);

Label L1=Label("$a$",align=O,MidPoint,Fill(white));
Label L2=Label("$b$",align=O,MidPoint,Fill(white));
Label L3=Label("$c$",align=O,MidPoint,Fill(white));

draw(L1,(0,m18.y+.3)--(a,m18.y+.3),Arrows(TeXHead),Bars);
draw(L2,(a,m18.y+.3)--(a+b,m18.y+.3),Arrows(TeXHead),Bars);
draw(L3,(a+b,m18.y+.3)--(a+b+c,m18.y+.3),Arrows(TeXHead),Bars);

draw(L1,(-0.3,m18.y)--(-0.3,m18.y-a),Arrows(TeXHead),Bars);
draw(L2,(-0.3,m18.y-a)--(-0.3,m18.y-a-b),Arrows(TeXHead),Bars);
draw(L3,(-0.3,m18.y-a-b)--(-0.3,m18.y-a-b-c),Arrows(TeXHead),Bars);
