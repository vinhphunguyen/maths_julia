import graph3;

size(8cm,0);
settings.render = 32;
currentprojection=orthographic((-1,-1,3),zoom=.99);


// pic2 

pen pblue=blue+1pt;
pen pred=red+1pt;

real a=1.5, b=1;

triple f(pair p){
  real u=p.x;
  real v=p.y;
  real x=u ;
  real y=sin(0.8u);
  real z=v;
  return (x,y,z);
}

real u0=0.5;
triple fu(real t){ 
  pair p = (u0,t);
  return f(p);
}

real v0=0.5;
triple fv(real t){ 
  pair p = (t,v0);
  return f(p);
}

triple a=f((0.3,0.5));
triple b=f((0.5,0.5));
triple c=f((0.5,0.7));
triple d=f((0.3,0.7));

path3 ct=a--b--c--d--cycle;

picture pic1;
surface s2=surface(f,(0,0),(pi,2),Spline);
path3   gu=graph(fu,0,2);
path3   gv=graph(fv,0,pi);


draw(pic1,s2,lightgray+opacity(.3));
draw(gu);
draw(gv);
draw(ct);



add(shift(0,0,0)*pic1);

