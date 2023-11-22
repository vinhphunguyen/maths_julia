
import geometry;

settings.outformat="pdf"; // output is pdf

size(8cm, keepAspect=true);
defaultpen(fontsize(12pt));

srand(100);



struct Segment{
    int i;
    int j;

    void operator init(int i, int j) {
        this.i    = i;
        this.j    = j;
    }

    void display(){
        write("Segment: (" + string(i) + "," +  string(j) + ")\n");
    }
}

struct Segments{
    pair[]    points; // original points on the circle
    pair[]    inter_pnts; // intersection points
    Segment[] segments;
    pen       pnt_pen;
    pen       ipnt_pen;

    void operator init(int n, pen pp, pen ipp) {
        this.pnt_pen  = pp;
        this.ipnt_pen = ipp;
        real x,y;
        real goldenAngle = 2.39996; // golden angle helps creating uniform points
        for(int i = 0; i < n; ++i){
            real angle = i*goldenAngle;
            pair pnt = dir(degrees(angle));
            this.points.push(pnt);
        }
        int pos = 0;
        for(int i = 0; i < n-1; ++i){
            for(int j = i+1; j < n; ++j){
                Segment s = Segment(i,j);
                this.segments.push(s);
                ++pos;
            }
        }
        int i = 0;
        for(int si = 0; si < segments.length; ++si){
            Segment segi = segments[si];
            for(int sj = si + 1; sj < segments.length; ++sj){
                Segment segj  = segments[sj];
                if (segj.i == segi.i || segj.i == segi.j || segj.j == segi.j ){
                    continue;
                }

                pair[] iPoint = intersectionpoints(
                        points[segi.i]--points[segi.j], 
                        points[segj.i]--points[segj.j]);
                if (iPoint.length > 0) {
                    this.inter_pnts.push(iPoint[0]);
                }
                ++i;
            }
        } 
    }

    void display(pen p){
        for(int s = 0; s < segments.length; ++s){
            int i = segments[s].i;
            int j = segments[s].j;
            draw(points[i]--points[j],p);
        }
        dot(points,pnt_pen);
        write(segments.length);
        dot(inter_pnts,ipnt_pen);
    }

    void info(){
        write("n is            :" + string(points.length) +  "\n");
        write("# of Vertices.  :" + string(points.length + inter_pnts.length) +  "\n");
        write("# of Segment    :" + string(segments.length) +  "\n");
        write("# of intersects :" + string(inter_pnts.length) +  "\n");
    }
}

int n = 6;

pen p  = black + 1pt;
pen p1 = black + 4pt;
pen p2 = red   + 4pt;


Segments segs = Segments(n, p1, p2);

draw(unitcircle,p);
segs.display(p);
segs.info();


