import graph3;

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

surface s2=surface(cubic_Bezier_surface,(0,0),(1,1),nu=20, nv=20);
draw(s2,lightgray+opacity(.6));

pen pr = red+1pt;
pen pp = purple+1pt;
pen pb = blue+1pt;

for (int i = 0; i < 4; ++i )
{
  draw( P[0][i]--P[1][i]--P[2][i]--P[3][i],pp );
  dot(P[0][i]);   dot(P[1][i]);   dot(P[1][i]);   dot(P[2][i]);
}
for (int j = 0; j < 4; ++j )
{
  draw( P[j][0]--P[j][1]--P[j][2]--P[j][3],pp );
  dot(P[j][0]);   dot(P[j][1]);   dot(P[j][2]);   dot(P[j][3]);
}

int numu= 8, numv = 8;
real du = 1/numu, dv=1/numv;

for (int i = 0; i < numu+1; ++i )
{
  real u0= i*du;
  triple fu(real v){ 
    pair p = (u0,v);
    return cubic_Bezier_surface(p);
  }
    path3   gv=graph(fu,0,1);
    draw(gv,pr);
}


for (int i = 0; i < numv+1; ++i )
{
  real u0= i*dv;
  triple fu(real v){ 
    pair p = (v,u0);
    return cubic_Bezier_surface(p);
  }
    path3   gv=graph(fu,0,1);
    draw(gv,pb);
}

label("$P_{k,l}$",P[2][2]+(0,0,0.2));


//draw(surface(patch(P,new pen[]{blue,green,red,yellow})));


