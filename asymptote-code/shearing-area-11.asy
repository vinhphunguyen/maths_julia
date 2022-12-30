import graph;
import geometry;
import gsl;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2, pic3;

pen p =black+1pt;
real a=2, b=1;

fill(pic1,scale(a,b)*unitsquare,mediumgray);
draw(pic1,scale(a,b)*unitsquare,p);

real yy=-0.15;
label(pic1,"$a$",(0.5a,yy));
label(pic1,"$b$",(yy,0.5b));
label(pic1,"$A=ab$",(.5a,0.5b));

label(pic1,"$a)$",(1.3a,-0.5));
label(pic3,"$b)$",(.0,-0.5));

add(pic1);

// pic2
real c=0.5;
pen pr=red+1pt;
pen p1=black+.7pt;

draw(pic2,"shearing",(0.5a,b+.2)--(0.3a,b+.2),ArcArrow);

fill(pic2,(0,0)--(a,0)--(a-c,b)--(0-c,b)--cycle,mediumgray);
draw(pic2,(0,0)--(a,0)--(a-c,b)--(0-c,b)--cycle,pr);
draw(pic2,scale(a,b)*unitsquare,p1);

real yy=-0.15;
label(pic2,"$a$",(0.5a,yy));
label(pic2,"$b$",(a-yy,0.5b));

label(pic2,"$A$",(0,0)+.2S) ;
label(pic2,"$B$",(a,0)+.2S) ;
label(pic2,"$C$",(a,b)+.2N) ;
label(pic2,"$C'$",(a-c,b)+.2N) ;
label(pic2,"$D$",(0,b)+.2N) ;
label(pic2,"$D'$",(0-c,b)+.2N) ;

add(shift(3,0)*pic2);

// pic3

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
  (1,0),(2,0),(2,1),
  (2.1,2.5),(1,-.3),(0,2),
  (0,1),(0,0),(1,0)
};

pair F(real t){return Bezier(P,t);}

fill(pic3,graph(F,0,1,350)--cycle,lightgreen);
draw(pic3,graph(F,0,1,350),pr);

real lx=2., ly=1.2;
int nx=8, ny=6;
real dx=lx/nx, dy=ly/ny;

for (int i =0; i < nx+1; ++i)
{
	draw(pic3, (i*dx,0)--(i*dx,ly),p1);
}


for (int i =0; i < ny+1; ++i)
{
	draw(pic3, (0,i*dy)--(lx,i*dy),p1);
}

add(shift(6,0)*pic3);