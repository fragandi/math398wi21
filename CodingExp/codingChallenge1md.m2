R = QQ[x,y,z,w]

h = method()

h(R,R) := (f,g) -> gcd(f,g)

m = vars R

v = entries m
L = v#0
M = {x*w, x^2, x*y*w, z^3}
for i from 0 to ((dim R) - 1) do (if not h(M#0, L#i) == 1 then print h(M#0,   , L#i))
 -- want to make a for loop that goes through all the monomials in list M
for i from 0 to ((#M) - 1) do(
        for i from 0 to ((dim R) - 1) do (if not h(M#i, L#i) == 1 then print h(M#i, ,L#i));
)
for i from 0 to ((#M) - 1) do(
       for l from 0 to ((dim R) - 1) do (if not h(M#i, L#l) == 1 then print h(M#i,   ,   , L#l));
)
for i from 0 to ((#M) - 1) do(
      for l from 0 to ((dim R) - 1) do (if not h(M#i, L#l) == 1 then print h(M#i,  ,L#l))
)
 
