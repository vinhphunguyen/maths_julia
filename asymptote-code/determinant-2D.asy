import graph;
import geometry;
import patterns;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(14pt));

size(7.9cm, keepAspect=true);



Label Lu=Label("$\bm{u}$",align=(0,0),MidPoint,Fill(white));
Label Lv=Label("$\bm{v}$",align=(0,0),MidPoint,Fill(white));
Label Lw=Label("$\bm{w}$",align=(0,0),MidPoint,Fill(white));
Label Lz=Label("$\bm{z}$",align=(0,0),MidPoint,Fill(white));

real a = 4; real c = 2;
real b = 1; real d = 4;

pair O=(0,0);
pair u=(a,c);
pair v=(b,d);
pair z=v+u;

fill(O--u--z--v--cycle,mediumgray);

fill((u.x,0)--(z.x,0)--(z.x,u.y)--u--cycle,orange);
fill((0,v.y)--v--(v.x,z.y)--(0,z.y)--cycle,orange);
fill((0,0)--(u.x,0)--u--cycle,green);
fill(z--(v.x,z.y)--v--cycle,green);
fill(u--(z.x,u.y)--z--cycle,cyan);
fill(O--v--(0,v.y)--cycle,cyan);

draw(O--u,blue+1.3pt,Arrow);
draw(O--v,blue+1.3pt,Arrow);
draw(u--z--v,blue+1.1pt);

draw(u--(u.x,0),black+.8pt);
draw(v--(0,v.y),black+.8pt);
draw(z--(0,z.y),black+.8pt);
draw(z--(z.x,0),black+.8pt);
draw(u--(z.x,u.y),black+.8pt);
draw(v--(v.x,z.y),black+.8pt);

Label La=Label("$a$",align=O,MidPoint,Fill(white));
Label Ld=Label("$d$",align=O,MidPoint,Fill(white));
Label Lb=Label("$b$",align=O,MidPoint,Fill(white));
Label Lc=Label("$c$",align=O,MidPoint,Fill(white));

draw(La,(0,-0.33)--(u.x,-0.33),Arrows(TeXHead),Bars);
draw(Lb,(u.x,-0.33)--(z.x,-0.33),Arrows(TeXHead),Bars);
draw(Ld,(-0.3,0)--(-0.3,v.y),Arrows(TeXHead),Bars);
draw(Lc,(-0.3,v.y)--(-0.3,z.y),Arrows(TeXHead),Bars);
draw(La,(v.x,z.y+.33)--(z.x,z.y+.33),Arrows(TeXHead),Bars);
draw(Lb,(0,z.y+.33)--(v.x,z.y+.33),Arrows(TeXHead),Bars);
draw(Lc,(z.x+.5,0)--(z.x+.5,u.y),Arrows(TeXHead),Bars);
draw(Ld,(z.x+.5,u.y)--(z.x+.5,z.y),Arrows(TeXHead),Bars);


//axes


draw(Label("$x$",Relative(0.99)),(0,0)--(7,0),black+1.5pt,Arrow(TeXHead));
draw(Label("$y$",Relative(0.99)),(0,0)--(0,7),black+1.5pt,Arrow(TeXHead));
