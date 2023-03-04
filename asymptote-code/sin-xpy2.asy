import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(12pt));
size(6cm, keepAspect=true);

void plot_label(pair A, pair B, pair C, string s, real l)
{
	pair AB=B-A;
	AB=AB/length(AB);
	real alpha=degrees(acos(AB.x));
	if ( AB.y < 0 ) alpha = -alpha;
	pair normal=(-AB.y,AB.x);
	if (dot(normal,C-.5(A+B)) > 0 ) normal *= -1;
	label(rotate(alpha)*s,.5(A+B)+l*normal,blue);
}


picture pic1;

real alpha=pi/6, beta = pi/6;

pair O = (0,0);
pair A = (cos(alpha)*cos(beta),0);
pair B = (cos(alpha)*cos(beta),cos(beta)*sin(alpha));
pair C = dir(degrees(alpha+beta));
pair D = (A.x,C.y);
pair H = (C.x,0);
pair F = (0,D.y);

write(C);

fill(O--B--C--cycle,lightcyan);

draw(O--A,black+1.0pt);
draw(O--C,black+1.2pt);
draw(O--B,black+1.0pt);
draw(A--D,black+1.0pt);
draw(C--D,black+1.0pt);
draw(C--B,black+1.0pt);
draw(C--F--O,black+1.0pt);
//draw(C--H,gray+1.0pt);

markangle("$\alpha+\beta$",F,C,O,n=2,radius=7mm);


perpendicular(F,SE,F--C,blue);
perpendicular(B,NE,B--C,blue);
perpendicular(D,SE,D--B,blue);
perpendicular(A,NW,A--(2,0),blue);

draw(Label("$\alpha$",MidPoint,Fill(white)),arc((0,0),0.26,0,degrees(alpha)),black+1.pt);
draw(Label("$\beta$",MidPoint ),arc((0,0),0.2,degrees(alpha),degrees(alpha+beta)),black+1.pt);
draw(Label("$\alpha$",MidPoint,Fill(white)),arc(B,0.2,90,90+degrees(alpha)),black+1.pt);

//label(pic1,"$x+2y=2$",(1.2,1));

Label L1=Label("$1$",align=(0.,.0),MidPoint);
Label L2=Label("$\cos\beta$",align=(0.,.0),MidPoint);
Label L3=Label("$\sin\beta$",align=(0.,.0),MidPoint);
label(rotate(degrees( alpha+beta ))*L1, (0.2,B.y));
label(rotate(degrees( alpha ))*L2, (0.4,.3));
label(rotate( degrees(alpha)-90)*L3, (0.58,.6));

plot_label(O,A,D,"$\cos\alpha\cos\beta$",.07);
plot_label(A,B,O,"$\sin\alpha\cos\beta$",.07);
plot_label(B,D,C,"$\sin\beta\cos\alpha$",.07);
plot_label(O,F,B,"$\sin(\alpha+\beta)$",.07);
plot_label(F,C,B,"$\cos(\alpha+\beta)$",.07);
plot_label(C,D,A,"$\sin\alpha\sin\beta$",.07);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
