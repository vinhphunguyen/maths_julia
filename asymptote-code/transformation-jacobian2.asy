import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");
usepackage("empheq");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(16pt));

size(22cm, 22cm, keepAspect=true);

picture pic1, pic2;

fill(pic1,(1,1)--(4,1)--(4,4)--(1,4)--cycle,orange);

draw(pic1,Label("$u$",Relative(0.99)),(-.5,0)--(4.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic1,Label("$v$",Relative(0.99)),(0,-.5)--(0,5),black+1.2pt,Arrow(TeXHead));

//label(pic1,"$x+2y=2$",(1.2,1));

Label L1=Label("$x+2y=2$",align=(-0.,.8),MidPoint);
Label L2=Label("$-x+2y=2$",align=(-0.3,0.8),MidPoint);
Label L3=Label("$-x-2y=2$",align=(-.3,-0.8),MidPoint);
Label L4=Label("$x-2y=2$",align=(-0,-.8),MidPoint);

label(pic1,"$R$",(2.5,2.5));
label(pic1,"$u=1$",(.5,2));
label(pic1,"$u=4$",(4.6,2));
label(pic1,"$v=1$",(2.4,.7));
label(pic1,"$v=4$",(2.4,4.4));


//label(pic1,"$v=x-2y$",(2.6,1.4),red);

draw(pic1,(1,0.5)--(1,4.5),black+2pt);
draw(pic1,(4,0.5)--(4,4.5),black+2pt);
draw(pic1,(0.5,1)--(4.5,1),black+2pt);
draw(pic1,(0.5,4)--(4.5,4),black+2pt);

draw(pic1,(4.5,2.5) .. (6,3.2) .. (6.6,2.5),red+2pt,ArcArrow);

// pic 2

real f1(real x){return x;}
real f2(real x){return x/4;}
real g1(real x){return 1/x;}
real g2(real x){return 4/x;}

real xmax = 4.3;
real xmin = .4;
real xmin1 = .8;

path f1=graph(f1,0,xmax,operator ..);
path f2=graph(f2,0,xmax,operator ..);
path g1=graph(g1,xmin,xmax,operator ..);
path g2=graph(g2,xmin,xmax,operator ..);

pair Ds []=intersectionpoints(f1,g1);
pair As []=intersectionpoints(f1,g2);
pair Bs []=intersectionpoints(f2,g2);
pair Cs []=intersectionpoints(f2,g1);

path c=
    graph(f1,Ds[0].x,As[0].x,
         operator ..)
    --
    graph(g2,As[0].x,Bs[0].x,
         operator ..)
    --
    graph(f2,Cs[0].x,Bs[0].x,
        operator ..)
    --
    graph(g1,Cs[0].x,Ds[0].x,
            operator ..)
    -- cycle;

 fill(pic2,c,lightyellow);


 draw(pic2,graph(f1,0,xmax),black+2pt);
 draw(pic2,graph(f2,0,xmax+0.7),black+2pt);
 draw(pic2,graph(g1,xmin,xmax),red+2pt);
 draw(pic2,graph(g2,xmin1,xmax),red+2pt);


// axes

draw(pic2,Label("$x$",Relative(0.99)),(-.5,0)--(xmax+.5,0),black+1.2pt,Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-.5)--(0,5),black+1.2pt,Arrow(TeXHead));

label(pic2,"$R'$",(2,1.2));
label(pic2,"$y=x$",(4.6,3.8));
label(pic2,"$y=x/4$",(4.6,1.6));
label(pic2,"$y=1/x$",(0.7,3.));
label(pic2,"$y=4/x$",(1.8,4.2));

add(shift(7.5,0)*pic2);

add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections
