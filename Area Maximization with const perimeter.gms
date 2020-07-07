*This problem shows how to maximize the area of a triangle with a constant perimeter.
*The fixed perimetr is 15.
*Find the base and height so that the area will be maximum.
positive variables  H, B;
variable  OF;

equations eq1, eq2;

scalar C /15/;
H.up= C;
B.up= C;

eq1.. OF =e= 0.5*H*B;
eq2.. H+B+sqrt(H*H+B*B) =e= C;

model triangle / all / ;

solve triangle using NLP maximizing OF ;

