-- do I want to use lex?
R = QQ[x1,x2,x3,x4,u1,u2,u3, MonomialOrder => Lex]

f1 = x1*x4 + x4*u1 - x4*u2 - u1*u3
f2 = x1*u3 - u1*u3 - u2*u3
f3 = x2-u3
f4 = x3*u3 + x4*u1 - x4*u2 -u1*u3
f5 = x4*u1^2 - x4*u1*u2 - u1^2*u3/2 + u1*u2*u3/2
f6 = x4*u1*u3 - (u1*u3^2)/2

V = ideal(f1,f2,f3,f4,f5,f6)
print V
G = gb V
print gens G
for i in (entries gens G)_0 do (
    print factor i;
)
print " "

-- V = V1 U V2
V1 = ideal(f1,x1-u1-u2,f3,f4,f5,f6)
print V1
G1 = gb V1

for i in (entries gens G1)_0 do (
    print factor i;
)
print " "

V2 = ideal(f1,u3,f3,f4,f5,f6)
print V2
G2 = gb V2

for i in (entries gens G2)_0 do (
    print factor i;
)
print " "

-- V1 = V3 U V4
V3 = ideal(u1, (2*x3*u3 - 2*x4*u2 - u1*u3), (x2 - u3), x1-u1-u2)
print V3
G3 = gb V3

for i in (entries gens G3)_0 do (
    print factor i;
)


V4 = ideal(2*x4 - u3, (2*x3*u3 - 2*x4*u2 - u1*u3), (x2 - u3), x1-u1-u2)
print V4
G4 = gb V4

for i in (entries gens G4)_0 do (
    print factor i;
)

-- V2 = V5 U V6
V5 = ideal(u3, u1 - u2, x2, x1*x4)
print V5
G5 = gb V5

for i in (entries gens G5)_0 do (
    print factor i;
)

