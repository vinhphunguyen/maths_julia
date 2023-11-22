
import graph;

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p = black + 1pt;

// define a type 'Circle'

struct Circle{
    real xc, yc, rad;

    void operator init(real x, real y, real rad) {
        this.xc  = x;
        this.yc  = y;
        this.rad = rad;
    }

    void display(){
        draw(circle((xc,yc), rad),p);
    }
}

// define a type 'Polygon'

struct Polygon{
    pair[] vertices;

    void operator init(pair[] vertices) {
        this.vertices = vertices;
    }

    void display(){
        for (int v=0; v < vertices.length-1 ;++v)
        {
            draw(vertices[v]--vertices[v+1], p);
        }
    }

    bool isInside(pair pnt) 
    {
        int numIntersections = 0;

        for (int i = 0; i < vertices.length; ++i) 
        {
            int nextIndex = (i + 1) % vertices.length;

            // Check if the ray from testPoint intersects with the edge
            if ((vertices[i].y < pnt.y && vertices[nextIndex].y >= pnt.y
                 || vertices[nextIndex].y < pnt.y && vertices[i].y >= pnt.y)
                 && (vertices[i].x <= pnt.x || vertices[nextIndex].x <= pnt.x)) {
                if (vertices[i].x + (pnt.y - vertices[i].y) / (vertices[nextIndex].y - vertices[i].y) * (vertices[nextIndex].x - vertices[i].x) < pnt.x) {
                    numIntersections += 1;
                }
            }
        }

        return numIntersections % 2 == 1;
    }
}

// define a type 'Box'

struct Box {
    real x1, y1, x2, y2;
    real xc, yc;
    
    void operator init(real x1, real y1, real x2, real y2) {
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;

        this.xc = 0.5(x1+x2);
        this.yc = 0.5(y1+y2);
    }
    
    void display(pen pp=p) {
        draw((x1,y1)--(x2,y1)--(x2,y2)--(x1,y2)--cycle, pp);
    }

    void fill() {
        filldraw((x1,y1)--(x2,y1)--(x2,y2)--(x1,y2)--cycle, gray);
    }

    bool cutting_a_circle(Circle c){
        pair cen=(c.xc,c.yc);
        real r  = c.rad;
        real d1 = length((x1,y1)-cen) - r;
        real d2 = length((x2,y1)-cen) - r;
        real d3 = length((x2,y2)-cen) - r;
        real d4 = length((x1,y2)-cen) - r;

        real dmin = min(d1,d2,d3,d4);
        real dmax = max(d1,d2,d3,d4);

        return dmin * dmax < 0;
    }

    bool inside_a_circle(Circle c){
        real d = length((xc,yc)-(c.xc,c.yc));
        return d < c.rad;
    }

    bool inside_a_polygon(Polygon p){
        return p.isInside((xc,yc));;
    }

    bool cutting_a_polygon(Polygon p){
        int cc = 0;

        if ( p.isInside((x1,y1)) ) {
            ++cc;
        }
        if ( p.isInside((x2,y1)) ) {
            ++cc;
        }

        if ( p.isInside((x2,y2)) ) {
            ++cc;
        }
        
        if ( p.isInside((x1,y2)) ) {
            ++cc;
        }

        return ( cc < 4 ) && ( cc > 0);

    }
}

// define a type 'Grid'

struct Grid {
    real l;  // size of the grid
    int  n;  // number of cells in one direction, n x n cells
    real h;
    Box[] boxes;

    void operator init(real l, int n) {
        this.l = l;
        this.n = n;
        this.h = l/n;

        for (int i = 0; i < n; ++i)
        {
            real y1 = i*h;
            real y2 = y1 + h;
            for (int j = 0; j < n; ++j)
            {
                real x1 = j*h;
                real x2 = x1 + h;
                Box boxj = Box(x1, y1, x2, y2);
                boxes.push(boxj);
            }
        }
    }
    
    // draw the grid

    void display()
    {
        for (int b=0; b < boxes.length ;++b)
        {
            boxes[b].display();
        }
    }

    // fill the cells cut by the circle

    int fill(Circle c)
    {
        int cnt = 0;
        for (int b=0; b < boxes.length ;++b)
        {
            Box b = boxes[b];
            //if ( b.cutting_a_circle(c) || b.inside_a_circle(c) ) 
            if ( b.cutting_a_circle(c) ) 
            {
                b.fill();
                ++cnt;
            }
        }
        return cnt;
    }

    int fill(Polygon p)
    {
        int cnt = 0;
        for (int b=0; b < boxes.length ;++b)
        {
            Box b = boxes[b];
            if ( b.cutting_a_polygon(p) || b.inside_a_polygon(p) ) 
            {
                b.fill();
                ++cnt;
            }
           
        }
        return cnt;
    }

    int fill_mark(Polygon p)
    {
        int cnt = 0;
        for (int b=0; b < boxes.length ;++b)
        {
            Box b = boxes[b];

            if ( b.inside_a_polygon(p) ) 
            {
                b.fill();
                ++cnt;
            }

            if ( b.cutting_a_polygon(p)  ) 
            {
                b.display(red+1pt);
                ++cnt;
            }
        }
        return cnt;
    }

}

// some functions ------------------------------------------

void plot_grid_circle(int n)
{
    Grid g = Grid(2,n); // build the grid
    g.display();        // plot it

    real rad = g.l/2;
    Circle c = Circle(1,1,rad); // build the circle
    c.display();                // plot it

    int filled_boxes = g.fill(c);
    write(filled_boxes);
}

void plot_grid_polygon(int n,  pair[] vertices )
{
    Grid g = Grid(2,n); // build the grid
    g.display();        // plot it

    Polygon pol = Polygon(vertices);

    //int filled_boxes = g.fill(pol);
    int filled_boxes = g.fill_mark(pol);
    write(filled_boxes);

    pol.display();

}

// box count for Sierpinski triangle

void sierpinski_triangle(pair A, pair B, pair C, int level, pen p)
{
    if ( level == 1 ){
        draw(A--B--C--cycle,p);
    }
    else{
        pair M1 = 0.5(A+B);
        pair M2 = 0.5(A+C);
        pair M3 = 0.5(C+B);

        sierpinski_triangle(A, M1, M2, level-1, p);
        sierpinski_triangle(B, M1, M3, level-1, p);
        sierpinski_triangle(C, M3, M2, level-1, p);
    }
}


void plot_grid_sierpinski(int n)
{
    Grid g = Grid(1,n);
    g.display();
    int level = 8;
    pair B = (0,0);
    pair A = (0.5,1);
    pair C = (1,0);
    sierpinski_triangle(A,B,C,level,p);
}


///////////////////////////////////////////////////////////////
// now, the code

//plot_grid_circle(32);

//plot_grid_sierpinski(16);



// Parameters of the ellipse
real h = 1;
real k = 1;
real a = 0.7;
real b = .5;

pair ellipseParametric(real t) {
    return (h + a * cos(t), k + b * sin(t));
}

pair cardioid(real t) {
    return (1.2,1) + 0.38*(2 * cos(t)-cos(2*t), 2* sin(t)-sin(2*t));
}


pair[] vertices;

int N = 48;
real dt=6.283185307179586/N;
for(int i = 0; i <= N; ++i){
    real t = 0 + i*dt;
    pair p = cardioid(t);
    vertices.push(p);
}

plot_grid_polygon(32,  vertices );
