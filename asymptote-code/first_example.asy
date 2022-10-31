settings.outformat="pdf";
unitsize(1cm);

real xmin = -0.1;
real xmax =  2.0;
real ymin = -0.1;
real ymax =  2.0;

//  the function y=sqrt(x)
path s = (0,0){up} .. (1,1) .. (xmax,sqrt(xmax));
// fill in the space below y=sqrt(x) and the vertical line x=xmax
fill(s -- (xmax,0) -- cycle, mediumgray);

draw(s); // draw the function

// draw the axes
draw((xmin,0)--(xmax,0), arrow=Arrow(TeXHead));
draw((0,ymin)--(0,ymax), arrow=Arrow(TeXHead));

//label("Hellow world!");
