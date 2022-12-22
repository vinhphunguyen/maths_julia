import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf


size(12cm, keepAspect=true);
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


pair[] P={(0.5,1.5),(1.5,.5),(3,2.2)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);
pair A = F(0.);
pair B = F(1);
pair C = F(.5);
pair C1 = F(.48);
pair C2 = F(.52);

picture pic1, pic2;

pen p =red+.9pt;
pen pp =purple+.9pt;
pen pd =dashed+.5pt;

draw(pic1,graph(F,0,1,350),red+.9pt);

label(pic1,"$\boxed{M,L,g,\rho}$",(1.8,.6));


draw(pic1,Label("$x$",Relative(0.99)),(-.1,0)--(3.2,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.1)--(0,2.7),black+.6pt,Arrow(TeXHead));

label(pic1,"$A(x_1,y_1)$",A+(0.1,0.3));
label(pic1,"$B(x_2,y_2)$",B+(0.,0.4));


dot(pic1, A,blue+5pt);
dot(pic1, B,blue+5pt);


add(pic1);


// pic2

real f(real x){return 0.125x^2+.3;}
real fder(real x){return 0.25x;}


int n = 8;
real xmin = 2;
real xmax = 4;
real dx=(xmax-xmin)/n;

real tan0(real x){
  real x0=xmin;
  return f(x0)+0.25x0*(x-x0);
}

real tan1(real x){
  real x0=xmax;
  return f(x0)+0.25x0*(x-x0);
}

path g =graph(f,xmin,xmax);
path ta=graph(tan0,xmin,xmin-0.9);
path tb=graph(tan1,xmax,xmax+0.5);

pair pnt(real x){return (x,f(x));}

void draw_force(real x)
{
  pair p=pnt(x);
  pen ppp=black+.5pt;
  real xx=0.4;
  draw(pic2,p--(p.x,p.y-xx),  ppp, ArcArrow );
}

pair A = pnt(xmin);
pair B = pnt(xmax);

draw(pic2,g,p);
draw(pic2,tb,pp,ArcArrow(3pt));
draw(pic2,ta,pp,ArcArrow(3pt));

draw(pic2,A--(A.x,0),pd);
draw(pic2,B--(B.x,0),pd);
draw(pic2,B--(B.x+.5,B.y),pd);
draw(pic2,A--(A.x-.9,A.y),pd);

real yy=-0.2;
draw(pic2,"$x$",(A.x,yy));
draw(pic2,"$x+\Delta x$",(B.x,yy));
draw(pic2,"$T(x+\Delta x)$",(xmax+0.5,tan1(xmax+0.5))+.2N,purple);
draw(pic2,"$T(x)$",(xmin-0.5,tan0(xmin-0.5))+.4S,purple);

draw(pic2,Label("$x$",Relative(0.99)),(xmin-0.2,0)--(xmax+.7,0),black+.6pt,Arrow(TeXHead));

real theta=degrees(fder(xmax));
real theta1=degrees(fder(xmin));
draw(pic2,"$\alpha(x+\Delta x)$",arc(B,0.25,0,theta),PenMargins);
draw(pic2,"$\alpha(x)$",arc(A,0.3,180,180+theta1),PenMargins);

write(fder(xmin));

for (int i = 0; i <= n; ++i)
{
  draw_force(xmin+i*dx);
}

label(pic2,"$\rho \Delta s g$",(0.5(xmin+xmax),0.4));
label(pic2,"$\Delta s$",(0.5(xmin+xmax),1.8));
add(shift(3.,0)*pic2);
