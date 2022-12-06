import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

size(6cm, keepAspect=true);
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

pair[] P={(0,0),(1,3),(3,3),(4,2)};
pair F(real t){return Bezier(P,t);}

pair A = P[0];
pair B = P[1];
pair C = P[2];
pair D = P[3];

fill(pic1,A--B--C--D--cycle,mediumgray);

draw(pic1, graph(F,0,1,350),red+.9pt);

pen p= black+1pt;
pen ptt= black+1.3pt;
pen pp= gray+.7pt;

label(pic1,"convex hull",(1.9,1.5));
label(pic1,"$P_1$",A+(0,-0.25));
label(pic1,"$P_2$",B+(0,0.25));
label(pic1,"$P_3$",C+(0,0.25));
label(pic1,"$P_4$",D+(0.,-0.25));

draw(pic1,A--B--C--D, p);

dot(pic1,A,red+5pt);
dot(pic1,B,red+5pt);
dot(pic1,C,red+5pt);
dot(pic1,D,red+5pt);

add(pic1);

// pic2





