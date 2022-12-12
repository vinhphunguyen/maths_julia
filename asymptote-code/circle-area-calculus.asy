import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(9cm, 9cm, keepAspect=true);

int  n=16;
real r=1;
real alpha=360/n;
real beta=0.5*(180-alpha);

pair O=(0,0);

picture pic1, pic2;


fill(pic2,O--(1,0)--arc(O,1,0,90)--(0,1)--cycle,mediumgray);
draw(pic2,arc(O,1,0,90),red+1pt);
label(pic2,"$y=\sqrt{1-x^2}$",(0.95,1.1),red);


draw(pic2,Label("$x$",Relative(0.99)),(-0.1,0)--(1.4,0),black+.9pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.5)--(0,1.4),black+.9pt,Arrow(TeXHead));

draw(pic2,"$A$",(.4,.4));
draw(pic2,"$r$",(.5,-.1));

add(shift(0,-.5)*pic2);

// pic1
int i = 1;
path p =  O--r*dir(alpha);
filldraw(pic1, arc(O,r,(i)*alpha,(i+1)*alpha) -- dir(2alpha)--(0,0) -- cycle, mediumgray );

draw(pic1,"$\small d\theta$",arc(O,0.4,(i)*alpha,(i+1)*alpha),PenMargins);


for(int i=0; i<n/2; ++i)
{
    draw(pic1, arc(O,r,i*alpha,(i+1)*alpha),PenMargins );
    draw(pic1, O--r*dir((i+1)*alpha));   
    path p =  r*dir(-i*alpha)--O;
    draw(pic1, arc(O,r,-(i+1)*alpha,-i*alpha) -- p -- cycle );
}
draw(pic1,arc(O,1,(i)*alpha,(i+1)*alpha),red+1pt);
draw(pic1,"$rd\theta$",(1.2,.6));

add(shift(3,0)*pic1);

// pic2


