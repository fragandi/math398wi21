--define our ring
R = QQ[x1,x2,x3,x4,u1,u2,u3, MonomialOrder => Lex]

-- define our hypotheses
h1 = x2 - u3
h2 = (x1 - u1)*u3 - u2*x2
h3 = x4*x1 - x3*x2
h4 = x4*(u2-u1) - (x3-u1)*u3

I = ideal(h1,h2,h3,h4)
H = gb I

for i in (entries gens H)_0 do (
    print factor i;
)

-- the groebner basis of H yields these equations
f1 = x1*x4 + x4*u1 - x4*u2 - u1*u3
f2 = x1*u3 - u1*u3 - u2*u3
f3 = x2-u3
f4 = x3*u3 + x4*u1 - x4*u2 -u1*u3
f5 = x4*u1^2 - x4*u1*u2 - u1^2*u3/2 + u1*u2*u3/2
f6 = x4*u1*u3 - (u1*u3^2)/2

V = ideal(f1,f2,f3,f4,f5,f6)

-- we can check that this is the groebner basis by doing V == I
print (V == I)

print V
G = gb V
print gens G
for i in (entries gens G)_0 do (
    print factor i;
)
print " "


-- notice that some of these generators were factorable
-- this means we can decompose the ideal further



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
-- they are contained within the fourth ideal
-- note: we use "or"s to detect if at least one ideal is contained in the union of the others
print (isSubset(intersect(V', U1, U2),U3) or isSubset(intersect(V', U1, U3),U2) or isSubset(intersect(V', U3, U2),U1) or isSubset(intersect(U3, U1, U2),V'))


-- we notice that the functions u1, u2, and u3 are not algebraically independant on U1, U2, and U3
-- however, they are algebraically independant on V', so we can use V' to make conclusions from our hypotheses
-- our conclusion is "the intersection of the diagonals of a parallelogram bisects both diagonals"
-- we can write this in polynomials with the following equations
g1 = x1^2 - 2*x1*x3 - 2*x4*x2 + x2^2
g2 = 2*x3*u1 - 2*x3*u2 - 2*x4*u3 - u1^2 + u2^2 + u3^2

-- then, we just check if both conclusions are in V'

print (((g1 % V') == 0) and ((g2 % V') == 0))


-- if we use a different formulation for our hypotheses, we get a groebner basis that is much friendlier
h1' = x1 - u1 - u2
h2' = x2-u3


I' = ideal(h1',h2',h3,h4)
H' = gb I'

for i in (entries gens H')_0 do (
    print factor i;
)

print " "
-- notice that only one equation is factorable

I1' = ideal( (2*x4 - u3), (2*x3*u3 - 2*x4*u2 - u1*u3), (x2 - u3), (x1 - u1 - u2))
H1' = gb I1'

for i in (entries gens H1')_0 do (
    print factor i;
)

print " "
I2' = ideal( u1, (2*x3*u3 - 2*x4*u2 - u1*u3), (x2 - u3), (x1 - u1 - u2))

H2' = gb I2'

for i in (entries gens H2')_0 do (
    print factor i;
)

print " "
I3' = ideal((2*x4 - u3), (2*x3 - u1 - u2), (x2 - u3), (x1 - u1 - u2))

H3' = gb I3'

for i in (entries gens H3')_0 do (
    print factor i;
)
-- we notice that I3' is irreducible and that the ui's are algebraically independant over it
print " "
I4' = ideal((2*x4 - u3), (u3), (x2 - u3), (x1 - u1 - u2))
H4' = gb I4'

for i in (entries gens H4')_0 do (
    print factor i;
)
print " "

-- test our conclusions on I3'
print (((g1 % I3') == 0) and ((g2 % I3') == 0))
-- it works!
