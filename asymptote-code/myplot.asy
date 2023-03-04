size(205,145,IgnoreAspect);
import graph;


usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf


real L=1;
real epsilon=0.25;

// define two sequences (a) and (b)

real a(int n) {
  real S = 0.;
  for(int i=1; i <= n; ++i)
    S += 1/2^i;
  return S;
}

for(int i=1; i < 15; ++i)
{
  dot((i,a(i)),red);
}

xaxis(Label("$n$",.5));
yaxis(Label("$S_n$",0.35));

xtick("$5$",5);
xtick("$10$",10);
xtick("$15$",15);
ytick("$0.5$",.5);
ytick("$0.6$",.6);
ytick("$0.7$",.7);
ytick("$0.8$",.8);
ytick("$0.9$",.9);

// draw a horizontal line at y=1
yequals(Label("$1$",0,up),1,extend=true,red);


real N1=12;

xequals(N1,extend=true,darkgreen+dashed);

label("$N$",(N1+1,-0.1));

