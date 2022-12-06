import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

size(13cm, keepAspect=true);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


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

pair[] P={(.5,.7),(1.5,1.7),(2.5,1.2)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);
pair A = F(0);
pair B = F(1);

pair A1 = F(0.4);
pair B1 = F(0.5);

pair T1=(1,0.5);
pair T2=(1.5,0.5);
pair T3=(1.5,0.9);

draw(pic1, graph(F,0,1,350),red+.9pt);
label(pic1,"$f(x)$",(2.,1.7));
label(pic1,"$ds$",(A1.x,A1.y+0.2));

label(pic1,"$dx$",0.5(T1+T2) +.1S );
label(pic1,"$dy$",0.5(T2+T3) + .2E);
label(pic1,"$ds$",0.5(T1+T3) + .2N);

draw(pic1,Label("$x$",Relative(0.99)),(-.1,0)--(3.2,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.1)--(0,2),black+.6pt,Arrow(TeXHead));

pen p= black+1pt;
pen ptt= black+1.3pt;
pen pp= gray+.7pt;

draw(pic1,A--(A.x,0), pp);
draw(pic1,B--(B.x,0), pp);

draw(pic1,A1--B1, ptt);

draw(pic1,T1--T2--T3--cycle, p);

dot(pic1,(A.x,0),red+2pt);
dot(pic1,(B.x,0),red+2pt);

labelx(pic1,"$a$",(A.x,0));
labelx(pic1,"$b$",(B.x,0));

add(pic1);

// pic2


draw(pic2,Label("$x$",Relative(0.99)),(-.1,0)--(3.2,0),black+.6pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.1)--(0,2),black+.6pt,Arrow(TeXHead));

draw(pic2, graph(F,0,1,350),red+.9pt);
label(pic2,"$f(x)$",(2.,1.7));

pair A1 = F(0.22);
pair B1 = F(0.5);
pair C1 = F(0.72);

draw(pic2,A1--(A1.x,0),pp);
draw(pic2,B1--(B1.x,0),pp);
draw(pic2,C1--(C1.x,0),pp);
draw(pic2,A1--(B1.x,A1.y),pp);
draw(pic2,A1--(B1.x,B1.y+0.15)--B1,pp);

label(pic2,"$x_i$",     (A1.x,-0.2));
label(pic2,"$x_{i+1}$", (B1.x,-0.2));
label(pic2,"$x_{i+2}$", (C1.x,-0.2));

label(pic2,"$\Delta x_i$", 0.5(A1+B1) +.3S );
label(pic2,"$\Delta y_i$", (B1.x+0.2,B1.y-0.2)  );
label(pic2,"$\Delta s_i$", (B1.x-0.3,B1.y+.2)  );

add(shift(3.5,0)*pic2);



