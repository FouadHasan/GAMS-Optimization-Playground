$ontext
This is a minimum transportation cost problem.
There are 3 suppliers warehouse and 4 customer shops.
There are different routes between warehouse and shops.
Every supplier has some minimum(pmin) ans maximum(pmax) supply limit.
p(i) is the  optimal supplied amount.
x(i,j) is transported product in route (i,j).
The tranportation cost is proportional to route.
route_cost(i,j) is the cost of each route.
The tranportation cost is proportional to the square of transported product, x(i,j).
Every route has maximum transportation limit(100).
$offtext

sets
i / s1*s3 /
j / d1*d4 / ;

table route_cost(i,j)
      d1    d2     d3    d4
s1 0.0755 0.0655 0.0498 0.0585
s2 0.0276 0.0163 0.096  0.0224
s3 0.068  0.0119 0.034  0.0751 ;

*table data(i,*)
*  'pmin' 'pmax'
*s1  100    450
*s2  50     350
*s3  30     500 ;
parameter pmax(i)
/ s1 450
s2 350
s3 500 / ;
parameter pmin(i)
/ s1 100
s2 50
s3 30/ ;

parameter demand(j)
/ d1 217
d2 150
d3 145
d4 244 / ;

variable OF, x(i,j), p(i) ;
*binary variable u(i) ;

equations eq1, eq2, eq3, eq4, eq5;

eq1.. OF =e= sum((i,j), route_cost(i,j)*x(i,j)*x(i,j));
*eq2(i).. p(i) =g= data(i,'Pmin')*u(i);
*eq3(i).. p(i) =l= data(i,'Pmax')*u(i);
eq2(i).. p(i) =g= pmin(i);
eq3(i).. p(i) =l= pmax(i);
eq4(i).. p(i) =e= sum(j,x(i,j));
eq5(j).. demand(j) =g= sum(i,x(i,j));

p.lo(i)=0;
*p.up(i)= data(i,'Pmax') ;
p.up(i)=pmax(i);

x.lo(i,j)=0;
x.up(i,j)=100;

model min_transportation_cost /all/;
*shows the list of solvers
option subsystems;
*selecting solver
option nlp = CONOPT;
solve min_transportation_cost using nlp minimizing OF;
*solve min_transportation_cost using minlp minimizing OF;
display p.l, x.l ;


