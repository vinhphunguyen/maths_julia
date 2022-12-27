import graph3;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf";
settings.render = 0;
defaultrender.merge=true;

size(8cm,0);
currentprojection=orthographic((10,10,7),zoom=.99);

pen pr = red+1pt;
pen pp = purple+1pt;
pen pb = blue+1pt;

real a=sqrt(3), b=1, dy=.5;

triple f(pair p){
  real x=a*cos(p.x);
  real y=a*sin(p.x);
  real z=p.y;
  return (x,y,z);
}
triple f0(real t) {return f((t,0));}
triple f1(real t) {return f((t,1));}

surface s=surface(f,(0,0),(2pi-0.2,2),nu=20, nv=3);
path3 p0=graph(f0,-a,a,operator ..), p1=graph(f1,-a,a,operator ..);

draw(s,lightgray+opacity(.6));

int numu= 20, numv = 3;
real du = 2pi/numu, dv=2/numv;

for (int i = 0; i < numu+1; ++i )
{
  real u0= i*du;
  triple fu(real v){ 
    pair p = (u0,v);
    return f(p);
  }
    path3   gv=graph(fu,0,2);
    draw(gv,pr);
}


for (int i = 0; i < numv+1; ++i )
{
  real u0= i*dv;
  triple fu(real v){ 
    pair p = (v,u0);
    return f(p);
  }
    path3   gv=graph(fu,0,2pi-0.2);
    draw(gv,pb);
}

//dot("$(x,x^2,0)$",(b,b^2,0),align=Z);
//dot(format("$(x,%f,0)$",a^2),  (b,a^2,0),align=Z);

//limits((-.5,-.5,0),(a,a^2+.5,a^2+.5));
xaxis3("$x$",0,a+0.3,Arrow3);
yaxis3("$y$",0,a+0.3,Arrow3);
zaxis3("$z$",0,2.2,Arrow3);