


--parabola example in the book
--select a monomial ordering that helps
--eliminate one variable
R=QQ[t,x,y,MonomialOrder=>Eliminate 1]

--define our function
F=(x-t)^2-y+t

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
print envelope

--Part b requests us to use the extension 
--theorem to generalize back up to (t,x,y).

--Since the leading term of g_7 is 2t^3 and 
--all other t terms have lesser degree, 
--the extension theorem applies.
print G_(0,1)

--By setting g_7=0, we can simplify to get 2(t^2-y)t = x
--if x = 0, we have three solutions, t=0, t=+sqrt(y), and t=-sqrt(y)
--if x != 0, we have a messy equation that I was going to solve
--graphically, but then something cool happened

