import geometry;

settings.outformat="pdf"; // output is pdf

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));

pen p = black + 1pt;


//currentcoordsys=cartesiansystem((0.5,0.5), i=(0.7,0.7), j=(-0.7,0.7));
//point Ap=a;
//point Bp=point(currentcoordsys,B); // same as 'point Bp=b;'
//point App=changecoordsys(R,Ap);

// struct 'Segment' representing a segment in Koch snowflake

struct Segment{
	pair p1, p2;
	real l3;

	void operator init(pair A, pair B) {
		this.p1 = A;
		this.p2 = B;
		this.l3 = (1/3)*length(A-B);
	}

	void display(pen pp=p, picture pic){
		draw(pic,p1--p2,pp);
	}
}

void koch_snowflake(Segment s, int level, pen p=p, picture pic)
{
	if ( level == 1 ){
		s.display(p, pic);
	}
	else{
		pair p13 = interp(s.p1,s.p2,1/3);
		pair p31 = interp(s.p1,s.p2,2/3);

        pair B   = rotate(-60,p13)*p31;

		koch_snowflake(Segment(s.p1,p13),  level-1, p, pic);
		koch_snowflake(Segment(p13, B),    level-1, p, pic);
		koch_snowflake(Segment(B, p31),    level-1, p, pic);
		koch_snowflake(Segment(p31, s.p2), level-1, p, pic);
	}
}

pair A = (0,0);
pair C = dir(60);
pair B = (1,0);

picture pic1, pic2, pic3;



/*
int level = 1;
koch_snowflake(Segment(A,B),level,p, pic1);
koch_snowflake(Segment(A,B),level+1,p, pic2);
koch_snowflake(Segment(A,B),level+2,p, pic3);
pair A1=(0.5,-0.3);
pair A2=(0.5,-0.8);
arrow(pic1, "",A1,N,1cm);
arrow(pic1, "",A2,N,1cm);
add(pic1);
add(shift(0,-.2)*pic2);
add(shift(0,-.8)*pic3);
*/
int level = 1;

koch_snowflake(Segment(A,B),level,p, pic1);
koch_snowflake(Segment(B,C),level,p, pic1);
koch_snowflake(Segment(C,A),level,p, pic1);
add(pic1);