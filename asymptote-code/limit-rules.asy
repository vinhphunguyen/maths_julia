size(205,195,IgnoreAspect);
import graph;


usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf


real L=1;
real epsilon=0.25;

// define two sequences (a) and (b)

real a(int n) {return 1+1/n;}
real b(int n) {return 2+1/(n*n);}
real s(int n) {return a(n)+b(n);}

for(int i=2; i < 23; ++i)
{
  dot((i,a(i)),red);
  dot((i,b(i)),blue);
  dot((i,s(i)),purple);
}

xaxis(Label("$n$",align=2S));
yaxis(Label("$s_n$",0.95));

//xtick("$2$",2);
//ytick("$2$",2);

// draw a horizontal line at y=1
yequals(Label("$a$",0,up),1,extend=true,red);
yequals(Label("$b$",0,up),2,extend=true,blue);
yequals(Label("$a+b$",0,up),3,extend=true,purple);

real N1=15;
real N2=6;

xequals(N1,extend=true,darkgreen+dashed);
xequals(N2,extend=true,darkgreen+dashed);

label("$N_1$",(N1+1,-0.25));
label("$N_2$",(N2+1,-0.25));

label("$|a_n-a| < \epsilon/2$",(N1+5,1-0.5));
label("$|b_n-b| < \epsilon/2$",(N1+5,2-.5));
