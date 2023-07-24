import graph;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(12pt));

size(7cm, 4cm, keepAspect=false);

// frequencies of f(t) and of C(k)
real f  = 2;
real f2 = 3;

real omega =  2*pi*f;
real omega2 = 2*pi*f2;

real f1 =0.5;
real k     = 2*pi*f1;

// function f(t)
real f(real t){
    return 1+ cos(omega*t) + cos(omega2*t);
}

// f(t)cos(kt),f(t)sin(kt)
pair F(real t) {
    real f1 = 3;
    real k = 2pi*f1;
    return ( f(t)*cos(k*t), 
             f(t)*sin(k*t) );
}

real fourier_transform_real(real f){
    int N = 300;
    real dt=5/N;
    real a=0;
    for (int i=0; i < N;++i)
    {
        real t = i*dt;
        a+= f(t)*cos(2pi*f*t);
    }
    return a/N;
}


picture pic1, pic2;

path g = graph(fourier_transform_real, 1, 10,n=1000);
draw(pic2,g, red+1.pt);


xaxis(pic2,"$f$",BottomTop,LeftTicks);
yaxis(pic2,"$\text{Re} C(f)$",LeftRight,RightTicks(trailingzero));

add(pic2);



