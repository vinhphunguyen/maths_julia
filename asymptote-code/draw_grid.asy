import graph;
import geometry;
import gsl;

usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(26pt));

void draw_grid(pair A, real lx, real ly, int nx, int ny, pen p)
{
	real dx = lx/nx;
	real dy = ly/ny;

	for(int i = 0; i < ny+1; ++i)
	{
		pair p1 = (A.x,    A.y+i*dy);
		pair p2 = (A.x+lx, A.y+i*dy);

		draw(p1--p2,p);
	}

	for(int i = 0; i < nx+1; ++i)
	{
		pair p1 = (A.x+i*dx, A.y   );
		pair p2 = (A.x+i*dx, A.y+ly);

		draw(p1--p2,p);
	}

    int num = 1;
    
	for(int i = 0; i < ny; ++i)
	{
		for(int j = 0; j < nx; ++j)
		{
			label(string(num),(.5*dx + j*dx,.5*dy + i*dy ),red); 
			num += 1;
		}
	}
}

pair A = (0,0);
real lx = 4;
real ly = 4;
int  nx = 4;
int  ny = 4;

pen p = black + 1.1pt;

draw_grid(A,lx,ly,nx,ny,p);

shipout(bbox(2mm,invisible));

