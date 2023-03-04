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

triple A,B,C,D;
A=dir(60.0,20.0);
B=dir(40.0,40.0);
C=dir(80.0,80.0);
D=dir(120.0,30.0);

guide3 AB=arc(O,A,B,CCW);
guide3 BC=arc(O,B,C,CCW);
guide3 CD=arc(O,C,D,CCW);
guide3 DA=arc(O,D,A,CCW);


real phi1=radians(30);
draw(AB,blue+1pt);
draw(BC,blue+1pt);
draw(CD,blue+1pt);
draw(DA,blue+1pt);

dot(A,red+3pt);
dot(B,red+3pt);
dot(C,red+3pt);
dot(D,red+3pt);

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
surface s2=surface(f,(0,0),(pi,2pi),Spline);
draw(s2,lightgray+opacity(.1));


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

