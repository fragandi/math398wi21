--define our ring
R = QQ[x1,x2,x3,x4,u1,u2,u3, MonomialOrder => Lex]

-- define our hypotheses
h1 = x2 - u3
h2 = (x1 - u1)*u3 - u2*x2
h3 = x4*x1 - x3*x2
h4 = x4*(u2-u1) - (x3-u1)*u3

hypotheses = {h1,h2,h3,h4}

I = ideal(h1,h2,h3,h4)
H = gb I

LC = (g,y) -> (

    m = degree(y,g);
    M := monomials(g);
    d = g;
    temp = g; 
    while temp != 0 do (
        if (degree(y,leadTerm(temp)) != m) then (
            d = d - leadTerm(temp);
        );
        temp = temp - leadTerm(temp);
    );

    lift(d/y^m,R)
)

print "HERE IT IS";
pseudodivide = (f,g,y) -> (
    m = degree(y,g);
    M := monomials(g, Variables=>{y});

    d = LC(g,y);
print "d = ";
print d;
print "g = ";
print g;
    r = f;
    q = 0;
i = 0;
    while ((not (r == 0)) and degree(y,r) >= m) do (
        q = d*q + LC(r,y) * y^(degree(y,r)-m);
        r = d*r - LC(r,y) * g * y^(degree(y,r)-m);
print q;
print r;
print " ";
i = i + 1;
if (i > 10) then break;
    );

    r
)


-- notice that only h3 and h4 depend on x4
for h in hypotheses do (
    print degree(x4,h);
)

--print hypotheses

-- we will take f'4 = h4 and pseudodivide each other polynomial by f'4 wrt x4 to eliminate x4 from the other polynomials
f'4 = h4
f'1 = pseudodivide(h1,f'4,x4);
f'2 = pseudodivide(h2,f'4,x4);
f'3 = pseudodivide(h3,f'4,x4);
hypotheses' = {f'1, f'2, f'3, f'4};

print hypotheses'
for h in hypotheses' do (
    print degree(x4,h);
)
