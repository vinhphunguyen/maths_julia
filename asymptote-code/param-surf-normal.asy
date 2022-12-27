import graph3;
usepackage("amsmath");

size(8cm,0);
settings.render = 32;
currentprojection=orthographic((-1,-1,3),zoom=.99);

triple[][] P={
  {(-1,-1,-0.5), (-1,-0.3,0), (-1,0.3,0), (-1,1,-0.5)},
  {(-0.3,-1,0), (-0.3,-0.3,0.5), (-0.3,0.3,0.5), (-0.3,1,0)},
  {(0.3,-1,0), (0.3,-0.3,0.5), (0.3,0.3,0.5), (0.3,1,0)},
  {(1,-1,-0.5), (1,-0.3,0), (1,0.3,0), (1,1,-0.5)}
};

real[] cubic_bernstein(real t)
{
  real[] res = {(1-t)^3, 3*t*(1-t)^2,3*t^2*(1-t),t^3};
  return res;
}

real[] cubic_bernstein_1st_derivative(real t)
{
  real[] res = {-3(1-t)^2, 3-12t+9t^2,6t-9t^2,3t^2};
  return res;
}

triple cubic_Bezier_surface(pair p){
  real u=p.x;
  real v=p.y;
  
  triple pnt=O;
  
  real [] B1 = cubic_bernstein(u);
  real [] B2 = cubic_bernstein(v);
  
  for (int i = 0; i < 4; ++i )
  {
    for (int j = 0; j < 4; ++j )
    {
      pnt += B1[i] * B2[j] * P[i][j];
    }
  }

  return pnt;
}

real u0=0.5;
real v0=0.5;

triple cubic_Bezier_surface_der_u(real u){
  real v=v0;
  triple pnt=O;
  
  real [] B1der = cubic_bernstein_1st_derivative(u);
  real [] B2    = cubic_bernstein(v0);
  
  for (int i = 0; i < 4; ++i )
  {
    for (int j = 0; j < 4; ++j )
    {
      pnt += B1der[i] * B2[j] * P[i][j];
    }
  }
  return pnt;
}

triple cubic_Bezier_surface_der_v(real v){
  real u=u0;
  triple pnt=O;
  
  real [] B1   = cubic_bernstein(u);
  real [] B2der = cubic_bernstein_1st_derivative(v);
  
  for (int i = 0; i < 4; ++i )
  {
    for (int j = 0; j < 4; ++j )
    {
      pnt += B1[i] * B2der[j] * P[i][j];
    }
  }
  return pnt;
}



surface s2=surface(cubic_Bezier_surface,(0,0),(1,1),nu=20, nv=20);
draw(s2,lightgreen+opacity(.6));

pen pr = red+1pt;
pen pp = purple+.7pt;
pen pb = blue+1pt;


triple P0=cubic_Bezier_surface((u0,v0));

triple fv(real v){ 
    pair p = (u0,v);
    return cubic_Bezier_surface(p);
}

triple fu(real u){ 
    pair p = (u,v0);
    return cubic_Bezier_surface(p);
}

path3   gu=graph(fu,0,1);
path3   gv=graph(fv,0,1);

draw(gu,pr);
draw(gv,pb);

triple tangent_u = cubic_Bezier_surface_der_u(v0);
triple tangent_v = cubic_Bezier_surface_der_v(u0);

tangent_u = tangent_u/length(tangent_u);
tangent_v = tangent_v/length(tangent_v);

real alpha=0.5;
triple Pu = P0 + alpha*tangent_u;
triple Pv = P0 + alpha*tangent_v;

triple normal=alpha*cross(tangent_u,tangent_v)/length(cross(tangent_u,tangent_v));

//write(tangent_u);

draw(P0--Pu,pr,Arrow3(8pt));
draw(P0--Pv,pb,Arrow3(8pt));
draw(P0--P0+normal,pp,Arrow3);

// tangent plane going P0, two vectors a and b
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

dot(P0,black+4pt);


//label("$C_u$",fu(1)+(0,0,0.2),red);
//label("$C_v$",fv(1)+(0,0,0.2),blue);
//label("$\boldsymbol{r}_u$",alpha*tangent_u+(0,0,0.4),red);
//label("$\boldsymbol{r}_v$",alpha*tangent_v+(0,0,0.4),blue);
//label("$\boldsymbol{N}$",alpha*normal+(0,0,0.6),purple);
//label("$\boldsymbol{P}(u_0,v_0)$",P0+(0.,0,-0.3));
//label("$S$",cubic_Bezier_surface((.1,.1))+(0,0,0.));


//draw(surface(patch(P,new pen[]{blue,green,red,yellow})));


