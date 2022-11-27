import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf


size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

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

draw(pic1,graph(F,0,1,350),red+.9pt);

label(pic1,"$\boxed{M,L,g,\rho}$",(1.8,2));


draw(pic1,Label("$x$",Relative(0.99)),(-.1,0)--(3.2,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-.1)--(0,2.7),black+.6pt,Arrow(TeXHead));

label(pic1,"$A(x_1,y_1)$",A+(0.,0.2));
label(pic1,"$B(x_2,y_2)$",B+(0.,0.2));


dot(pic1, A,blue+5pt);
dot(pic1, B,blue+5pt);


add(pic1);
