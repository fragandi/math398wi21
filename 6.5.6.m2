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
    m := degree(y,g);

    d := g;
    temp := g; 

    while temp != 0 do (
        if (degree(y,leadTerm(temp)) != m) then (
            d = d - leadTerm(temp);
        );
        temp = temp - leadTerm(temp);
    );

    lift(d/y^m,R)
)

pseudodivide = (f,g,y) -> (
    m := degree(y,g);
    d := LC(g,y);
    r := f;
    q := 0;
    while ((not (r == 0)) and degree(y,r) >= m) do (
        q = d*q + LC(r,y) * y^(degree(y,r)-m);
        r = d*r - LC(r,y) * g * y^(degree(y,r)-m);
    );

    r
)


-- notice that only h3 and h4 depend on x4
for h in hypotheses do (
    print h;
)
M = matrix{
{degree(x1,h1),degree(x2,h1),degree(x3,h1),degree(x4,h1)},
{degree(x1,h2),degree(x2,h2),degree(x3,h2),degree(x4,h2)},
{degree(x1,h3),degree(x2,h3),degree(x3,h3),degree(x4,h3)},
{degree(x1,h4),degree(x2,h4),degree(x3,h4),degree(x4,h4)}}
print M

print ""

--print hypotheses

-- we will take f'4 = h4 and pseudodivide each other polynomial by f'4 wrt x4 to eliminate x4 from the other polynomials
f'4 = h4
f'1 = pseudodivide(h1,f'4,x4);
f'2 = pseudodivide(h2,f'4,x4);
f'3 = pseudodivide(h3,f'4,x4);

M = matrix{
{degree(x1,f'1),degree(x2,f'1),degree(x3,f'1),degree(x4,f'1)},
{degree(x1,f'2),degree(x2,f'2),degree(x3,f'2),degree(x4,f'2)},
{degree(x1,f'3),degree(x2,f'3),degree(x3,f'3),degree(x4,f'3)},
{degree(x1,f'4),degree(x2,f'4),degree(x3,f'4),degree(x4,f'4)}}
print M
print ""
-- the only other variable we need to fix is x2, as it appears in f'1 (triangular means we can't have xi appear in f'j if i > j)
f'1 = pseudodivide(f'1,f'2,x2);

M = matrix{
{degree(x1,f'1),degree(x2,f'1),degree(x3,f'1),degree(x4,f'1)},
{degree(x1,f'2),degree(x2,f'2),degree(x3,f'2),degree(x4,f'2)},
{degree(x1,f'3),degree(x2,f'3),degree(x3,f'3),degree(x4,f'3)},
{degree(x1,f'4),degree(x2,f'4),degree(x3,f'4),degree(x4,f'4)}}
print M


-- we have successfully triangularized the hypotheses

-- now, we successively pseudodivide our conclusions and check that the final remainder R0 is zero
g1 = x1^2 - 2*x1*x3 - 2*x4*x2 + x2^2
g2 = 2*x3*u1 - 2*x3*u2 - 2*x4*u3 - u1^2 + u2^2 + u3^2
R4 = g1
R3 = pseudodivide(R4,f'4,x4)
R2 = pseudodivide(R3,f'3,x3)
R1 = pseudodivide(R2,f'2,x2)
R0 = pseudodivide(R1,f'1,x1)
print R0

R4 = g2
R3 = pseudodivide(R4,f'4,x4)
R2 = pseudodivide(R3,f'3,x3)
R1 = pseudodivide(R2,f'2,x2)
R0 = pseudodivide(R1,f'1,x1)
print R0

-- it works!
