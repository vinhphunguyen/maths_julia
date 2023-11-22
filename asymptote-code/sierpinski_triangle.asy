import geometry;

settings.outformat="pdf"; // output is pdf

size(7cm, keepAspect=true);
defaultpen(fontsize(12pt));

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

pen p = black + 1pt;

pair B = (0,0);
pair A = dir(60);
pair C = (1,0);

int level = 8;
//sierpinski_triangle(A,B,C,level,p);

pair randomPointInTriangle(pair A, pair B, pair C) {
    real s = sqrt(rand());
    real t = rand();
    return (1 - s) * A + s * (1 - t) * B + s * t * C;
}

void chaos_sierpinski(int N=100)
{
	pair B = (0,0);
	pair A = dir(60);
	pair C = (1,0);

	pair randomPoint = randomPointInTriangle(A, B, C);

    
	for (int i = 0; i < N; ++i){
		//int ra = randrange(1, 3);
	}
}


