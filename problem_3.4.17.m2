R=QQ[t,x,y,MonomialOrder=>Eliminate 1]
F=(x-t)^2+(y-t^2)^2-t^2
dF = diff(t,F)
I = ideal(F, dF)
G = gens gb I
J = eliminate(I,t)
envelope = J_0

print G_(0,6)

