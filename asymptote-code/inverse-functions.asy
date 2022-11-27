import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

unitsize(1cm);
defaultpen(fontsize(13pt));


picture pic1, pic2, pic3;

string s1="$x=2$";
string s2="$x^2$";
string s3="$4$";
string s4="$\sqrt{y}$";


object box1=draw(s1,box,(0,0),xmargin=2mm,FillDraw(yellow,blue));
object box2=draw(s2,box,(2,0),xmargin=2mm,FillDraw(yellow,blue));
object box3=draw(s3,box,(4,0),xmargin=2mm,FillDraw(yellow,blue));
object box4=draw(s4,box,(2,-2),xmargin=2mm,FillDraw(yellow,blue));

draw((1,0)--(1.5,0),ArcArrow);
draw((2.5,0)--(3.5,0),ArcArrow);


//shipout(bbox(5mm,invisible));







