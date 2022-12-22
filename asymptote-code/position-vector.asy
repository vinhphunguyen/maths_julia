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

picture pic1, pic2;

pair[] P={(-.5,.7),(1,2),(1.5,1.7),(1.8,1.)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);
pair A = F(0);
pair B = F(1);
pair P = F(0.5);

draw(pic1, graph(F,0,1,350),red+.9pt);

draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(2.,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$z$",Relative(0.99)),(0,0)--(0,2),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$x$",Relative(0.99)),(0,0)--(-1,-1),black+.6pt,Arrow(TeXHead));

pen p= black+1pt;
pen pr= purple+1pt;
pen ptt= black+1.3pt;
pen pp= gray+.7pt;

label(pic1,"$\boldsymbol{R}(t)$",(P.x-0.3,P.y-1));

dot(pic1,A,red+2pt);
dot(pic1,B,red+2pt);
dot(pic1,P,red+4pt);

draw(pic1,O--P,p,ArcArrow(3pt));


add(pic1);

// pic2

pair[] P={(.1,1.5),(1,0.5),(2,1.2)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);
pair A = F(0.4);
pair B = F(0.9);

draw(pic2, graph(F,0,1,350),red+.9pt);

draw(pic2,Label("$x$",Relative(0.99)),(0,0)--(2.,0),black+.6pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,0)--(0,2),black+.6pt,Arrow(TeXHead));

pen p= black+1pt;
pen ptt= black+1.3pt;
pen pp= gray+.7pt;

draw(pic2,O--A,p,ArcArrow(3pt));
draw(pic2,O--B,p,ArcArrow(3pt));
draw(pic2,A--B,pr,ArcArrow(3pt));

label(pic2,"$\boldsymbol{R}(t)$",(A.x-0.57,A.y-.3));
label(pic2,"$\boldsymbol{R}(t+\Delta t)$",(B.x-0.3,B.y-.65));
label(pic2,"$\Delta \boldsymbol{R}$",(B.x-0.6,B.y+.2),purple);

add(shift(2.6,0)*pic2);




