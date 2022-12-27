import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm); // size of the image
defaultpen(fontsize(12pt));

pair O=(0,0);
pair P=(1,.6);

real beta=degrees(atan(P.y/P.x));
real force=0.5;
real da=30;
real alpha=beta+da;
real Fr=force*cos(radians(alpha));
real Ft=force*sin(radians(alpha));
pair F=P+(Fr,Ft);
pair Fo=(Fr,Ft);
real OP=length(P);
real dtheta=10;
pair Q=OP*dir(beta+dtheta);
pair Xx1 = P + rotate(beta)*(force*cos(radians(da)),0);
pair Xx2 = P + rotate(beta)*(0,force*sin(radians(da)));

write(OP);

pen p = black+1pt;
pen p1 = black+.6pt;
pen pg = gray+.6pt;

draw(O--P,p);
draw(O--Q,p);
draw(F--Xx1,pg);
draw(F--Xx2,pg);
draw(O--1.5OP*dir(beta),p1);
draw(P--P+.4OP*dir(90+beta),p1);
draw(P--F,p,ArcArrow);
draw(P--Xx1,blue+1pt,ArcArrow);
draw(P--Xx2,red+1pt,ArcArrow);

draw(arc(O,OP,beta-22,beta+10),PenMargins);

draw("$\Delta\theta$",arc(O,.9,beta,beta+dtheta),PenMargins);
draw("$\alpha$",arc(P,.3,beta,alpha),PenMargins);
draw("$\alpha$",arc(P,.3,-180+alpha,-180+alpha-da),PenMargins);

pair F(real t) {
    real a = 8.;
    return ( P.x + t * Fo.x, P.y + t * Fo.y  );
}

path g = graph(F, -2.2,0,n=200);
draw(g, gray+.6pt);

pair a=extension(O,O+dir(da+beta-90),P,P+dir(alpha));
draw(O--a,pg);

label("$O$", O + .1S);
label("$m$", P + .1E);
label("$r$", 0.5P + .1S);
label("$F$", F + .1N);
label("$F_r$", Xx1 + .15S);
label("$F_t$", Xx2 + .1N);
label("$r\sin\theta$",  (.22,-.3) );

perpendicular(a,NE,a--P,pg);

string s="\begin{minipage}{3cm}
\begin{align*}
\Delta W &= F_t \times r\Delta\theta\\
&= (F\sin\alpha)\times r\Delta \theta\\
&= (Fr\sin\alpha)\times \Delta \theta\\
\end{align*}
\end{minipage}
";


//label(pic1,s,(2.6,1.8),red);
label(s,(2.1,0.2), black);

dot(O,black+3.5pt);
dot(P,black+5pt);