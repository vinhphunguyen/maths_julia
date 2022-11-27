import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

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

unitsize(1cm);
pair[] P={(0,0),(1,1),(2,-1)};
pair[] Q={(0,0),(1,1),(2,-1),(3,0)};
pair F(real t){return Bezier(P,t);}
pair G(real t){return Bezier(Q,t);}

draw(graph(F,0,1,350),red);
draw(operator --(... P));
draw(shift(0,-2)*graph(G,0,1,350),red);
draw(shift(0,-2)*operator --(... Q));
