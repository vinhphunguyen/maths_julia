import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
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

fill(graph(F,0,1,350)--cycle,lightgreen);
draw(graph(F,0,1,350),red+1.3pt);

label("$P$",(0,0));
label("$f(x)$",(1.05,0));
label("$f(x)=?$",(.1,-0.4));
label("maximize the area",(.1,-0.6));
