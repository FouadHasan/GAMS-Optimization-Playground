* This is a simple boundary value determination problem.

$ontext
In this program, we find the maximum and minimum value of the
objective function.
$offtext

variables x1, x2, x3;
variables OF;

equations eq1, eq2, eq3, eq4;

eq1.. x1+2*x2 =l=3;
eq2.. x3+x2=l=2 ;
eq3.. x1+x2+x3=e=4;
eq4.. x1+2*x2-3*x3=e=OF;

x1.lo= -10 ;
x1.up= 10 ;

x2.lo= -10 ;
x2.up= 10 ;

x3.lo= -10 ;
x3.up= 10 ;

model LP1 / all /;
solve LP1 using LP minimizing OF

solve LP1 using LP maximizing OF
