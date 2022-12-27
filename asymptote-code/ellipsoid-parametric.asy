import graph3;

size(8cm,0);
settings.render = 32;
currentprojection=orthographic((-1,-1,3),zoom=.99);

real a=1, b=1, dy=.5;

triple f(pair p){
  real phi=p.x;
  real theta=p.y;
  real x=a*sin(phi)*cos(theta) ;
  real y=a*sin(phi)*sin(theta);
  real z=a*cos(phi) ;
  return (x,y,z);
}

triple f0(real t) {return f((t,0));}
triple f1(real t) {return f((t,1));}

surface s1=surface(f,(0,0),(1.3pi,2pi),Spline);


//draw(s1,lightgray+opacity(.6));

//dot("$(x,x^2,0)$",(b,b^2,0),align=Z);
//dot(format("$(x,%f,0)$",a^2),  (b,a^2,0),align=Z);

//limits((-.5,-.5,0),(a,a^2+.5,a^2+.5));


// pic2 

pen pblue=blue+1pt;
pen pred=red+1pt;

real a=1.5, b=1;

triple f(pair p){
  real u=p.x;
  real v=p.y;
  real x=a*cos(u) ;
  real y=b*sin(u)*cos(v);
  real z=b*sin(u)*sin(v);
  return (x,y,z);
}

triple F(real v) {
    real u = pi/3;
    return ( a*cos(u), b*sin(u)*cos(v), b*sin(u)*sin(v) );
}

triple G(real u) {
    return ( a*cos(u), b*sin(u), 0 );
}

path3 g1 = graph(F, 0, 2pi,n=200);
path3 g2 = graph(G, 0, 2pi,n=200);

picture pic1;
surface s2=surface(f,(0,0),(pi,2pi),Spline);
draw(pic1,s2,lightgray+opacity(.3));
draw(pic1,g1, purple+1.2pt);
draw(pic1,g2, blue+1.2pt);

triple P=F(0);
triple O2=(P.x,0,0);
triple Q=f((pi/3,pi/3));

real alpha=atan(P.y/P.x);
real beta=atan(Q.z/Q.y);

draw(O--P);
draw(P--O2);
draw(O2--Q);
draw("$u$",arc(O,(0.4,0,0), (0.4cos(alpha),0.4sin(alpha),0) ),pred);
draw("$v$",arc(O2,(P.x,0.4,0), (P.x,0.4cos(beta),0.4sin(beta)) ),pblue);

label("$O$",(-0.1,-0.2,0));
label("$P$",P+(0,0.1,0));
label("$Q$",Q+(-0.1,0,0));

dot(pic1,P,black+5pt);
dot(pic1,O2,black+5pt);
dot(pic1,Q,black+5pt);

xaxis3(pic1,"$x$",-a,a+0.3,Arrow3);
yaxis3(pic1,"$y$",-b,b+0.3,Arrow3);
zaxis3(pic1,"$z$",0,b+.3,Arrow3);

add(shift(0,0,0)*pic1);