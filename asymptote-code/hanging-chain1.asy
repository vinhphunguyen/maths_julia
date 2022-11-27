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

draw(graph(F,0,1,350),red+.9pt);
draw(C2--C1,black+1.9pt);

label("$\boxed{M,L,g,\rho}$",(1.8,2));


draw(Label("$x$",Relative(0.99)),(-.1,0)--(3.2,0),black+.6pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,-.1)--(0,2.7),black+.6pt,Arrow(TeXHead));

label("$A(x_1,y_1)$",A+(0.,0.2));
label("$B(x_2,y_2)$",B+(0.,0.2));
label("$ds$",C1+(0.,0.2));

Label L2=Label("$y(x)$",align=O,MidPoint,Fill(white));

real x = .7, x1=3.5;
draw(L2,(C.x,0)--C,Arrows(TeXHead),Bars);

dot(A,blue+5pt);
dot(B,blue+5pt);


