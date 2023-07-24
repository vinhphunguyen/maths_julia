import graph;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

defaultpen(fontsize(12pt));

size(8cm, 8cm, keepAspect=true);

int N = 10;
int n = 3;
int p = 2;

// low frequency function 2pi n t / N
real fl(real t){
    return sin (2pi*n*t/N);
}


// high frequency function 2pi n t / N
real fh(real t){
    return sin (2pi*(n+p*N)*t/N);
}


picture pic1, pic2;



path g1 = graph(fl, 0, 10,n=1500);
path g2 = graph(fh, 0, 10,n=1500);
draw(pic1,g1, red+.7pt);
draw(pic1,g2, blue+.7pt);

//limits((-2,-2),(2,2),Crop);
//xlimits(pic1,-2,2);
//ylimits(pic1,-2,2);

xaxis(pic1,"$t$",BottomTop,LeftTicks);
yaxis(pic1,"$f(t)$",LeftRight,RightTicks(trailingzero));

for (int k=0; k<=N; ++k) {
        pair p = (k,sin (2pi*n*k/N));
        draw(pic1,p,purple+2pt);
}

add(pic1);


// pic2


