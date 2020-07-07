*A non linear optimization problem, solved by maximizing the objective.
*It has 4 variables and 3 equations.
*Variable upper limit=1, and lower limit =3 
variables x1, x2, x3, x4;
variable OF;

equations eq1, eq2, eq3;

eq1.. OF =e= x1*x4*(x1+x2+x3)+x2;
eq2.. x1*x2*x3*x4 =g= 20;
eq3.. x1*x1+x2*x2+x3*x3+x4*x4 =e= 30;

x1.lo=1;x1.up=3;
x2.lo=1;x2.up=3;
x3.lo=1;x3.up=3;
x4.lo=1;x4.up=3;

model NLP_problem / all / ;
solve NLP_problem using NLP maximizing OF;
