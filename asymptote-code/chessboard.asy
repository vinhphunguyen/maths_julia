import graph;
import geometry;
import gsl;

usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(9cm, keepAspect=true);
defaultpen(fontsize(26pt));

void draw_grid(real lx, real ly, int nx, int ny, pen p)
{
	real dx = lx/nx;
	real dy = ly/ny;

	for(int i = 0; i < ny+1; ++i)
	{
		pair p1 = (0,  i*dy);
		pair p2 = (lx, i*dy);

		draw(p1--p2,p);
	}

	for(int i = 0; i < nx+1; ++i)
	{
		pair p1 = (i*dx,  0 );
		pair p2 = (i*dx, ly);

		draw(p1--p2,p);
	}

    int num = 1;
    
	for(int i = 0; i < ny; ++i)
	{
		if ( i % 2 == 0 )
		{
			for(int j = 0; j < nx; ++j)
			{
				if ( j % 2 == 0 ){
					pair p1 = (j*dx,i*dy);
					filldraw(p1--p1+(dx,0)--p1+(dx,dy)--p1+(0,dy)--cycle,gray);
				}
			}
		}
		else
		{
			for(int j = 0; j < nx; ++j)
			{
				if ( j % 2 != 0 ){
					pair p1 = (j*dx,i*dy);
					filldraw(p1--p1+(dx,0)--p1+(dx,dy)--p1+(0,dy)--cycle,gray);
				}
			}
		}
	}

	draw((0,ly-dy)--(dx,ly));
	draw((0,ly)--(dx,ly-dy));

	draw((lx-dx,0)--(lx,dy));
	draw((lx-dx,dy)--(lx,0));
}

real lx = 4;
real ly = 4;
int  nx = 4;
int  ny = 4;

pen p = black + 1.1pt;

draw_grid(lx,ly,nx,ny,p);

shipout(bbox(2mm,invisible));

