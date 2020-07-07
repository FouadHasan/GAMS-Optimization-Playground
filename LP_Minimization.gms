$ontext
Block comment style in gams.
This is a simple linear minimization problem.
It has 3 variables and 4 equations.
$offtext

Positive Variables x1 , x2 , x3;
Variables          OF ;

Equations          eq1, eq2, eq3, eq4;

eq1.. x1+2*x2 =g= 3;
eq2.. x3+x2 =g= 5;
eq3.. x1+x3 =e= 4;
eq4.. x1+3*x2 +3*x3 =e= OF ;

Model LP1 / eq1, eq2, eq3, eq4 / ;
Solve LP1 using LP minimizing OF ;

display x1.l, x2.l, x3.l, OF.l;
