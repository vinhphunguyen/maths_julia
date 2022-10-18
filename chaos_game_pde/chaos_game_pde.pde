PVector a,b,c, target;

void setup() {
  size(400, 400);
  //noStroke();
  fill(50);
  
  a      = new PVector(width / 2, 0);
  b      = new PVector(0, height);
  c      = new PVector(width, height);
  
  target = new PVector(random(width), random(height));
  
  //stroke(0, 250, 0);
  strokeWeight(4);
  point(a.x, a.y);
  point(b.x, b.y);
  point(c.x, c.y);
  //point(target.x, target.y);

}

void draw() 
{
  for (int i = 0; i < 10; i++)
  {
    point(target.x, target.y);

    int r = floor(random(3));
    if (r == 0) {
      stroke(255, 0, 0);
      target.x = lerp(target.x, a.x, 0.5);
      target.y = lerp(target.y, a.y, 0.5);
    } else if (r == 1) {
      stroke(0, 255, 0);
      target.x = lerp(target.x, b.x, 0.5);
      target.y = lerp(target.y, b.y, 0.5);
    } else if (r == 2) {
      stroke(0, 0,255);
      target.x = lerp(target.x, c.x, 0.5);
      target.y = lerp(target.y, c.y, 0.5);
    }
  }
}
