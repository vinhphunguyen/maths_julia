import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

pair O=(0,0); // location of the mass m1
pair A=(3,0); // location of the mass m2
pair B=(-1,3); // location of the mass m3
pair C=(B.x,0);

draw(O--A--B-- cycle, black+1pt);

draw(B--C, black+1pt);
draw(O--C, black+1pt);

label("$h$",(B.x+0.2,1.5));
label("$a$",(-.45,-0.25) );
label("$b$",(1.5,-0.25) );

label("$A$", O + .2S );
label("$B$", A + .2S );
label("$C$", B + .3E );
label("$H$", C + .2S );

shipout(bbox(1mm,invisible));

//perpendicular(H,NW,blue);



