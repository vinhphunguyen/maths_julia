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

pair[] P={(.5,2),(1,0.5),(1.5,.7),(2.5,1.)};
pair F(real t){return Bezier(P,t);}

pair O = (0,0);
pair A = F(0);
pair B = F(1);
pair P = F(0.33);
pair Q = F(0.55);
pair P1 = 0.6P;

draw(pic1, graph(F,0,1,350),red+.9pt);

draw(pic1,Label("$x$",Relative(0.99)),(0,0)--(2.5,0),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,0)--(0,2),black+.6pt,Arrow(TeXHead));
draw(pic1,Label("$z$",Relative(0.99)),(0,0)--(-1,-1),black+.6pt,Arrow(TeXHead));

pen p= black+1pt;
pen pr= purple+1pt;
pen pp= red+1pt;

draw(pic1,O--P,gray+.7pt);


label(pic1,"$M$", 0.4W );
label(pic1,"$m$", P + 0.4N );
label(pic1,"$1$", A + 0.3N );
label(pic1,"$2$", B + 0.3N );
label(pic1,"Earth", (0.23,-0.4) );
label(pic1,"$r$", 0.5P + .2W );
label(pic1,"$C$", B - (0.2,.4) );
label(pic1,"$\boldsymbol{F}$", P1 + .4E, purple );
label(pic1,"$d\boldsymbol{s}$", Q + .4N );
label(pic1,"$\hat{\boldsymbol{r}}$", .35P + .4E , red);

draw(pic1,P--P1,pr,ArcArrow(3pt));
draw(pic1,O--.3P,pp,ArcArrow(3pt));
draw(pic1,P--Q,p,ArcArrow(3pt));

dot(pic1,O,red+6pt);
dot(pic1,A,black+3pt);
dot(pic1,B,black+3pt);
dot(pic1,P,purple+5pt);


string s="\begin{minipage}{3cm}
\begin{align*}
\boldsymbol{F} &= \displaystyle-\frac{GMm}{r^2}\hat{\boldsymbol{r}},\quad \hat{\boldsymbol{r}} = \frac{1}{r}(x,y,z)^\top \\ 
r^2 &= x^2+y^2+z^2\\
\boldsymbol{F}\cdot d \boldsymbol{s} &= \displaystyle-\frac{GMm}{r^2} \left( \frac{1}{r}\right)(xdx+ydy+zdz)
\end{align*}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(pic1,s,(6.5,.8));

add(pic1);





