--Problem 3.4.17, Sam Ratliff
R=QQ[t,x,y,MonomialOrder=>Eliminate 1]
F=(x-t)^2+(y-t^2)^2-t^2
dF = diff(t,F)
I = ideal(F, dF)
G = gens gb I
J = eliminate(I,t)
envelope = J_0
print envelope

--part b requests us to use the extension theorem
--since the leading term of g_7 is 2t^3, the extension theorem applies
print G_(0,6)

--By setting g_7=0, we can simplify to get 2(t^2-y)t = x
--if x = 0, we have three solutions, t=0, t=+sqrt(y), and t=-sqrt(y)
--if x != 0, we have a messy equation that I was going to solve 
--graphically, but then something cool happened

