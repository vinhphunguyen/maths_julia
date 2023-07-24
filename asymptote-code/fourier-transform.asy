import graph;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(12pt));

size(8cm, 3cm, keepAspect=false);

// frequencies of f(t) and of C(k)
real f  = 2;
real f2 = 3;

real omega =  2*pi*f;
real omega2 = 2*pi*f2;

real f1 =0.5;
real k     = 2*pi*f1;

// function f(t)
real f(real t){
    return 1+ .3cos(omega*t) + .4cos(omega2*t);
}

// f(t)cos(kt),f(t)sin(kt)
pair F(real t) {
    return ( f(t)*cos(k*t), 
             f(t)*sin(k*t) );
}

picture pic1, pic2;

path g = graph(f, 0, 5,n=300);
draw(pic1,g, red+1.pt);

//xlimits(-25,15);
ylimits(-1,1);

xaxis(pic1,"$t$",BottomTop,LeftTicks);
yaxis(pic1,"$g(t)$",LeftRight,RightTicks(trailingzero));

add(pic1);

// pic2 







