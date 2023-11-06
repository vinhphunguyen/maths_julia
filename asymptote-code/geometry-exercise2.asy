import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

real r = 1;

pair C=(0,0);
pair B=(5,0);
pair A=(1.7,3.4);
pair AB=0.5(A+B);
pair AC=0.5(A+C);

//write(degrees(angle(line(A,B),line(B,o))));

pen p =black+1pt;
pen pr =red+.8pt;
pen pb =blue+.5pt;
pen pc =purple+.5pt;

draw(A--B--C--cycle,p);

label("$A$",A+.3N);
label("$B$",B+.3S);
label("$C$",C+.3S);

path omega1 = circle(AB,length(A-AB));
path omega2 = circle(AC,length(A-AC));

draw(omega1,pr);
draw(omega2,pr);

label("$(\omega_1)$",(B.x,A.y+.4));
label("$(\omega_2)$",(C.x,A.y+.4));

line BB1=perpendicular(B,line(A,C));
line CC1=perpendicular(C,line(A,B));

pair[] intersections1 = intersectionpoints(CC1, omega1);
pair[] intersections2 = intersectionpoints(BB1, omega2);

pair M = intersections1[0];
pair n = intersections1[1];
pair P = intersections2[0];
pair Q = intersections2[1];

point B1 = intersectionpoint(BB1, line(A,C));
point C1 = intersectionpoint(CC1, line(A,B));

draw(B--P,pc);
draw(C--M,pc);

draw(AB--M,pc);
draw(AB--n,pc);
draw(A--M,pc);
draw(A--n,pc);
draw(A--P,pc);

path omega = circle(A,length(A-M));

draw(omega,cyan+.5pt);

label("$B'$",B1+.4N+(-.1,0));
label("$C'$",C1+.3E);
label("$P$",P+.3S);
label("$Q$",Q+.35S+(.1,0));
label("$M$",M+.3NE);
label("$N$",n+.35S);
label("$E$",AB+.35S);

dot(A,blue+4pt);
dot(B,blue+4pt);
dot(C,blue+4pt);
dot(B1,blue+4pt);
dot(C1,blue+4pt);
dot(P,red+4pt);
dot(Q,red+4pt);
dot(M,red+4pt);
dot(n,red+4pt);
dot(AB,black+4pt);

perpendicularmark(line(B,B1),line(C,A),quarter=1);
perpendicularmark(line(C,C1),line(A,B),quarter=1);

