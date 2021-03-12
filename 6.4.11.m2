-- do I want to use lex?
R = QQ[u1,u2,u3,x1,x2,x3,x4, MonomialOrder => Lex]

f1 = x1*x4 + x4*u1 - x4*u2 - u1*u3
f2 = x1*u3 - u1*u3 - u2*u3
f3 = x2-u3
f4 = x3*u3 + x4*u1 - x4*u2 -u1*u3
f5 = x4*u1^2 - x4*u1*u2 - u1^2*u3/2 + u1*u2*u3/2
f6 = x4*u1*u3 - (u1*u3^2)/2

I = ideal(f1,f2,f3,f4,f5,f6)
print I
G = gb I
print gens G
for i in (entries gens G)_0 do (
    print factor i;
)
