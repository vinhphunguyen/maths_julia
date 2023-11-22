import geometry;
import markers;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);
defaultpen(fontsize(12pt));

real cnk(int n, int k) {
    if (k < 0 || k > n) return 0;

    real result = 1.0;
    for (int i = 1; i <= k; ++i) {
        result *= (n - i + 1) / i;
    }

    return result;
}

struct Box {
    real x1, y1, x2, y2;
    int  num;
    
    void operator init(real x1, real y1, real x2, real y2, int n) {
        this.x1 = x1;
        this.y1 = y1;
        this.x2 = x2;
        this.y2 = y2;
        this.num = n;
    }
    
    void display() {
        //write("(" + string(num) + ", " + string(y1) + ")");
        draw((x1,y1)--(x2,y1)--(x2,y2)--(x1,y2)--cycle);
        label("$" + string(num) + "$",0.25((x1,y1)+(x2,y1)+(x2,y2)+(x1,y2)));
    }
    void fill() {
        if (num % 2 == 1){
            filldraw((x1,y1)--(x2,y1)--(x2,y2)--(x1,y2)--cycle, gray);
        }
    }
}

real h = 2; // size of a box

Box[] boxes;

void make_sierpinskin_pascal_triangle(int M)
{
    // loop over the rows of the Pascal triangle
    for (int i = M; i >= 1; --i)
    {
        real box_width      = i * h;
        real half_box_width = 0.5*box_width;

        // loop over the boxes of each row
        for (int j = 0; j <= i-1; ++j)
        {
            int n =  choose(i-1,j);
            real x1 = -half_box_width + j*h;
            real y1 = (M-i)*h;
            real x2 = x1 + h;
            real y2 = y1 + h;
            Box boxj = Box(x1, y1, x2, y2, n);
            boxes.push(boxj);
        }
    }
}

void draw_sierpinskin_pascal_triangle(int M)
{
    make_sierpinskin_pascal_triangle(M);

    for (int b=0; b < boxes.length ;++b)
    {
        boxes[b].display();
    }
}

void draw_fill_sierpinskin_pascal_triangle(int M)
{
    make_sierpinskin_pascal_triangle(M);

    for (int b=0; b < boxes.length ;++b)
    {
        boxes[b].fill();
    }
}

int M = 62;

//draw_sierpinskin_pascal_triangle(M);
draw_fill_sierpinskin_pascal_triangle(M);

write(cnk(15,14));

