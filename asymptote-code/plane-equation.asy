usepackage("amsmath");

size(4cm,0);
settings.outformat="png";
settings.render = 16;

import graph3;

//currentprojection=orthographic((-1,-1,3),zoom=.99);

// tangent plane going P0, two vectors a and b

triple P0=O;
triple tangent_u=(1,0,0);
triple tangent_v=(0,1,0);

triple tangent_plane(pair p)
{
  real u = p.x;
  real v = p.y;
  real x = P0.x + u * tangent_u.x + v * tangent_v.x;
  real y = P0.y + u * tangent_u.y + v * tangent_v.y;
  real z = P0.z + u * tangent_u.z + v * tangent_v.z;
  
  return (x,y,z);
}

surface s=surface(tangent_plane,(-.5,-.5),(.5,.5),nu=20, nv=20);
draw(s,orange+opacity(.8));

real alpha=0.5;
triple normal=alpha*cross(tangent_u,tangent_v)/length(cross(tangent_u,tangent_v));

//write(tangent_u);
pen pp=red+1pt;
draw(P0--P0+normal,pp,Arrow3);

dot(P0,black+4pt);