import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm, keepAspect=true);
defaultpen(fontsize(12pt));


picture pic1, pic2;

string s1="$x=2$";
string s2="$x^2$";
string s3="$4$";
string s4="$\sqrt{y}$";

//add(pic1,shift(0,0)*grid(3,4,gray+0.6pt));

real f(real x) { return  x^2; }

real xmax1=1.1;

path s1 = graph(f, 0, xmax1, n=200);

pen p =red+1pt;
pen pd =dashed+1pt;
pen pp = black+.6pt;


fill(pic1,s1--(1,1)--(1,0)--cycle,cyan);
fill(pic1,s1--(1,1)--(0,1)--cycle,yellow);
draw(pic1,s1,p);

draw(pic1,Label("$x,u$",Relative(0.99)),(-.1,0)--(1.8,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$y,v$",Relative(0.99)),(0,-.1)--(0,1.7),black+1.2pt,Arrow(TeXHead));

path xtick = (0,0) -- (0,-0.15cm);
path ytick = (0,0) -- (-0.15cm,0);

Label ticklabelx1 = Label("$1$", position=EndPoint);
Label ticklabelx2 = Label("$2$", position=EndPoint);

Label ticklabely1 = Label("$1$", position=EndPoint);
Label ticklabely2 = Label("$4$", position=EndPoint);

draw((1,0), xtick, L=ticklabelx1, pp);
draw((0,1), ytick, L=ticklabely1, pp);

draw(pic1,(1,0)--(1,1),pp);
draw(pic1,(0,1)--(1,1),pp);

label("$0$",(.1,-.15));

string s1="$\displaystyle\int_0^1 x^2 dx$";
string s2="$\displaystyle\int_0^1\sqrt{v} d v$";

object box1=draw(s1,box,(1.35,0.5),xmargin=.2mm,Fill(cyan));
object box2=draw(s2,box,(.5,1.3),xmargin=.2mm,Fill(yellow));


add(pic1);



