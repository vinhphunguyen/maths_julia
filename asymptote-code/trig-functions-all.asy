import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(7.5cm, keepAspect=true);

picture pic2, pic3;

// pic 2

void plot_label(pair A, pair B, string s, real l)
{
	pair AB=B-A;
	AB=AB/length(AB);
	real alpha=degrees(acos(AB.x));
	if ( AB.y < 0 ) alpha = -alpha;
	pair normal=(-AB.y,AB.x);
	label(rotate(alpha)*s,.5(A+B)+l*normal,blue);
}

draw(pic2,Label("$x$",Relative(0.99)),(-1.1,0)--(1.8,0),black+1pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-1.1)--(0,1.6),black+1pt,Arrow(TeXHead));

draw(pic2,unitcircle,black+1.1pt);

real theta=50;
real thetaR = theta * pi/180;
pair A=dir(theta);
pair D=(cos(thetaR)+sin(thetaR)*tan(thetaR),0);
pair e = (0,sqrt(1+cot(thetaR)^2));

markangle("$x$",(0,0),e,A,n=1,radius=4mm,Fill(orange));

draw(pic2,(0,0)--A);
draw(pic2,A--(A.x,0));
draw(pic2,A--(0,A.y));
draw(pic2,e--A--D);

plot_label((A.x,0), A, "$\sin x$",.1);
plot_label(A, D, "$\tan x$",.1);
plot_label(e, A, "$\cot x$",.1);
plot_label((0,0), (A.x,0), "$\cos x$",-.1);

Label L1=Label(rotate(0)*"$\sec x$",align=(0,0),MidPoint,Fill(white),p=blue);
draw(pic2,L1,(0,-.35)--(D.x,-.35),Arrows(TeXHead),Bars);

Label L2=Label(rotate(90)*"$\csc x$",align=(0,0),MidPoint,Fill(white),p=blue);
draw(pic2,L2,(-.25,0)--(-.25,e.y),Arrows(TeXHead),Bars);

draw(pic2,"$x$",arc((0,0),0.26,0,theta),Arrow,PenMargins);

label(pic2,"$O$",(-0.1,-0.1),blue);
label(pic2,"$1$",(0.3,0.5),blue);
label(pic2,"$A$",A+(0.1,0.2),blue);
label(pic2,"$B$",(1.1,-0.14),blue);
label(pic2,"$A'$",(A.x,-0.14),blue);
label(pic2,"$D$",D+.1S,blue);
label(pic2,"$E$",e+.1W,blue);


perpendicularmark(line(A,D),line((0,0),A),quarter=4);

dot(pic2,A,blue+3pt);
dot(pic2,(0,0),blue+3pt);
dot(pic2,(1,0),blue+3pt);
dot(pic2,D,blue+3pt);
dot(pic2,e,blue+3pt);

add(pic2);



