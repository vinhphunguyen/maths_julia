import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 8cm, keepAspect=true);

int n=128;
real r=1;
real alpha=360/n;
real beta=0.5*(180-alpha);

pair O=(0,0);

picture pic1, pic2;

for(int i=0; i<n/2; ++i)
{
    draw(pic1, arc(O,r,i*alpha,(i+1)*alpha),PenMargins );
    draw(pic1, O--r*dir((i+1)*alpha));
    path p =  r*dir(-i*alpha)--O;
    filldraw(pic1, arc(O,r,-(i+1)*alpha,-i*alpha) -- p -- cycle, mediumgray );
}

string s1 = ".....";
string s2= (string) 12345;

string s = s1 + s2;
label(pic1,s,(0,-1));

write(choose(5, 3));

add(pic1);

// pic2

pair A = r*dir(alpha+beta);
pair B = r*dir(beta);
real dis = B.x-A.x;

pair C = (0,A.y);
path arc1 = arc(O,r,beta,alpha+beta);
path arc2 = shift(0.5*dis,-B.y)*rotate(180,C)*arc1;

path wedge_upper = O--B--arc(O,r,beta,alpha+beta)--cycle;
path wedge_lower = O--arc2--B--cycle;


for(int i=0; i<n/2; ++i)
{
   draw(pic2, shift(i*dis,0)*wedge_upper);
   filldraw(pic2, shift(i*dis,0)*wedge_lower,mediumgray);
}


Label L1=Label("$\pi r$",align=O,MidPoint,Fill(white));
Label L2=Label("$r$",align=O,MidPoint,Fill(white));

draw(pic2,L1,(A.x,A.y+.5)--(A.x+0.5*n*dis,A.y+.5),Arrows(TeXHead),Bars);
draw(pic2,L2,(A.x-.3,0)--(A.x-.3,A.y),Arrows(TeXHead),Bars);

add(shift(2,-.5)*pic2);
