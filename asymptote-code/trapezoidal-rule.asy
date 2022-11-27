import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(9pt));

pair Bezier(pair P[], real t)
{ // https://tex.stackexchange.com/a/554290/236162
  pair Bezi;
  for (int k=0; k <= P.length-1; ++k)
  {
    Bezi=Bezi+choose(P.length-1,k)*(1-t)^(P.length-1-k)*t^k*P[k];
  }
  return Bezi;
}

unitsize(1cm);

pair[] P={(1,1),(2,2),(3,1.5)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);
pair A = F(0.2);
pair B = F(0.8);

draw(graph(F,0,1,350),red+.9pt);

fill((A.x,0)--A--B--(B.x,0)--cycle,lightgray);
draw((A.x,0)--A--B--(B.x,0),black+.7pt);

label("$A_i$",(2.,.6));
label("$A_i=\displaystyle\frac{\Delta}{2}(y_i+y_{i+1})$",(2.,2));

Label L1=Label("$y_i$",align=O,MidPoint,Fill(white));
Label L2=Label("$y_{i+1}$",align=O,MidPoint,Fill(white));

real x = .7, x1=3.5;
draw(L1,(x,0)--(x,A.y),Arrows(TeXHead),Bars);
draw(L2,(x1,0)--(x1,B.y),Arrows(TeXHead),Bars);

draw(Label("$x$",Relative(0.99)),(-.1,0)--(3.2,0),black+.6pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,-.5)--(0,3),black+.6pt,Arrow(TeXHead));

dot((A.x,0),red+2pt);
dot((B.x,0),red+2pt);

labelx("$x_i$",(A.x,0));
labelx("$x_{i+1}$",(B.x,0));

