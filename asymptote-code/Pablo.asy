import graph;
import geometry;

usepackage("amsmath");
usepackage("mtpro2");


settings.outformat="pdf"; // output is pdf


size(14cm, keepAspect=true);
defaultpen(fontsize(14pt));

// draw a unit square

pen p = black+1pt;

draw(unitsquare,p);
draw(shift(0,1)*unitsquare,p);
draw(shift(0,2)*unitsquare,p);
draw(shift(0,3)*unitsquare,p);
draw(shift(0,4)*unitsquare,p);
draw(shift(0,5)*unitsquare,p);

draw(shift(2,0)*unitsquare,p);
draw(shift(2,1)*unitsquare,p);

draw(shift(4,0)*unitsquare,p);

//

draw(shift(7,0)*unitsquare,p);
draw(shift(7,1)*unitsquare,p);
draw(shift(7,2)*unitsquare,p);

draw(shift(9,0)*unitsquare,p);
draw(shift(9,1)*unitsquare,p);
draw(shift(9,2)*unitsquare,p);

draw(shift(11,0)*unitsquare,p);
draw(shift(11,1)*unitsquare,p);
draw(shift(11,2)*unitsquare,p);

