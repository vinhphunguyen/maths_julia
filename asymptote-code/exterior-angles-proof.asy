import graph;
import geometry;
import gsl;

usepackage("amsmath");
usepackage("mtpro2");

settings.outformat="pdf"; // output is pdf

size(12cm, keepAspect=true);
defaultpen(fontsize(12pt));

picture pic1, pic2,pic3,pic4;

pen p  = black+1.2pt;
pen p1 = blue+.8pt;

// pic1

path myfunc(pair A, pair A1, pair A2, int i, picture pic)
{
	pair AA1 = A-A1;
	pair AA2 = A-A2;

	AA1 = AA1/length(AA1);
	AA2 = AA2/length(AA2);

	pair normal1 = (-AA1.y,AA1.x);

    if ( dot(normal1, A2-A) > 0 ) normal1 *= -1;

	pair normal2 = (-AA2.y,AA2.x);

	if ( dot(normal2, A1-A) > 0 ) normal2 *= -1;


	pair F1(real t) {
    	return ( A.x + normal1.x * t, A.y + normal1.y * t );
	}

	pair F2(real t) {
    	return ( A.x + normal2.x * t, A.y + normal2.y * t );
	}

	path g;

	g = g -- graph(F1, 0, 1,n=20);
	g = g -- arc(A,F1(1),F2(1));
	g = g -- graph(F2, 0, 1,n=20);


	draw(pic,"$180^\circ-a_"+string(i)+"$",arc(A,F1(1),F2(1)),PenMargins);

	perpendicular(pic,A,SE,A--F1(1),blue);
	perpendicular(pic,A,NE,A--F2(1),red);

    return g;
}

path myfunc1(pair A, pair A1, pair A2, int i, picture pic)
{
	pair AA1 = A-A1;
	pair AA2 = A-A2;

	AA1 = AA1/length(AA1);
	AA2 = AA2/length(AA2);

	pair normal1 = (-AA1.y,AA1.x);

    if ( dot(normal1, A2-A) > 0 ) normal1 *= -1;

	pair normal2 = (-AA2.y,AA2.x);

	if ( dot(normal2, A1-A) > 0 ) normal2 *= -1;


	pair F1(real t) {
    	return ( A.x + normal1.x * t, A.y + normal1.y * t );
	}

	pair F2(real t) {
    	return ( A.x + normal2.x * t, A.y + normal2.y * t );
	}

	path g;

	g = g -- graph(F1, 0, 1,n=20);
	g = g -- arc(A,F1(1),F2(1));
	g = g -- graph(F2, 0, 1,n=20);

    return g;
}

pair A=(0.2,0.4);
pair B=(2.1,0.3);
pair C=(2.9,2);
pair D=(1.5,2.5);
pair G=(.5,1.8);

draw(pic1,A--B--C--D--G--cycle,p);

label(pic1,"$a_1$",A+(.43,.2));
label(pic1,"$a_2$",B+(-.3,.3));
label(pic1,"$a_3$",C+(-.43,-.2));
label(pic1,"$a_4$",D+(.0,-.26));
label(pic1,"$a_5$",G+(.23,-.23));

path arc1= myfunc(A, G, B, 1, pic1);
path arc2= myfunc(B, A, C, 2, pic1);
path arc3= myfunc(C, B, D, 3, pic1);
path arc4= myfunc(D, C, G, 4, pic1);
path arc5= myfunc(G, D, A, 5, pic1);

draw(pic1,arc1,p1);
draw(pic1,arc2,p1);
draw(pic1,arc3,p1);
draw(pic1,arc4,p1);
draw(pic1,arc5,p1);



add(pic1); 

// pic2

pair A=(0.2,0.4);
pair B=(2.1,0.3);
pair C=(2.9,2);
pair D=(1.5,2.5);
pair G=(.5,1.8);


path arc1= myfunc1(A, G, B, 1, pic2);
path arc2= myfunc1(B, A, C, 2, pic2);
path arc3= myfunc1(C, B, D, 3, pic2);
path arc4= myfunc1(D, C, G, 4, pic2);
path arc5= myfunc1(G, D, A, 5, pic2);

draw(pic2,arc1,p1);
draw(pic2,shift(-1.5,0)*arc2,p1);
draw(pic2,shift(-2.,-1.5)*arc3,p1);
draw(pic2,shift(-1.,-1.7)*arc4,p1);
draw(pic2,shift(-.3,-1.3)*arc5,p1);

add(shift(6,0)*pic2);

// pic3

path arc1= myfunc1(A, G, B, 1, pic3);
path arc2= myfunc1(B, A, C, 2, pic3);
path arc3= myfunc1(C, B, D, 3, pic3);
path arc4= myfunc1(D, C, G, 4, pic3);
path arc5= myfunc1(G, D, A, 5, pic3);

draw(pic3,arc1,p1);
draw(pic3,shift(A.x-B.x,A.y-B.y)*arc2,p1);
draw(pic3,shift(A.x-C.x,A.y-C.y)*arc3,p1);
draw(pic3,shift(A.x-D.x,A.y-D.y)*arc4,p1);
draw(pic3,shift(A.x-G.x,A.y-G.y)*arc5,p1);

add(shift(9,0)*pic3);