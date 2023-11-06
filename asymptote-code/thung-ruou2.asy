import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(8cm); // size of the image
defaultpen(fontsize(12pt));

pair m1=(0,0); // location of the mass m1
pair m2=(2,0); // location of the mass m2
pair m3=(2,4); // location of the mass m3
pair m4=(0,4); // location of the mass m3
pair m5=(0.7,0); // location of the mass m3
pair m6=(2,1.8); // location of the mass m3
pair O=(0,0);


path s1  = m1 -- m2 -- m3 -- m4;
path s2  = m5 -- m3;
path s3  = m5 -- m2 -- m3--cycle;
path s1r = rotate(-20,m1)*s1; //m1 -- m2 -- m6 -- m5;
path s2r = rotate(-20,m1)*s2; //m1 -- m2 -- m6 -- m5;
path s3r = rotate(-20,m1)*s3; //m1 -- m2 -- m6 -- m5;


fill(s3r -- cycle, lightgreen);

draw(s1r--cycle,1.1+black);
draw(s2r--cycle,1.1+black);

label("$x'$",(1.3,-0.3));




shipout(bbox(2mm,invisible));

