import graph;
import geometry;
import gsl;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

real a=2; 
real b=1.5; 
real c=sqrt(a^2-b^2);

pair ellipse_param(real t)
{
	return (a*cos(t), b*sin(t));
}

real t0=pi/3;

pair ellipse_param_der(real t)
{
	return (-a*sin(t), b*cos(t));
}

pair ellipse_tangent_p0(real t)
{
	pair P0 = ellipse_param(t0);
	pair va = ellipse_param_der(t0);
	return (P0.x + t*va.x, P0.y + t * va.y);
}

real tmin=-0.7, tmax=0.8;

path el         = graph(ellipse_param,0,2pi);
path el_tangent = graph(ellipse_tangent_p0,tmin,tmax);

pair F1=(-c,0);
pair F2=( c,0);

pair P=ellipse_param(t0);
pair Q=ellipse_param(0.8pi);
pair sl=ellipse_param_der(t0);

pen pb =blue+1pt;
pen pr =red+1pt;
pen p =black+1pt;
pen pd =dashed+.6pt;
pen pg =gray+1pt;

draw(el,pb);
draw(el_tangent,pg);
draw(F1--P,p);
draw(F2--P,p);

pair pa = 0.6P + 0.4F2;
pair pb = ellipse_tangent_p0(-0.3);

draw("$\theta_2$",arc(P,pa,pb),PenMargins);


pair pa = 0.6P + 0.4F1;
pair pb = ellipse_tangent_p0(0.3);

draw("$\theta_3$",arc(P,pb,pa),PenMargins);




real PF2=length(F2-P);
real F1a=degrees(atan2(P.y-F1.y,P.x-F1.x));
real F2a=degrees(atan2(P.y-F2.y,F2.x-P.x));
real theta1=.5(F1a+F2a)-degrees(atan(abs(sl.y/sl.x)));
pair F2p=P+PF2*dir(theta1);

draw(F2--F2p,p);
draw(P--F2p,p);

pair pa = 0.6F2p + 0.4P;
pair pb = ellipse_tangent_p0(-0.3);

draw("$\theta_1$",arc(P,pb,pa),PenMargins);


draw(P--F2,StickIntervalMarker(1,2,angle=25 ) );
draw(P--F2p,StickIntervalMarker(1,2,angle=25 ) );

draw(F1--Q,pd);
draw(F2p--Q,pd);
draw(F2--Q,pd);

write(theta1);

label("$F_1$",F1+.2S);
label("$F_2$",F2+.2S);
label("$F_2'$",F2p+.2E);
label("$P$",ellipse_param(t0)+.2N);
label("$Q$",Q+.2N);
label("$E$",ellipse_param(1.8pi)+.2E);
label("$L$",ellipse_tangent_p0(.6)+.2N);

dot(P,blue+4pt);
dot(Q,black+4pt);
dot(F1,red+4pt);
dot(F2,red+4pt);

