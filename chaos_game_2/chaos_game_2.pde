PVector a,b,c,d,e, target;
PVector[] points;

float percent=0.5;//1/1.618033988;//0.5;

int prev;

void setup() {
  size(800, 800);
  //noStroke();
  fill(50);
  
  float rad = 390;
  //translate(width/2,height/2);
  
  points = new PVector[5];
  points[0] = new PVector(rad*cos(TWO_PI/5),  rad*sin(TWO_PI/5));
  points[1]= new PVector(rad*cos(2*TWO_PI/5),rad*sin(2*TWO_PI/5));
  points[2]= new PVector(rad*cos(3*TWO_PI/5),rad*sin(3*TWO_PI/5));
  points[3]= new PVector(rad*cos(4*TWO_PI/5),rad*sin(4*TWO_PI/5));
  points[4]= new PVector(rad*cos(5*TWO_PI/5),rad*sin(5*TWO_PI/5));
  
  for (int i = 0; i < 5;i++)
  {
    points[i].add(width/2,height/2);
  }
  
  target = new PVector( random(-rad,rad), random(-rad,rad));
  target.add(width/2,height/2);
  
  //stroke(0, 250, 0);
  strokeWeight(6);
  
  for (int i = 0; i < 5;i++)
  {
    point(points[i].x,points[i].y);
  }
  
  for (int i = 0; i < 4;i++)
  {
    line(points[i].x,points[i].y, points[i+1].x, points[i+1].y);
 
  }
      line(points[4].x,points[4].y, points[0].x, points[0].y);
  
  point(target.x, target.y);

}

void draw() 
{
  strokeWeight(2);
  for (int i = 0; i <10; i++)
  {
    point(target.x, target.y);

    int r = floor(random(5));
    
    while ( r == prev) {
      r = floor(random(5));
    }
    if (r == 0) {
      stroke(255, 0, 0);
      target.x = lerp(target.x, points[0].x, percent);
      target.y = lerp(target.y, points[0].y, percent);
    } else if (r == 1) {
      stroke(0, 255, 0);
      target.x = lerp(target.x, points[1].x, percent);
      target.y = lerp(target.y, points[1].y, percent);
    } else if (r == 2) {
      stroke(0, 0,255);
      target.x = lerp(target.x, points[2].x, percent);
      target.y = lerp(target.y, points[2].y, percent);
    } else if (r == 3) {
      stroke(100, 0,255);
      target.x = lerp(target.x, points[3].x, percent);
      target.y = lerp(target.y, points[3].y, percent);
    } else if (r == 4) {
      stroke(0, 100,255);
      target.x = lerp(target.x, points[4].x, percent);
      target.y = lerp(target.y, points[4].y, percent);
    }
    
    prev = r;
  }

}
