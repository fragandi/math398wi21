needsPackage "InvariantRing"

R = QQ[x_1..x_3]
W = matrix{{1,0,3},{0,5,1}}
d = {17,17}
--W = matrix{{1,0,1},{0,1,1}}
--d = {5,5}
print W
T = diagonalAction(W, d, R)
print T
print cyclicFactors T
S1 = invariants T
S1 = sort S1
m0 := S1#0
m' := m0
modBy := apply({x_1, x_1, x_2, x_3}, m -> sub(m, ring T) )
M := {}
N := {}
i = 1
while (i <= 3) do (
    M = M | {(modBy#i)^(d#0)};
    i = i + 1;
);

i = 0
while (i < d#0) do ( 
    M = M | {m'};
    m' = m'* m0; 
    j = 1;
    while (j <= 3) do (
        if (degree(modBy#j, m') > d#0) then (
            m' = lift(m' / ((modBy#j)^(d#0)), R);
        );
        j = j + 1;
    );
    i = i+1;
);
M = sort(M)
print "Full group generated by m': ";
print M
print "\nMinimal generating set of monomials computed by InvariantRing: "
print S1;
print "\nDoes the group generated by m' contain the minimal generating set?"
print isSubset(S1, M);

i = 0;
while (i < #M) do (
    -- we will check if m1 is minimal
    m1 = M#i;
    j = 0;
    isMinimal = true;
    while (j < i and isMinimal) do (
        m2 = M#j;
        -- if m1 comes before m2 in the list, m2 won't divide m1, so we can stop checking
        if (degree(m1) < degree(m2)) then break;

        -- if m2 divides m1, then m1 is not minimal
        if (degree(x_1, m1) > degree(x_1, m2) and degree(x_2, m1) > degree(x_2, m2) and degree(x_3, m1) > degree(x_3, m2)) then isMinimal = false;

        j = j+1;

        );
        if (isMinimal) then N = N | {m1};
        i = i+1;
    );

print "\nRemoved all nonminimal elements from the group generated by m':"
print N;
print "\nThis is the same group!"
