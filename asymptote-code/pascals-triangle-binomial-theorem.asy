import graph;
import geometry;

usepackage("amsmath");
usepackage("bm");

settings.outformat="pdf"; // output is pdf

size(10cm, keepAspect=true);

defaultpen(fontsize(10pt));

int nrows = 7;

real dx = .5, dy = .25;

pair O=(0,0);

picture pic1, pic2;

int i = nrows-1;

label(pic1, "1", (0,0) );

do
{
   if ( i % 2 == 0 )  //
   {
      int j = (int) (i / 2);
      string s   = (string) choose(i,j);
      label(pic1, s, ( 0,-i*dy) );
      for(int k=0; k<j; ++k)
      {
        int    num = choose(i,k+j+1);
        string s   = (string) num;
        label(pic1, s, ( (k+1)*dx,-i*dy) );
        label(pic1, s, (-(k+1)*dx,-i*dy) );
      }
   }
   else               // (a+b)^5, (a+b)^3, (a+b)^1
   {
      int j = (int) (( i + 1 ) / 2);
      for(int k=0; k<j; ++k)
      {
        int    num = choose(i,k+j);
        string s   = (string) num;
        label(pic1, s, ( k*dx+dx/2,-i*dy) );
        label(pic1, s, (-k*dx-dx/2,-i*dy) );
      }
   }

   i = i - 1;
} while ( i != 0 );


add(pic1);

// pic2

int i = nrows-1;

 //string[] array(string s)
do
{
  
   string sdotss = "row " + string(i);
   /* Label L1=Label(sdotss,filltype=Fill(white));
   Label L2=Label(".........................");
   label(pic2, L2, (0,-i*dy),W);
   label(pic2, L1, (0,-i*dy-.01),W); */

   Label L2=Label(sdotss,EndPoint,Fill(white));
   draw(pic2,(0,-i*dy-.02)--(1,-i*dy-.02));
   label(pic2, L2, (1.038,-i*dy-.02),W);
   if ( i == 1 )
   {
      Label L2=Label("row 0",EndPoint,Fill(white));
     draw(pic2,(0,-.02)--(1,-.02));
     label(pic2, L2, (1.038,-.02),W);
   }
   // next row
   i = i - 1;
} while ( i != 0 );

add(shift(2,0)*pic2);
//shipout(bbox(3mm,invisible));
