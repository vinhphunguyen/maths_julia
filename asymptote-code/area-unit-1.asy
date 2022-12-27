import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

pair Bezier(pair P[], real t)
{ // https://tex.stackexchange.com/a/554290/236162
  pair Bezi;
  for (int k=0; k <= P.length-1; ++k)
  {
    Bezi=Bezi+choose(P.length-1,k)*(1-t)^(P.length-1-k)*t^k*P[k];
  }
  return Bezi;
}

pair[] P={
  (0,-1),(1,-1),(1,0),
  (1.1,1.5),(0,-1.3),(-1,1),
  (-1,0),(-1,-1),(0,-1)
};

pair F(real t){return Bezier(P,t);}

path p=graph(F,0,1,350);

fill(scale(1.4)*p--cycle,lightgreen);
draw(scale(1.4)*p,red+1.pt);

picture pic;

real w=0.5, h=0.5;

fill(pic,scale(w,h)*unitsquare,lightgreen);

draw(pic,shift(5w+0.6,0)*scale(w,h)*unitsquare,black+1pt);
fill(pic,shift(5w+0.6,0)*scale(w,h)*unitsquare,lightgreen);

label(pic,"$1$",(5w+.6+.5w,-0.2));
label(pic,"$1$",(5w+.6+ w+.2,0.5w));

for (int i = 0; i < 5; ++i )
{
  for (int j = 0; j < 3; ++j )
  {
     draw(pic,shift(i*w,j*h)*scale(w,h)*unitsquare);
  }
}
pair O=(0,0);
Label L1=Label("$5$",align=O,MidPoint,Fill(white));
Label L2=Label("$3$",align=O,MidPoint,Fill(white));
real yy=-0.2;
draw(pic,L1,(0,yy)--(5*w,yy),Arrows(TeXHead),Bars);
draw(pic,L2,(5w+.3,0)--(5*w+0.3,3h),Arrows(TeXHead),Bars);

add(shift(2,-1.2)*pic);