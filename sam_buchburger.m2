--sets ordering to grlex to match example 1 on page 90
R = QQ[x,y,MonomialOrder=>{Weights=>2:1,Lex}];
F = {x^3-2*x*y,x^2*y-2*y^2+x};
G = F;

while (true) do
( 
    Gp = G;
    for p in Gp do (
        for q in Gp do (
            if (p != q) then (
                --print(p);
                --print(q);

                xlambda = lcm(leadTerm(p),leadTerm(q));

                S1 = xlambda*p / leadTerm(p);
                S2 = xlambda*q / leadTerm(q);
                --print( S1);

                S = S1 - S2;
                S = lift(S,R);

                I = ideal(Gp);

--no matter what I do, when I do the division
--of S by I, the remainder is zero...
                r = S % I;

print(S);
print("remainder");
                print(r);
                if (r != 0) then (
                    G = join(G, {r})
                    
                );
            );
        );
    );
    if (G == Gp) then (break;)
);
print(G)
