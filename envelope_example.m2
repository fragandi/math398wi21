


--select a monomial ordering that helps
--eliminate one variable
R=QQ[t,x,y,MonomialOrder=>Eliminate 1]

--define our function
F=(x-t)^2+(y-t^2)^2-4

--take its derivative (see Def 3.4.5)
dF = diff(t,F)

--generate the ideal and groebner basis
I = ideal(F, dF)
G = gens gb I

--eliminate t
J = eliminate(I,t)

--the first equation will not depend on t
--it is our envelope
envelope = J_0
print "the envelope is:" 
print envelope

--Part b requests us to use the extension 
--theorem to generalize back up to (t,x,y).

--Since the leading term of g_7 is 2t^3 and 
--all other t terms have lesser degree, 
--the extension theorem applies.
print "to extend the solutions back to t:"

--prints the last element of G
print G_(0, numgens source G -1)
