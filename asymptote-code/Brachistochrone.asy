import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

size(10cm, keepAspect=true);
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


pen p= black+1pt;
pen ptt= black+1.3pt;
pen pp= black+.7pt;

picture pic1, pic2;

pair[] P={(0,0),(0.5,-2),(2,-2)};
pair[] P1={(0,0),(0.5,-3),(2,-2)};
pair F(real t){return Bezier(P,t);}
pair G(real t){return Bezier(P1,t);}

pair A = (0,0);
pair B = F(1);
pair C = F(.5);

draw(pic1, graph(F,0,1,350),red+.9pt);
draw(pic1, graph(G,0,1,350),purple+.9pt);
draw(pic1,A--B, p);
draw(pic1,C--C+.4S, pp,ArcArrow(2pt));

label(pic1,"$A$",A+0.2W);
label(pic1,"$B$",B+.4E);
label(pic1,"$m$",C+.25NE);
label(pic1,"$g$",C+.6S+.2NE);
label(pic1,"$?$",.5(A+B)+.2N);
label(pic1,"$a)$", (A.x-0.2,B.y-0.2) );
label(pic2,"$b)$", (A.x-0.45,B.y-0.2) );

dot(pic1,A,red+3pt);
dot(pic1,B,red+3pt);
dot(pic1,C,red+5pt);

add(pic1);

// pic2


draw(pic2,Label("$x$",Relative(0.99)),(0,0)--(B.x+.6,0),black+.7pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,0)--(0,B.y-0.4),black+.7pt,Arrow(TeXHead));

pair[] P={(0,0),(0.5,-2),(2,-2)};
pair F(real t){return Bezier(P,t);}

pair A = (0,0);
pair B = F(1);
pair C = F(.5);

draw(pic2, graph(F,0,1,350),red+.9pt);

label(pic2,"$A$",A+0.2W);
label(pic2,"$B(a,b)$",B+.5E);
label(pic2,"$f(x)$", C + .89SE );
label(pic2,"$m$",C+.25NE);

dot(pic2,A,red+3pt);
dot(pic2,B,red+3pt);
dot(pic2,C,red+5pt);


add(shift(3.7,0)*pic2);


