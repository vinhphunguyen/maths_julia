import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(8cm, 8cm, keepAspect=true);

int rows=5;
int cols=3;

real dx=1, dy=1;

pair O=(0,0);

for(int i=0; i<rows; ++i)
  for(int j=0; j<cols; ++j)
    dot(O+(j*dx,i*dy),black+5pt); // plot a dot at (0,0)

rows=3; cols=5;
pair On=(3,0);
for(int i=0; i<rows; ++i)
  for(int j=0; j<cols; ++j)
      dot(On+(j*dx,i*dy),red+5pt); // plot a dot at (0,0)

//label("$a$",(a,-0.1));  // draw the;abel v0y
