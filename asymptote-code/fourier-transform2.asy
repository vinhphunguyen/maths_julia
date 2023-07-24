import graph;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(12pt));

size(7cm, 7cm, keepAspect=true);

// frequencies of f(t) and of C(k)
real f1 = 3;
real f2 = 2;
real omega  = 2*pi*f1;
real omega2 = 2*pi*f2;

// function f(t)
//real f(real t){
  //  return 1+cos(omega*t);
//}

real f(real t){
    return 1+cos(omega*t);
}

// f(t)cos(kt),f(t)sin(kt)
pair F(real t) {
    real f1 = 7;
    real k = 2pi*f1;
    return ( f(t)*cos(k*t), 
             f(t)*sin(k*t) );
}

real fourier_transform_real(real f){
    real ff1(real t){
        return f(t)*cos(2pi*f*t);
    }
    real ff2(real t){
        return f(t)*sin(2pi*f*t);
    }
    real a = simpson(ff1, 0, 1, 1e-12);
    real b = simpson(ff2, 0, 1, 1e-12);

    //return sqrt(a^2+b^2);
    return a;
}


picture pic1, pic2;


draw(pic1,unitcircle);


path g = graph(F, 0, 5,n=1500);
draw(pic1,g, red+1.2pt);

//limits((-2,-2),(2,2),Crop);
xlimits(pic1,-2,2);
ylimits(pic1,-2,2);

xaxis(pic1,"$x$",BottomTop,LeftTicks);
yaxis(pic1,"$y$",LeftRight,RightTicks(trailingzero));

add(pic1);


// pic2


