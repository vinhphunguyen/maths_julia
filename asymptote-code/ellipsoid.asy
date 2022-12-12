import solids;
import graph3;


settings.outformat="pdf";
//settings.render = 0;

//settings.render=0;
//settings.prc=false;

size(12cm,0);
//settings.outformat="pdf"; // output is pdf
currentprojection = orthographic(20,30,10);

real a=2, b=1;
real x(real t) {return a*cos(t);}
real y(real t) {return b*sin(t);}
real z(real t) {return 0;}

path3 l= graph(x,y,z,0,2pi);
draw(l,red+1.5pt);

currentlight = light(diffuse = new pen[] {cyan, orange},
                     specular = new pen[] {black, white},
                     position = new triple[] {-Y+Z, X+Y});

revolution sur=revolution(O,l,X,0,360);
draw(surface(sur), meshpen=gray,  surfacepen=white+opacity(.6));


xaxis3("$x$",-a-0.5,a+0.5,black+1pt,Arrow3);
yaxis3("$y$",-b-0.5,b+0.5,black+1pt,Arrow3);
zaxis3("$z$",-1.5,1.5,Arrow3);


