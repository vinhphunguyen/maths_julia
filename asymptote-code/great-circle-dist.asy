import three;
import graph3;
size(7cm);

//settings.outformat="png"; // output is pdf
settings.render = 24;

pen solid=linetype(new real[]);
pen longdashed=linetype(new real[] {10,8});
pen dashed=linetype(new real[] {3,8});

currentprojection=orthographic(1,0,.05,zoom=.8);
//currentprojection=orthographic(
//camera=(5.4290316601351,2.94352790610013,1.1108527434919),up=Z,target=O,zoom=0.7);
real r=1;

triple A,B,C;
A=dir(60.0,20.0);
B=dir(40.0,40.0);
C=dir(80.0,80.0);

guide3 AB=arc(O,A,B,CCW);
guide3 BC=arc(O,B,C,CCW);
guide3 CA=arc(O,C,A,CCW);



guide3 g=AB--BC--CA--cycle;
//fill(project(g),white);

real phi1=radians(30);
draw(arc(O,dir(90.0,270.0),dir(90.0,90.0),Z),blue+1pt);
draw(arc((0,0,sin(phi1)),dir(60.0,270.0),dir(60.0,90.0),Z),blue+1pt);

draw(arc(O,dir(0.0,0.0),dir(180.0,0.0),(.5,1,0)),red+1pt);
draw(arc(O,dir(0.0,0.0),dir(180.0,0.0),(.5,-1,0),CW),red+1pt);


//draw(unitsphere, green+opacity(0.3) );

real a=1, b=1, dy=.5;

triple f(pair p){
  real phi=p.x;
  real theta=p.y;
  real x=a*sin(phi)*cos(theta) ;
  real y=a*sin(phi)*sin(theta);
  real z=a*cos(phi) ;
  return (x,y,z);
}

picture pic1;
surface s2=surface(f,(0,0),(pi/2,pi/2),nu=20, nv=20);
draw(s2,lightgray+opacity(.6));


pen alphaPen=red;
pen betaPen=darkgreen;
pen gammaPen=blue;

void markAngle(string lab,triple v, guide3 gright, guide3 gleft, real arcdist, pen arcpen=currentpen){
  triple t,s;
  t=arcpoint(gright,arcdist); 
  s=arcpoint(gleft,arcdist);
  draw(arc(v,t,s,cross(t-v,s-v),CCW),arcpen);
  label("$"+lab+"$",(v+t+s)/3,arcpen);
}

real ra,rb,rg; 
ra=0.17; rb=0.21; rg=0.4;
//markAngle("\alpha",A,reverse(CA),AB,ra,alphaPen);

triple op=(0,0,sin(phi1));
triple n = dir(90,90-degrees(atan(1/.5)));
triple P = dir(90,-90+degrees(atan(1/.5)));
triple q = dir(60,-90+degrees(atan(1/.5)));
triple m = dir(60,90-degrees(atan(1/.5)));
triple north = dir(0,0);

draw(O--P);
draw(O--n);

draw(op--q);
draw(op--m);
draw(O--op);
draw(O--q);
draw(P--q);

draw(arc(O,0.7O+.3P,.7O+.3n));
draw(arc(op,0.8op+.2q,.8op+.2m));
draw(arc(O,0.7O+.3q,.7O+.3P));
draw(arc(q,0.6q+.4op,.6q+.4O));

label("$\theta$",(O+0.6O+.6P+.6O+.4n)/2);
label("$\varphi$",(O+0.7O+.3q + .7O+.3P)/3);
label("$\varphi$",(q+0.6q+.4op+.6q+.4O)/3);

dot(O,red+3pt);
dot(P,red+3pt);
dot(n,red+3pt);
dot(q,red+3pt);
dot(m,red+3pt);
dot(north,red+5pt);
dot((0,0,sin(phi1)),red+3pt);

label("$O$",O+(.1,.1,.1));
label("$O'$",op+.1Z);
label("$P$",P+(.1,.1,.1));
label("$Q$",q+(-.1,.1,.1));
label("$M$",m+(.1,.1,.1));
label("$N$",n+(.1,.1,.1));
label("North",north+(.1,.1,.2));
label("equator",n+(.8,.4,0));
