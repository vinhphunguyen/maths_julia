import graph;
import geometry;
import patterns;

usepackage("amsmath");
usepackage("mtpro2");
usepackage("empheq");

//texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));


pair O=(0,0);
pair A=(4,0);
pair B=(1,1.2);
pair C=A+B;
pair o=(1.9,.6);
pair ob=(2.9,2.5);
pair oa=(ob.x,o.y+0.5);
pair oc=o+(.3,-.4);

pen p = black+1pt;

fill(O--A--C--B--cycle,mediumgray);
draw(O--A--C--B--cycle,p);

fill(ob--oa--oc--cycle,orange+opacity(.5));

draw(o--ob,red+1pt,ArcArrow(3pt));
draw(o--oa,blue+1pt,ArcArrow(3pt));
draw(oa--ob,cyan+1pt,ArcArrow(3pt));
draw(o--oc,green+1pt,ArcArrow(3pt));
draw(oa--oc,black+1pt,ArcArrow(3pt));
draw(oc--ob,black+1pt,ArcArrow(3pt));

draw(o+(-0.3,0.3)..o+(0.,0.5)..0.4o+0.6oa);
draw((1.66,1.5){up}..(1.7,1.6)..0.7ob+0.3oc);

label("$W$",O+(.4,.2));
label("$\boldsymbol{v}$",.48(o+ob)+.2W,red);
label("$\boldsymbol{v}-\boldsymbol{w}$",(1.4,1.5));
label("$A$",oa+.2E,black);
label("$B$",ob+.2E,black);
label("$C$",oc+.25E,black);
label("$\boldsymbol{w}$",.5(o+oc)+.2W,green);
label("$\boldsymbol{v}-\text{proj}_W(\boldsymbol{v})$",.5(oa+ob)+.9E,black);
label("$\boldsymbol{w}-\text{proj}_W(\boldsymbol{v})$",.5(oa+oc)+.97E,black);
label("$\text{proj}_W(\boldsymbol{v})$",o+(-0.6,0.14),blue);

