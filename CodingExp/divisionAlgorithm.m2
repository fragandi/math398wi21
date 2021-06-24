--takes the parameters f,g where f is the dividend and g is the divisor
divisionAlgorithm (f, g)-> (
--To begin, set q1:=0,…,qs:=0 and r:=0, and introduce p:=f.
    --q = quotient of LT(f)/LT(g)
    q:=0;
    --r = the remainder of f/g
    r:= 0;
    --p = the current form of f
    p:=f
--While p≠0, we remove LT(p) (and possibly more) from p as follows:
while p !=0 do (
        
--Try to find the smallest index i such that LT(fi) divides LT(p).

--If i is found (division step): set qi:=qi+LT(p)/LT(fi) and p:=p−(LT(p)/LT(fi))fi.

--If no such i exists (remainder step), then set r:=r+LT(p) and p:=p−LT(p).

)
--Finally, return (q1,…,qs) and r.
    
)
R = QQ[x,y,z, MonomialOrder => GLex]
f = x^3-x^2*y-x^2*z+x
f1 = x^2*y-z
f2 = x*y-1
G = ideal(f2, f1)
describe G
f%G
f % (forceGB gens G)   
f % (forceGB matrix{{f1,f2}})
f % (forceGB matrix{{f2,f1}})
gcd(f, G)
r = x-z
gcd(f, f1, f2)
r% (forceGB matrix{{f1,f2}})
f3 = x^4*f2 + f1
gcd(f3, f1, f2)
f3% (forceGB matrix{{f1,f2}})
reset
restart
S = QQ[x,y,z, MonomialOrder => Lex]
g1 =x*y^2 - x*z + y 
g2 = x*y - z^2
g3 = x - y*z^4
g = x*g2 - z*g2
G = ideal(g1, g2, g3)
g % (forceGB matrix{{g1,g2,g3}})
