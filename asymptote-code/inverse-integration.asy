import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));


picture pic1, pic2;

string s1="$x=2$";
string s2="$x^2$";
string s3="$4$";
string s4="$\sqrt{y}$";

add(pic1,shift(0,0)*grid(3,4,gray+0.6pt));

real f(real x) { return  x^2; }

real xmax1=2.1;

path s1 = graph(f, 0, xmax1, n=200);

pen p =red+1pt;
pen pd =dashed+1pt;
draw(pic1,s1,p);
draw(pic1,s1,pd);

pair p1=(1,f(1));
pair p2=(2,f(2));

draw(pic1,Label("$x,u$",Relative(0.99)),(-.5,0)--(3.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y,v$",Relative(0.99)),(0,-.5)--(0,4.5),black+1.2pt,Arrow(TeXHead));

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelx1 = Label("$1$", position=EndPoint);
Label ticklabelx2 = Label("$2$", position=EndPoint);

Label ticklabely1 = Label("$1$", position=EndPoint);
Label ticklabely2 = Label("$4$", position=EndPoint);

pen pp = black+1.1pt;
draw((1,0), xtick, L=ticklabelx1, pp);
draw((2,0), xtick, L=ticklabelx2, pp);
draw((0,1), ytick, L=ticklabely1, pp);
draw((0,4), ytick, L=ticklabely2, pp);

string s1="$y=x^2$";
string s2="$u=\sqrt{v}$";

object box1=draw(s1,box,(1.87,1.5),xmargin=.2mm,Fill(yellow));
object box2=draw(s2,box,(1.1,3.2),xmargin=.2mm,Fill(yellow));

draw(pic1,(1,0)--p1,pp,ArcArrow(3pt));
draw(pic1,p1--(0,1),pp,ArcArrow(3pt));

draw(pic1,(0,4)--p2,pp,ArcArrow(3pt));
draw(pic1,p2--(2,0),pp,ArcArrow(3pt));

dot(pic1,p1,blue+4pt);
dot(pic1,p2,blue+4pt);

add(pic1);



