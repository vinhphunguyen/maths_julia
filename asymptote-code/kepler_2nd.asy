import graph;
import gsl; // for newton() solver

usepackage("amsmath");
usepackage("mtpro2");

size(200);
defaultpen(fontsize(12pt));
settings.outformat="pdf"; // output is pdf


// class PlanetaryMotion
struct PlanetaryMotion{
  real a,b,e;
  real planetTime,sunR,planetR;
  pair F0,F1;

  guide orbit;

  transform tr=scale(-1,-1); // to put the Sun in the left focus

  // parametric equation for ellipse a,b
  pair ellipse(real t){
    return (a*cos(t),b*sin(t));
  }

  real Area(real t){ // area 0..t
    return a*b/2*(t-e*sin(t)); 
  }

  real calcArea(real t0,real t1){
    return Area(t1)-Area(t0);
  }

  real AreaPrime(real t){
    return 1/2*a*b*(1-e*cos(t));
  }

  // find time tend to fit areaToFit
  // using Newton-Raphson method 
  real findTime(real areaToFit, real tstart){ 
    real tend=newton(
       new real(real t){return calcArea(tstart,t)-areaToFit;},
       new real(real t){return AreaPrime(t);},tstart,tstart+2pi
      );
    return tend;
  }

  void drawBG(){
    draw(tr*orbit,darkblue);  // draw the elliptical orbit
    filldraw(tr*shift(F0)*scale(sunR)*unitcircle,yellow,orange); // draw the Sun
    filldraw(tr*shift(ellipse(planetTime))*scale(planetR)*unitcircle,blue,lightblue);

    //dot(tr*F1,UnFill);
    label("$F_0$",tr*F0,3N);
    //label("$F_1$",tr*F1,3N);
    label("Sun",tr*F0,3S);
    label("planet",tr*ellipse(planetTime),SW);

    draw(((0,0)--(a,0)));
    label("$a$",(a/2,0),N);
    dot((0,0),UnFill);

  }

  void drawSector(real t0, real t1,pen p=blue+opacity(0.3)){
    fill(tr*(F0--graph(ellipse,t0,t1)--cycle),p);
  }

  // constructor 
  void operator init(
       real a, 
       real b,
       real planetTime,
       real sunR=0.05a, 
       real planetR=0.3sunR
  ){
    this.a=a;
    this.b=b;
    this.planetTime=planetTime;
    this.sunR=sunR;
    this.planetR=planetR;
    this.e=sqrt(a^2-b^2)/a; // e=c/a
    this.F0=(a*e,0); // focus 1
    this.F1=(-a*e,0); // focus 2
    this.orbit=graph(ellipse,0,2pi);
  }  
}

PlanetaryMotion pm=PlanetaryMotion(1,0.618,1.2pi);

pm.drawBG();  

real t0,t1,t2,t3,t4,t5;

t0=-0.1pi;
t1= 0.1pi;

pm.drawSector(t0,t1);

real area0=pm.calcArea(t0,t1);

t2=0.7pi;
t3=pm.findTime(area0,t2);
pm.drawSector(t2,t3);

t4=1.5pi;
t5=pm.findTime(area0,t4);
pm.drawSector(t4,t5);