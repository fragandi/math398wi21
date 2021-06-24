-- a) x + y an element of  \sqrt{ideal(x3, y3, xy(x + y)}
       R = QQ[x,y,t]--define polynomial ring, incl. dummy variable for powers of f
       f = x + y 
       radI = ideal(x^3, y^3, x*y*(x+y), (1-t*f))
       g = gb radI -- compute Groebner basis for the ideal containing powers
       gens g
     --check using the "radical" function
      I = radical radI
      peek I
     --then what power of f \in radI?
      Q = QQ[x,y] --new ring, without dummy variable
      g1 = ideal(x^3, y^3, x*y*(x+y)) --the original ideal
      f = x + y --re-define the function we're trying to find
      f % g1 --find power using division algorithm
      f^2 % g1
      f^3 % g1  --when remainder = 0, the power is in the ideal

restart
--b) x^2 + 3xz an element of \radical{ideal(x + z, x^2y, x - z^2)
     H = QQ[x,y,z,t] --polynomial ring with dummy variable
     h = x^2 + 3*x*z
     radH  = ideal(x + z, x^2*y, x - z^2, 1-t*h)
     i = gb radH --compute GB for ideal w/powers
     gens i
     J = radical radH --check using "radical" function
     peek J

