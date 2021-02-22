R = CC[u,v, x,y,z, MonomialOrder => Lex]
x1 = x - 3*u - 3*u*v^2 + u^3 
x2 = y - 3*v - 3*u^2*v + v^3
x3 = z - 3*u^2 + 3*v^2
I2 = ideal(x1, x2, x3)
G = gb I2
gens G
