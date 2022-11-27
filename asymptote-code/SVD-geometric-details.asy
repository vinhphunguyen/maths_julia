import graph;
import geometry;

usepackage("amsmath,amsthm,amssymb, mathtools,mathrsfs,stmaryrd");
usepackage("bm");

texpreamble("\include{commands}");

settings.outformat="pdf"; // output is pdf

size(18cm, keepAspect=true);


picture pic1, pic2, pic3, pic4;

draw(pic1,Label("$x$",Relative(0.99)),(-1.25,0)--(1.25,0),Arrow(TeXHead));
draw(pic1,Label("$y$",Relative(0.99)),(0,-1.25)--(0,1.65),Arrow(TeXHead));

draw(pic1,unitcircle,black+1.1pt);

real theta=30, beta=-60;
pair A=dir(theta);
pair B=dir(beta);

draw(pic1,(0,0)--A,red+1.2pt,ArcArrow);
draw(pic1,(0,0)--B,red+1.2pt,ArcArrow);

label(pic1,"$\bm{v}_2$",A+(0.15,0.15),red);
label(pic1,"$\bm{v}_1$",B+(0.15,-0.15),red);

label(pic1,"$\mathbb{R}^2:\;\norm{\bm{x}}=1$",(-0.1,2.2),blue);
label(pic1,"$\norm{\bm{V}\trans\bm{x}}=\norm{\bm{x}}$",(1.6,1.6),blue);
label(pic1,"$\bm{V}\trans$",(2.,2.6),blue);

//perpendicular((A.x,B.y),NW,A--(A.x,B.y),blue);

draw(pic1,(1.,1.9) .. (2,2.3) .. (2.5,1.8),black+1.2pt,ArcArrow);

label(pic1,"$\bm{y}=\left(\bm{V}\trans \bm{\Sigma} \bm{U}\right)\bm{x}$",(6.,-2.9),blue);

// big arc arrow bottom y=Ax
draw(pic1,(.1,-1.3) .. (6,-3.5) .. (11.,-1.6),black+1.2pt,ArcArrow);


add(pic1);

//draw(pb--(pb.x,0),dashed+black); // draw the dotted line showing the projections

// pic2
draw(pic2,Label("$x$",Relative(0.99)),(-1.25,0)--(1.35,0),Arrow(TeXHead));
draw(pic2,Label("$y$",Relative(0.99)),(0,-1.25)--(0,1.65),Arrow(TeXHead));

draw(pic2,unitcircle,black+1.1pt);


draw(pic2,(0,0)--(1,0),red+1.2pt,ArcArrow);
draw(pic2,(0,0)--(0,1),red+1.2pt,ArcArrow);


//perpendicular((A.x,B.y),NW,A--(A.x,B.y),blue);

string s="\begin{minipage}{3cm}
\begin{align*}
\bm{\Sigma} &= \begin{bmatrix}
\sigma_1 & 0 \\
0 & \sigma_2
\end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic2,s,(1.6,3.0), blue);

draw(pic2,(1.,1.9) .. (2,2.3) .. (2.5,1.8),black+1.2pt,ArcArrow);

string s="\begin{minipage}{3cm}
\begin{align*}
\bm{V}\trans\bm{v}_1&= \begin{bmatrix}
1 \\ 0
\end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic2,s,(1.3,-1), red);

string s="\begin{minipage}{3cm}
\begin{align*}
\bm{V}\trans\bm{v}_2&= \begin{bmatrix}
0 \\ 1
\end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic2,s,(1.3,1.4), red);

add(shift(3.5,0)*pic2);


// pic3
draw(pic3,Label("$x$",Relative(0.99)),(-1.65,0)--(1.8,0),Arrow(TeXHead));
draw(pic3,Label("$y$",Relative(0.99)),(0,-1.25)--(0,1.65),Arrow(TeXHead));

draw(pic3,ellipse((0,0),1.5,1),black+1.1pt);


draw(pic3,(0,0)--(1.5,0),red+1.2pt,ArcArrow);
draw(pic3,(0,0)--(0,1),red+1.2pt,ArcArrow);

string s="\begin{minipage}{3cm}
\begin{align*}
\Sigma \bm{V}\trans\bm{v}_1&= \begin{bmatrix}
\sigma_1 \\ 0
\end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic3,s,(1.3,-1.4), red);

string s="\begin{minipage}{3cm}
\begin{align*}
\Sigma \bm{V}\trans\bm{v}_2&= \begin{bmatrix}
0 \\ \sigma_2
\end{bmatrix}
\end{align*}
\end{minipage}
";

label(pic3,s,(1.3,1.4), red);

label(pic3,"$\bm{U}$",(1.6,2.6), blue);
draw(pic3,(1.,1.9) .. (2,2.3) .. (2.5,1.8),black+1.2pt,ArcArrow);

add(shift(7,0)*pic3);


//pic4
draw(pic4,Label("$x$",Relative(0.99)),(-1.35,0)--(1.6,0),Arrow(TeXHead));
draw(pic4,Label("$y$",Relative(0.99)),(0,-1.45)--(0,1.65),Arrow(TeXHead));

draw(pic4,rotate(-45)*ellipse((0,0),1.5,1),black+1.1pt);

path p1 = (0,0)--(1.5,0);
path p2 = (0,0)--(0,1);
draw(pic4,rotate(-45)*p1,red+1.2pt,ArcArrow);
draw(pic4,rotate(-45)*p2,red+1.2pt,ArcArrow);

label(pic4,"$\sigma_1\bm{u}_1$",(1.6,-1.4), red);
label(pic4,"$\sigma_2\bm{u}_2$",(1.,1.), red);

add(shift(11,0)*pic4);
