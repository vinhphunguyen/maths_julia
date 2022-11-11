import graph;
usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(6cm); // size of the image

pair m1=(0.5,0.5); // location of the mass m1
pair m2=(1.2,2.7); // location of the mass m2
pair m3=(3,2); // location of the mass m3

dot("$m_1$",align=SE,m1,black+5pt);
dot("$m_2$",align=1.1E,m2,black+6pt);
dot("$m_3$",align=SE,m3,black+7pt);

draw(m1--m2);
draw(m2--m3);
draw(m1--m3);

pair F12(real t) {return (1-t)*m1+t*m2;}
pair F13(real t) {return (1-t)*m1+t*m3;}

pair O=(0,0);

draw(Label("$\bm{F}_{12}$",align=1.2W,EndPoint),m1--F12(0.3),red,Arrow);
draw(Label("$\bm{F}_{21}$",align=1.1E,EndPoint),m2--F12(0.7),red,Arrow);

draw(Label("$\bm{F}_{13}$",align=1.2SE,EndPoint),m1--F13(0.3),blue,Arrow);
draw(Label("$\bm{F}_{31}$",align=1.2SE,EndPoint),m3--F13(0.7),blue,Arrow);

//draw(Label("$\boldsymbol{r}_{1}$",align=1.2SE,EndPoint),O--m1,Arrow);

label("$\bm{F}_{12}=\displaystyle\frac{Gm_1m_2}{||\boldsymbol{r}_{12}||^3} \boldsymbol{r}_{12}$",(1.3,0.694),1.01*SE);

xaxis("$x$",Arrow(TeXHead));
yaxis("$y$",Arrow(TeXHead));
