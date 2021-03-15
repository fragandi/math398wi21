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







-- V1 = V3 U V4
V3 = ideal(u1, (2*x3*u3 - 2*x4*u2 - u1*u3), (x2 - u3), x1-u1-u2)
print V3
G3 = gb V3

for i in (entries gens G3)_0 do (
    print factor i;
)
-- ^^^ this is U3
U3 = V3

V4 = ideal(2*x4 - u3, (2*x3*u3 - 2*x4*u2 - u1*u3), (x2 - u3), x1-u1-u2)
print V4
G4 = gb V4

for i in (entries gens G4)_0 do (
    print factor i;
)
-- this is very close to being V', not sure how the u3 got here







-- V2 = V5 U V6
V5 = ideal(u3, u1 - u2, x2, x1*x4)
print V5
G5 = gb V5

for i in (entries gens G5)_0 do (
    print factor i;
)
-- this is very close to being U2

-- V2 = V5 U V6
V6 = ideal(u3, x4, x2, x1*x4)
print V6
G6 = gb V6

for i in (entries gens G6)_0 do (
    print factor i;
)
-- this is U1
U1 = V6








-- V5 = V7 U V8
V7 = ideal(u3, u1 - u2, x2, x1)
print V7
G7 = gb V7

for i in (entries gens G7)_0 do (
    print factor i;
)
-- this is U2
U2 = V7

-- V5 = V7 U V8
V8 = ideal(u3, u1 - u2, x2, x4)
print V8
G8 = gb V8

for i in (entries gens G8)_0 do (
    print factor i;
)
-- this is U1 U u1 - u2







-- V4 = V9 U V10
V9 = ideal( (2*x4 - u3),(2*x3 - u1 - u2),(x2 - u3),(x1 - u1 - u2))
print V9
G9 = gb V9

for i in (entries gens G9)_0 do (
    print factor i;
)
--this is V'
V' = V9

V10 = ideal( (2*x4 - u3),u3,(x2 - u3),(x1 - u1 - u2))
print V10
G10 = gb V10

for i in (entries gens G10)_0 do (
    print factor i;
)
-- this is U1 U x1-u1-u2




-- intersection of ideals is a union of varieties
-- here we ensure that our irreducible ideals make up all of V
print (V == intersect(V', U1, U2,U3))


-- test to figure out how isSubset works
-- we know that the variety of U3 is a subset of V, so the ideal of V is a subset of U3
print isSubset(V, U3)

-- we want to show that none of the irreducible components of the variety are contained within 
-- the union of the other irreducible components, so we intersect the three other ideals and check whether 
-- they are contained within the last ideal
-- note: we use "or"s to detect if at least one ideal is contained in the union of the others
print (isSubset(intersect(V', U1, U2),U3) or isSubset(intersect(V', U1, U3),U2) or isSubset(intersect(V', U3, U2),U1) or isSubset(intersect(U3, U1, U2),V'))
