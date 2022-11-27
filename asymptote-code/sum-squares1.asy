import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(14cm, keepAspect=true);

defaultpen(fontsize(10pt));

int nrows = 8;

real dx = .5, dy = .25;

pair O=(0,0);

void do_plot(picture pic, int nrows, real dx=.5, real dy=.5, pen p)
{
   int i = nrows-1;

   if ( nrows == 1 ){
      //draw(pic,(0,-(4)*dy),L1);
        object ellipse1=draw(pic,"$9$",ellipse,(0,-(4)*dy),xmargin=.1mm,Fill(cyan));
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
            //draw(pic, ( 0,yy), L1 );   
            object ellipse1=draw(pic,"$9$",ellipse,( 0,yy),xmargin=.1mm,Fill(cyan));
            for(int k=0; k<j; ++k)
            {
              //draw(pic, ( (k+1)*dx,yy), L1 );
            object ellipse1=draw(pic,"$9$",ellipse,( (k+1)*dx,yy),xmargin=.1mm,Fill(cyan));
            object ellipse1=draw(pic,"$9$",ellipse,(-(k+1)*dx,yy),xmargin=.1mm,Fill(cyan));
              //draw(pic, (-(k+1)*dx,yy), L1 );
            }
         }
         else               // (a+b)^5, (a+b)^3, (a+b)^1
         {
            int j = (int) (( i + 1 ) / 2);
            for(int k=0; k<j; ++k)
            {
                 object ellipse1=draw(pic,"$9$",ellipse,( k*dx+dx/2,yy),xmargin=.1mm,Fill(cyan));
                   object ellipse1=draw(pic,"$9$",ellipse,(-k*dx-dx/2,yy),xmargin=.1mm,Fill(cyan));
              //draw(pic, ( k*dx+dx/2,yy), L1 );
              //draw(pic, (-k*dx-dx/2,yy), L1 );
            }
         }
         if ( i == 1 ){
            //draw(pic,(0,-(4-ii-1)*dy),L1);
              object ellipse1=draw(pic,"$9$",ellipse,(0,-(4-ii-1)*dy),xmargin=.1mm,Fill(cyan));
         }
         i = i - 1;
         ii = ii + 1; 
      } while ( i != 0 );
   }
}

picture pic1, pic2, pic3, pic4, pic5;


pen p = black+4pt;

real dx = .5;
real dy =dx*sqrt(3)/2;

draw(pic1,(0,0)--(1.5dx,-3dy)--(-1.5dx,-3dy)--cycle,black+1.pt);

object ellipse1=draw(pic1,"$1$",ellipse,( 0,0),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic1,"$2$",ellipse,( dx/2,-dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic1,"$2$",ellipse,( -dx/2,-dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic1,"$3$",ellipse,( 0,-2dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic1,"$3$",ellipse,( dx,-2dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic1,"$3$",ellipse,( -dx,-2dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic1,"$4$",ellipse,( -dx/2,-3dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic1,"$4$",ellipse,(  dx/2,-3dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic1,"$4$",ellipse,(  1.5dx,-3dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic1,"$4$",ellipse,(  -1.5dx,-3dy),xmargin=.1mm,Fill(cyan));



add(pic1);


draw(pic2,(0,0)--(1.5dx,-3dy)--(-1.5dx,-3dy)--cycle,black+1.pt);

object ellipse1=draw(pic2,"$4$",ellipse,( 0,0),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic2,"$4$",ellipse,( dx/2,-dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic2,"$3$",ellipse,( -dx/2,-dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic2,"$3$",ellipse,( 0,-2dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic2,"$2$",ellipse,( -dx,-2dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic2,"$4$",ellipse,( dx,-2dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic2,"$2$",ellipse,( -dx/2,-3dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic2,"$3$",ellipse,(  dx/2,-3dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic2,"$4$",ellipse,(  1.5dx,-3dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic2,"$1$",ellipse,(  -1.5dx,-3dy),xmargin=.1mm,Fill(cyan));

label(pic2,"$a)$" ,(0,-3.7dy));

add(shift(4dx,0)*pic2);

draw(pic3,(0,0)--(1.5dx,-3dy)--(-1.5dx,-3dy)--cycle,black+1.pt);

object ellipse1=draw(pic3,"$4$",ellipse,( 0,0),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic3,"$3$",ellipse,( dx/2,-dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic3,"$4$",ellipse,( -dx/2,-dy),xmargin=.1mm,Fill(cyan));

object ellipse1=draw(pic3,"$3$",ellipse,( 0,-2dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic3,"$4$",ellipse,( -dx,-2dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic3,"$3$",ellipse,( dx,-2dy),xmargin=.1mm,Fill(cyan));

object ellipse1=draw(pic3,"$3$",ellipse,( -dx/2,-3dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic3,"$2$",ellipse,(  dx/2,-3dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic3,"$1$",ellipse,(  1.5dx,-3dy),xmargin=.1mm,Fill(cyan));
object ellipse1=draw(pic3,"$4$",ellipse,(  -1.5dx,-3dy),xmargin=.1mm,Fill(cyan));

add(shift(8dx,0)*pic3);

draw(pic4,(0,-dy)--(1.5dx,-4dy)--(-1.5dx,-4dy)--cycle,black+1.pt);
do_plot(pic4, 4, dx, dy, p);

label(pic4,"$b)$" ,(0,-3.7dy-dy));

add(shift(12dx,dy)*pic4);

//shipout(bellipse(3mm,invisible));
