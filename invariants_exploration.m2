needsPackage "InvariantRing"
R = QQ[x_1..x_3]
W = matrix{{1,0,1},{0,1,1}}
d = {5,6}
print W
T = diagonalAction(W, d, R)
print T
S = invariantRing T
print S
print (invariants T)
