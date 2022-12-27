import solids;
import graph3;

settings.outformat="pdf";
//settings.render = 0;

//settings.render=0;
//settings.prc=false;

size(12cm,0);
//settings.outformat="pdf"; // output is pdf
currentprojection = orthographic(20,30,10);

triple Bezier(triple P[], real t)
{ // https://tex.stackexchange.com/a/554290/236162
  triple Bezi;
  for (int k=0; k <= P.length-1; ++k)
  {
    Bezi=Bezi+choose(P.length-1,k)*(1-t)^(P.length-1-k)*t^k*P[k];
  }
  return Bezi;
}

triple[] P={(0,0,0),(2,2,0),(4,0,0)};


triple F(real t){return Bezier(P,t);}

real t=1.;

path3 l= graph(F,0,t,350);
draw(l,red+1.5pt);

currentlight = light(diffuse = new pen[] {cyan, orange},
                     specular = new pen[] {black, white},
                     position = new triple[] {-Y+Z, X+Y});

revolution sur=revolution(O,l,X,0,360);
draw(surface(sur), meshpen=gray,  surfacepen=white+opacity(.6));

real a=1,b=1;
xaxis3("$x$",-a-0.5,a+0.5,black+1pt,Arrow3);
yaxis3("$y$",-b-0.5,b+0.5,black+1pt,Arrow3);
zaxis3("$z$",-1.5,1.5,Arrow3);


