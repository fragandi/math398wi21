restart
-- define a ring and some polynomials
R = QQ[x,y,z]
f = x^2*y*z+x*y^2*z+y^2*z+z^3+x*y
f1 = x*y+y^2-1
f2 = z^2
f3= x*y
G = ideal(f1,f2)

dim R
L  = {}
N = ""
M = vars R
for i from 0 to (dim(R)-1) do (L = L|toList(M_(0,i)));
for i from 0 to (dim(R)-1) do (N = N|toString(L#i));
peek L
peek N
class L#0
-- then I want to do for each variable gcd(variable,input monomial)
-- this should give me the variables in the monomial
for i from 0 to #L-1 do(var = gcd(f, L#i)); 
peek var

G = ideal(L#0)


--leading data
leadMonomial f
exponents leadMonomial f
leadTerm f
leadCoefficient f
someTerms(f,0,2)


-- Note: indexing starts at 0


-- divide f by f1,f2, 
-- output is the remainder the NORMAL FORM
f % G


-- Q: What is the standard term order in M2?
-- You can find out with "describe" 

describe R

-- Q: What is happening in this division?
-- this is what we went over by hand


-- M2 automatically computes a GB (Groebner basis) for these computations
-- We can force it to use our desired polynomials with forceGB
-- Warning: nonsensical answers may result


f % (forceGB gens G) 
f % (forceGB matrix{{f2,f1}})


-- Note: order matters!
f
J = ideal(f1,f3)

f % J
f % (forceGB matrix{{f1,f3}})
f % (forceGB matrix{{f3,f1}})

J1 = ideal(f3,f1)
f % J1

-- Note: for M2 order does not matter
-- because M2 is using a GB (automatically)
x = 1
for i from 0 to 5 do(
    for j from 1 do 5(
	x = x|i;
	)
    )
