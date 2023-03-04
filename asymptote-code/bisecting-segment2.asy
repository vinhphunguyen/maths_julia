import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(10pt));

pair A=(0,0);
pair B=(2,0);
pair M=midpoint(A--B);

pair x=(M.x,1.2);
pair xp=(M.x,1.5);

pen p =black+.8pt;
pen pr =red+.8pt;

//fill(A--x--M--cycle,yellow);
//fill(B--x--M--cycle,orange);

draw( arc(A,length(A-B), -90, 90 ), pr);
draw( arc(B,length(A-B), 90, 270 ), pr);

pair Ds []=intersectionpoints(circle(A,length(A-B)),circle(B,length(A-B)));
pair P = Ds[0];
pair Q = Ds[1];

perpendicularmark(line(M,B),line(M,x),quarter=1);
perpendicularmark(line(M,B),line(M,x),quarter=2);

markangle("$\alpha$",A,P,M,n=1,radius=6mm,Fill(orange));
markangle("$\alpha$",M,P,B,n=1,radius=6mm,Fill(orange));


draw(A--B,p);
draw(P--Q,p);
draw(B--Q,p);
draw(A--Q,p);

draw(A--B,StickIntervalMarker(2,2,angle=-25 ) );
draw(A--P,StickIntervalMarker(1,1,angle=-25 ) );
draw(B--P,StickIntervalMarker(1,1,angle=25 ) );

label("$A$",A+.15W);
label("$B$",B+.15E);
label("$M$",M+(.15,-0.15));
label("$X_1$",P+.19N);
label("$X_2$",Q+.19S);

dot(A,blue+4pt);
dot(B,blue+4pt);
dot(P,purple+4pt);
dot(Q,purple+4pt);
dot(M,red+4pt);

