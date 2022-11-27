import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);

defaultpen(fontsize(10pt));

int nrows = 8;

real dx = .5, dy = .25;

pair O=(0,0);

void do_plot(picture pic, int nrows, real dx=.5, real dy=.5, pen p)
{
   int i = nrows-1;

   if ( nrows == 1 ){
      dot(pic,(0,-(4)*dy),p);
   }
   else
   {
      int   ii = 0;
 
      do
      {
         real yy = -(4-ii)*dy;
         if ( i % 2 == 0 )  //
         {
            int j = (int) (i / 2);
            dot(pic, ( 0,yy), p );
            for(int k=0; k<j; ++k)
            {
              dot(pic, ( (k+1)*dx,yy), p );
              dot(pic, (-(k+1)*dx,yy), p );
            }
         }
         else               // (a+b)^5, (a+b)^3, (a+b)^1
         {
            int j = (int) (( i + 1 ) / 2);
            for(int k=0; k<j; ++k)
            {
              dot(pic, ( k*dx+dx/2,yy), p );
              dot(pic, (-k*dx-dx/2,yy), p );
            }
         }
         if ( i == 1 ){
            dot(pic,(0,-(4-ii-1)*dy),p);
         }
         i = i - 1;
         ii = ii + 1; 
      } while ( i != 0 );
   }
}

picture pic1, pic2, pic3, pic4, pic5;


pen p = black+4pt;

do_plot(pic1, 1, dx, dy, p);
label(pic1,"$1$",(0,0.5));

add(pic1);
// pic2
do_plot(pic2, 2, dx, dy, p);
label(pic2,"$3$",(0,0.5));
add(shift(.7,0)*pic2);
// pic3
do_plot(pic3, 3, dx, dy, p);
label(pic3,"$6$",(0,0.5));
add(shift(2,0)*pic3);
// pic4
do_plot(pic4, 4, dx, dy, p);
label(pic4,"$10$",(0,0.5));

add(shift(4,0)*pic4);
// pic4
do_plot(pic5, 5, dx, dy, p);
label(pic5,"$15$",(0,0.5));

add(shift(6.5,0)*pic5);


//shipout(bbox(3mm,invisible));
