
float factor = 0; // 2 is two times table
float r;

void setup() {
  size(640, 640);
  r = width/2 - 16;
  //noStroke();
  //fill(50);
}

// get the coords of a point on the cirlce
// gien the index
PVector getVector(float index, float total){
  float angle =  map(index % total,0,total,0,TWO_PI);
  PVector v = PVector.fromAngle(angle+PI);
  v.mult(r);
  return v;
}

void draw() 
{
 background(255);
 
 factor += 0.01;
 
 int total  = int(map(mouseX,0,width,0,200)); // total number of points on the circle
 
 translate(width/2,height/2);
 stroke(0);
 noFill();
 circle(0,0,r*2);
 
 for(int i = 0; i < total; i++){
   PVector v = getVector(i,total);
   fill(255);
   circle(v.x,v.y,16);
 }
 
 for(int i = 0; i < total; i++){
   PVector a = getVector(i,total);
   PVector b = getVector(i*factor,total);
   line(a.x,a.y,b.x,b.y);
 }
}
