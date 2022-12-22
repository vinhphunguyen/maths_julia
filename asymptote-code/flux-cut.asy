import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);

pair A=(2,1.2);
pair B=(2,2.3);


pair[] pts={ (1,1.5), A, (3,2), (2.8,2.5), B, (1,2) };

path g=graph(pts,operator..)..cycle;

pen p=black+1pt;
pen pr=red+1pt;
pen pd=dashed+black+1pt;


draw(g,p);


real dr=0.7;
pair cen   = 0.5( A  + B );
pair cenl  = cen-(dr,0);
pair cenr  = cen+(dr,0);

pair AB=  cenl -  B;
real r=length(AB);

real alpha = degrees( atan ( (cen.y-A.y)/(cen.x-cenl.x) ) );
real beta  = degrees( atan ( (cen.y-A.y)/(cenr.x-cen.x) ) );

fill(arc(cenl,r,-alpha,alpha)--arc(cenr,r,180-beta,180+beta)--cycle,green);

draw(arc(cenl,r,-alpha,alpha),pd);
draw(arc(cenr,r,180-beta,180+beta),p);

//dot((2,1.2),red+4pt);
//dot((2,2.8),red+4pt);
//dot(cenl,purple+4pt);
//dot(cenr,purple+4pt);


label("$S_{ab}$",(2,2));
label("$S_{a}$",(1.6,2.5));
label("$S_{b}$",(2.5,2.65));
label("$V,S$",(3.2,2.));
label("$V_1,S_1$",(1.4,1.4));
label("$V_2,S_2$",(2.5,2.1));
label("$\boldsymbol{n}_{1}$", cen + .55E );
label("$\boldsymbol{n}_{2}$", cen + .55W );

draw(cen--cen+.4E,p,ArcArrow(3pt));
draw(cen--cen+.4W,pr,ArcArrow(3pt));

// pic2

pair[] pts={ (1,1.5), A, (3,2), (2.8,2.5), B, (1,2) };

path g=graph(pts,operator..)..cycle;

pen p=black+1pt;
pen pd=dashed+black+1pt;

picture pic2;

//draw(pic2,A+2S--B+N--(0,B.y+1)--(0,A.y+2)--cycle);

picture clipped1;
draw(clipped1,g,p);
clip(clipped1,A+2S--B+N--(0,B.y+1)--(0,A.y+2)--cycle);
add(shift(3,0)*clipped1);

real dr=0.7;
pair cen   = 0.5( A  + B );
pair cenl  = cen-(dr,0);
pair cenr  = cen+(dr,0);

pair AB=  cenl -  B;
real r=length(AB);

real alpha = degrees( atan ( (cen.y-A.y)/(cen.x-cenl.x) ) );
real beta  = degrees( atan ( (cen.y-A.y)/(cenr.x-cen.x) ) );

fill(pic2,arc(cenl,r,-alpha,alpha)--arc(cenr,r,180-beta,180+beta)--cycle,green);

draw(pic2,arc(cenl,r,-alpha,alpha),pd);
draw(pic2,arc(cenr,r,180-beta,180+beta),p);

draw(pic2,cen--cen+.4E,p,ArcArrow(3pt));

label(pic2,"$V_1,S_1$",(1.4,1.4));
label(pic2,"$S_{ab}$",(2,2));
label(pic2,"$S_{a}$",(1.6,2.5));
label(pic2,"$\boldsymbol{n}_{1}$", cen + .5E );

add(shift(3,0)*pic2);
