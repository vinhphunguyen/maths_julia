import solids;
import graph3;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="png";
settings.render=2;


//settings.prc=false;
// surface area of 3d solid of revolution, 3d plot
// using bezier curve and revolution

size(8cm,0);
//settings.outformat="pdf"; // output is pdf
currentprojection = orthographic(0,0,1);

triple Bezier(triple P[], real t)
{ // https://tex.stackexchange.com/a/554290/236162
  triple Bezi;
  for (int k=0; k <= P.length-1; ++k)
  {
    Bezi=Bezi+choose(P.length-1,k)*(1-t)^(P.length-1-k)*t^k*P[k];
  }
  return Bezi;
}

triple[] P={(0.5,2,0),(1.5,1,0),(2.5,1,0),(3,3,0),(3.5,2,0)};


triple F(real t){return Bezier(P,t);}

real t=1.;

path3 l= graph(F,0,t,350);
draw(l,red+1.5pt);


revolution sur=revolution(O,l,X,0,360);
draw(surface(sur), 
     surfacepen=white+opacity(.6), light=White);

label("$f(x)$",(1.5,1.6,0),red);
label("$a$",(0.5,0.1,0),red);
label("$b$",(3.5,0.1,0),red);

real a=3.5,b=2;
xaxis3("$x$",0,a+0.5,black+1pt,Arrow3);
yaxis3("$y$",-b-0.5,b+0.5,black+1pt,Arrow3);
zaxis3("$z$",-1.5,1.5,Arrow3);


