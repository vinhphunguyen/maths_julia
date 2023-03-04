import graph;
import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
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
markangle("$\alpha$",B,Ds[0],A1,n=1,radius=4mm,Fill(yellow));
markangle("$\beta$",B2,Ds1[0],B,n=2,radius=4mm,Fill(orange));

pen p=black+1pt;
draw(A--B,p);
draw(A1--A2,p);
draw(B1--B2,p);

label("$a)$", A + .12E );

label("$l$",0.3A1+.7A2+.04N);
label("$m$",0.5(B1+B2)+.03S);
label("$n$",B+.03E);


picture pic1;

pair A1=(0.5,0.8);
pair A2=(1.,0.8);

pair B1=(0.5,0.6);
pair B2=(1.,0.6);


pair Ds  []=intersectionpoints(A--B,A1--A2);

markangle(pic1,"$\alpha$",A,Ds[0],A2,n=1,radius=3mm,Fill(yellow));
markangle(pic1,"$\beta$",A1,Ds[0],A,n=2,radius=4mm,Fill(orange));
markangle(pic1,"$\beta$",B2,Ds1[0],B,n=2,radius=4mm,Fill(orange));
markangle(pic1,"$\alpha$",B,Ds1[0],B1,n=1,radius=3mm,Fill(yellow));

pen p=black+1pt;
draw(pic1,A--B,p);
draw(pic1,A1--A2,p);
draw(pic1,B1--B2,p);

label(pic1,"$l$",0.3A1+.7A2+.04N);
label(pic1,"$m$",0.5(B1+B2)+.03S);
label(pic1,"$n$",B+.03E);

label(pic1,"$b)$", A + .12E );


add(shift(.7,0)*pic1);