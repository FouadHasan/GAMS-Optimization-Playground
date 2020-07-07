* This is a simple linear profit maximization problem.
*A farmer ca produce three crops: corn, wheat and cotton. The farmer has fixed amount of land(100 acres) and labor(500 person).
*The labor required for crops are corn(6 person), wheat(4 person), cotton(8 person).
*Profit from each crops is corn( 109 dollar), wheat(90 dollar), cotton(115 dollar).
Positive Variables    Xcorn, Xwheat, Xcotton;
Variables             OF;

Equations     obj, land, labor;

obj..  OF =e= 109 * Xcorn + 90 * Xwheat + 115 * Xcotton;
land..             Xcorn +      Xwheat +       Xcotton =l= 100;
labor..        6 * Xcorn +  4 * Xwheat +   8 * Xcotton =l= 500;

Model farmproblem / obj, land, labor /;

solve farmproblem using LP maximizing OF;
*shows the optimal values
display OF.l, Xcorn.l, Xwheat.l, Xcotton.l;
