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


picture pic1, pic2;

pair[] P={(0.3,1),(2,2),(3.2,1.5)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);
pair A = F(0.0);
pair B = F(0.5);
pair C = F(1.0);

path p12 = graph(F,0,1.0,350);
path p1 = graph(F,0,0.5,350);
path p2 = graph(F,0.5,1.0,350);


fill(pic1,(A.x,0)--A--p1--(B.x,0)--cycle,green);
fill(pic1,(B.x,0)--B--p2--(C.x,0)--cycle,cyan);

draw(pic1,p12,red+.9pt);


draw(pic1,A--(A.x,0),black+.4pt);
draw(pic1,B--(B.x,0),black+.4pt);
draw(pic1,C--(C.x,0),black+.4pt);

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelA = Label("$a$", position=EndPoint);
Label ticklabelB = Label("$b$", position=EndPoint);
Label ticklabelC = Label("$c$", position=EndPoint);

draw((A.x,0), xtick, L=ticklabelA, black+.4pt);
draw((B.x,0), xtick, L=ticklabelC, black+.4pt);
draw((C.x,0), xtick, L=ticklabelB, black+.4pt);

draw(pic1,Label("$x$",Relative(0.99)),(-.1,0)--(3.5,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.5)--(0,3),black+.6pt,Arrow(TeXHead));

label(pic1,"$\displaystyle\int_a^c f(x)dx$",(1.1,.5));
label(pic1,"$\displaystyle\int_c^b f(x)dx$",(2.53,.5));

dot(pic1,(A.x,0),red+2pt);
dot(pic1,(B.x,0),red+2pt);
dot(pic1,(C.x,0),red+2pt);

add(pic1);

// pic2

pair[] P={(0.5,1),(2,2),(3,1.5)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);
pair A = F(0.0);
pair B = F(0.5);
pair C = F(1.0);

path p12 = graph(F,0,1.0,350);
fill(pic2,(A.x,0)--A--p12--(C.x,0)--cycle,cyan);

draw(pic2,graph(F,0,1,350),red+.9pt);
draw(pic2,A--(A.x,0),black+.4pt);
draw(pic2,C--(C.x,0),black+.4pt);

path xtick = (A.x,0) -- (A.x,-0.15);
path ytick = (C.x,0) -- (C.x,-0.15);

Label ticklabelA = Label("$a$", position=EndPoint);
Label ticklabelB = Label("$b$", position=EndPoint);

draw(pic2,xtick, L=ticklabelA, black+.5pt);
draw(pic2,ytick, L=ticklabelB, black+.5pt);


draw(pic2,Label("$f(x) >0$",align=E, position=BeginPoint),(1.2,2.3)--(1.2,1.4),Arrow);  

label(pic2,"$\displaystyle\int_a^b f(x)dx > 0$",(1.7,.5));


draw(pic2,Label("$x$",Relative(0.99)),(-.1,0)--(3.5,0),black+.6pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.5)--(0,3),black+.6pt,Arrow(TeXHead));


add(shift(4,0)*pic2);



