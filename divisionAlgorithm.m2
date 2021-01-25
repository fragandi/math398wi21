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
