import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));


picture pic1, pic2, pic3;

real r = 1;

pair O=(0,0);
pair A=(0,0);
pair B=(2,0);
pair C=(.8,1.3);

real Ba=180-degrees(angle(line(A,B),line(B,C)));
real Aa=degrees(atan2(C.y,C.x));



path bb=B--B+10*dir(180-0.5*Ba);
path aa=A--10*dir(.5*Aa);

pair Ds []=intersectionpoints(bb,aa);
pair o = Ds[0];

line per1=perpendicular(o,line(B,C));
line per2=perpendicular(o,line(A,C));
point P = intersectionpoint(per1,line(B,C));
point Q = intersectionpoint(per2,line(A,C));

//write(degrees(angle(line(A,B),line(B,o))));

pen p =black+.8pt;
pen pr =red+.8pt;
pen pb =blue+.8pt;


markangle("$\alpha$",o,B,(o.x,0),n=1,radius=6mm,Fill(orange));
markangle("$\alpha$",C,B,o,n=1,radius=6mm,Fill(orange));


markangle("$\beta$",B,A,o,n=2,radius=6mm,Fill(yellow));
markangle("$\beta$",o,A,Q,n=2,radius=6mm,Fill(yellow));


markangle("$\gamma$",A,C,o,n=3,radius=4mm,Fill(cyan));
markangle("$\gamma$",o,C,B,n=3,radius=4mm,Fill(cyan));

draw(A--B--C--cycle,p);
draw(A--o--B,pb);
draw(A--o--C,pb);
draw(circle(o,o.y),pr);


draw(o--P,p);
draw(o--Q,p);
draw(o--(o.x,0),p);

perpendicularmark(line(A,B),line(o,(o.x,0)),quarter=1);
perpendicularmark(line(C,B),line(o,P),quarter=4);
perpendicularmark(line(A,C),line(o,Q),quarter=4);



label("$A$",A+.1S);
label("$B$",B+.1S);
label("$C$",C+.1N);
label("$O$",o+.1E);
label("$P$",P+.1E);
label("$Q$",Q+.1W);
label("$M$",(o.x,0)+.1S);

dot(o,red+4pt);
dot(A,blue+4pt);
dot(B,blue+4pt);
dot(C,blue+4pt);

dot(P,orange+4pt);
dot(Q,orange+4pt);
dot((o.x,0),orange+4pt);
