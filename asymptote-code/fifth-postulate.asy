import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(5cm, keepAspect=true);
defaultpen(fontsize(12pt));

pair A=(0.5,0.5);
pair B=(0.7,.85);

pair A1=(0.5,0.9);
pair A2=(1.,0.6);

pair B1=(0.5,0.6);
pair B2=(1.,0.6);


pair Ds  []=intersectionpoints(A--B,A1--A2);
pair Ds1 []=intersectionpoints(A--B,B1--B2);

markangle("$\alpha$",A,Ds[0],B2,n=1,radius=4mm,Fill(yellow));
markangle("$\beta$",B2,Ds1[0],B,n=2,radius=4mm,Fill(orange));

pen p=black+1pt;
draw(A--B,p);
draw(A1--A2,p);
draw(B1--B2,p);

label("$l$",0.5(A1+A2)+.04N);
label("$m$",0.5(B1+B2)+.02S);
label("$n$",B+.02E);
