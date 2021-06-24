--lex order GB + <LT(I)>
R = QQ[x,y,z, MonomialOrder => Lex]
f1 = x^4*y - z^6
f2 = x^2 - y^3*z
f3 = x^3*z^2 - y^3
G = gb ideal(f1, f2, f3)
gens G
--ideal of leading terms of I
H = ideal(z^67, y*z^6, y^3, x*z^6, x^2)

--grlex GB + <LT(I)>
R = QQ[x,y,z, MonomialOrder => GLex]
H = 
