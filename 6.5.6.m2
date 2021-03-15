--define our ring
R = QQ[x1,x2,x3,x4,u1,u2,u3, MonomialOrder => Lex]

-- define our hypotheses
h1 = x2 - u3
h2 = (x1 - u1)*u3 - u2*x2
h3 = x4*x1 - x3*x2
h4 = x4*(u2-u1) - (x3-u1)*u3

I = ideal(h1,h2,h3,h4)
H = gb I

LC = (g,y) -> (

    m = degree(y,g);
    M := monomials(g, Variables=>{y});

    for mon in (entries M)_0 do (
        if (m == degree(mon,y)) then (
            d = leadCoefficient(mon);
            break;
        );
    );

    d
)

pseudodivide = (f,g,y) -> (
    m = degree(y,g);
    M := monomials(g, Variables=>{y});

    d = LC(g,y);
    r = f;
    q = 0;

    while (r != 0 and degree(y,r) >= m) do (
        q = d*q + LC(r,y) * y^(degree(y,r)-m);
        r = d*r - LC(r,y) * g* y^(degree(y,r)-m);
    );

{q, r}

)

print(pseudodivide(h1,h2,x1))
