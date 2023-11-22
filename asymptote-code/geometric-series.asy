import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);

real angleInDegrees = 45;  // Replace 45 with your desired angle in degrees
real alpha          = angleInDegrees * pi/180;
real s = 1/(1-cos(alpha));
real ca= cos(alpha);

void plot_label(pair A, pair B, string s, real l)
{
	pair AB=B-A;
	AB=AB/length(AB);
	real alpha=degrees(acos(AB.x));
	if ( AB.y < 0 ) alpha = -alpha;
	pair normal=(-AB.y,AB.x);
	label(rotate(alpha)*s,.5(A+B)+l*normal,blue);
}

//write(ca);

pen p = black + 1pt;

pair P0 = (0,0);
pair P1 = (1,0);
pair Pi = (s,0);
pair Q1 = P1 + 1 * dir(angleInDegrees);
pair P2 = P1 + (ca,0);
pair P3 = P2 + (ca^2,0);
pair Q2 = P2 + ca * dir(angleInDegrees);
pair Q3 = P3 + ca^2 * dir(angleInDegrees);
pair P4 = P3 + (ca^3,0);
pair P5 = P4 + (ca^4,0);
pair Q4 = P4 + ca^3 * dir(angleInDegrees);

markangle("$\alpha$",P2,P1,Q1,n=1,radius=4mm,Fill(orange));
markangle("$\alpha$",P3,P2,Q2,n=1,radius=4mm,Fill(orange));
markangle("$\alpha$",P4,P3,Q3,n=1,radius=4mm,Fill(orange));

perpendicularmark(line(P1,P2),line(P2,Q1),quarter=2);
perpendicularmark(line(P2,P3),line(P3,Q2),quarter=2);

draw(P0--(Pi+(.2,0)),p);
draw(P1--Q1,p);
draw(Q1--P2,p);
draw(P2--Q2,p);
draw(Q2--P3,p);
draw(P3--Q3--P4,p);
draw(P4--Q4--P5,p);

line m = line(Q1,Q2);

draw(m,p);

label("$P_0$",P0+.1S,red);
label("$P_1$",P1+.1S,red);
label("$P_2$",P2+.1S,red);
label("$P_3$",P3+.1S,red);
label("$P_4$",P4+.1S,red);
label("$Q_1$",Q1+.1N,red);
label("$Q_2$",Q2+.1N,red);
label("$Q_3$",Q3+.1N,red);
label("$P_\infty$",Pi+.1S,red);
label("$x$",Pi+.1N+.2E);

label("$1$",0.5(P0+P1)+.2S,blue);
label("$1$",0.5(P1+Q1)+.1N,blue);
plot_label(P2, Q2, "$\cos\alpha$",.06);
plot_label(P3, Q3, "$\cos^2\alpha$",.08);

plot_label(P1, P2, "$\cos\alpha$",-.2);
plot_label(P2, P3, "$\cos^2\alpha$",-.2);
plot_label(P3, P4, "$\cos^3\alpha$",-.2);
plot_label(P4, Pi, "...",-.1);
plot_label(Pi, Q3, "...",-.1);

dot(P0,black+3pt);
dot(P1,black+3pt);
dot(P2,black+3pt);
dot(P3,black+3pt);
dot(P4,black+3pt);
dot(P5,black+3pt);
dot(Pi,black+3pt);
dot(Q1,black+3pt);
dot(Q2,black+3pt);
dot(Q3,black+3pt);
dot(Q4,black+3pt);