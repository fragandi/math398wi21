R = QQ[x,y,t]
-- x + y an element of  \sqrt{ideal(x3, y3, xy(x + y)}
f = x + y
radI = ideal(x^3, y^3, x*y*(x+y), (1-t*f))
g = gb radI
gens g
--check using the "radical" function
I = radical radI
I
peek I
--what power of f \in radI?
Q = QQ[x,y]
g1 = ideal(x^3, y^3, x*y*(x+y))
f = x + y
g1 % f --THIS GENERATES AN ERROR MESSAGE


H = QQ[x,y,z,t]
h = x^2 + 3*x*z
radH  = ideal(x + z, x^2*y, x - z^2, 1-t*h)
i = gb radH
gens i
J = radical radH
restart
