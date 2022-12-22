import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");


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

pair[] P={(.2,.5),(1.2,2),(2.2,2.)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);
pair A = F(0);
pair B = F(1);
pair P = F(0.33);
pair Q = F(0.55);
pair P1 = P+(0.12,.4);

draw(pic1, graph(F,0,1,350),red+.9pt);

draw(pic1,Label("$x$",Relative(0.99)),(0,0)--(2.5,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(0,2.3),black+.6pt,Arrow(TeXHead));

pen p= black+1pt;
pen pr= purple+1pt;
pen pp= red+1pt;

label(pic1,"$O$", 0.2W );
label(pic1,"$1$", A + 0.3N );
label(pic1,"$2$", B + 0.3N );
label(pic1,"$C$", B - (0.2,.4) );
label(pic1,"$\nabla \psi$", P1 - (0.26,.0) );
label(pic1,"$d\boldsymbol{s}$", Q + .3S );

draw(pic1,P--Q,pr,ArcArrow(3pt));
draw(pic1,P--P1,p,ArcArrow(3pt));

dot(pic1,A,black+3pt);
dot(pic1,B,black+3pt);
dot(pic1,P,purple+5pt);


add(pic1);

// pic2


pair[] P={(.5,.5),(1.5,2),(2.5,2.)};
pair F(real t){return Bezier(P,t);}

pair A = F(0);
pair B = F(1);

draw(pic2, graph(F,0,1,350),red+.9pt);

label(pic2,"$1$", A + 0.3N );
label(pic2,"$2$", B + 0.3N );

pair X1 = F(0.15);
pair X2 = F(0.3);
pair X3 = F(0.45);
pair X4 = F(0.6);
pair X5 = F(0.75);

label(pic2,"$a$", X1 + 0.19N );
label(pic2,"$b$", X2 + (-0.1,.15) );
label(pic2,"$c$", X3 + 0.15N );
label(pic2,"$e$", X5 + 0.15N );

pair P1 = X2+(0.12,.4);
draw(pic2,X2--P1,p,ArcArrow(3pt));
draw(pic2,X2--X3,pr,ArcArrow(3pt));

label(pic2,"$\nabla \psi_i$", X2 + (0.,.6) );
label(pic2,"$\Delta \boldsymbol{s}_i$", X2 + (.2,-.15) );

label(pic2,"$\displaystyle \int_1^2 \nabla \psi \cdot d\boldsymbol{s}=\lim_{n \rightarrow \infty} \sum_{i=1}^n \left(\nabla \psi \cdot \Delta \boldsymbol{s}\right)_i $", A + (1.7,-0.5) );

dot(pic2,A,black+3pt);
dot(pic2,B,black+3pt);
dot(pic2,X1,black+3pt);
dot(pic2,X2,black+3pt);
dot(pic2,X3,black+3pt);
dot(pic2,X4,black+3pt);
dot(pic2,X5,black+3pt);

add(shift(3,0)*pic2);



