-- TITLE:           rMat.m2
-- AUTHORS:         Lucas Rizzolo
-- DESCRIPTION:     Establishes various functions to test the Derksen-Gandini algorithm with varying data sets,
--                  of varying randomness
-- LAST MODIFIED:   Wed April 21

-- WIP, may not even compile. I'd recommend copy and pasting interesting things into a different place to test them.

needsPackage "InvariantRing"

-- **** First section: a bunch of functions that I probably could have found but just made myself **** --

-- concat list by appending the second to the end of the last
listAdd = (a,b) -> (m=0; i=#a; j=#b; for n from 0 to i+j-1 list if m==0 then a#n else b#(n-i) do if n+1-i>=0 then m=1)
-- the built-in function join(List, List, List) accomplishes this better

--


-- find max because I don't want to import a function to do that for me
maximum = (a,b) -> (if a>b then return a else return b)

-- Runs the Derksen-Gandini Algorithm on a specified ring size, dimension, and weightmatrix
-- @param t the number of variables in the ring
-- @param dimen the list of primes for the Z_p products forming the group
-- @param wts the weight matrix
minimalInvariants = (t,d,wts) ->(
    R = QQ[x_1..x_t];
    dimen = d;
    W = wts;
    A = diagonalAction(W,dimen,R);
    print W;
    print invariants A;
)

-- **** Second Section: messing around with ways to randomize weights, variables in the ring, order of the group, etc. **** --
--Note: Each function has a different flavor of randomness. Make sure you choose the one that you want.


-- Generates a random weight matrix
-- @param n dim1 of the matrix
-- @param m dim2 of the matrix
-- @param k the max a weight can be in the weight matrix
weightMatNM = (n,m,k) -> (L = for i from 1 to n list(for j from 1 to m list random(0,k)); return matrix L)

-- First way of randomly finding invariants. I don't know how to explain this one I guess
-- @param i the max number a random weight could be
-- @param t the number of variables in the ring
-- @param d the max a number p for Z_p could be
randInvariants = (i,t,d) -> (
    R = QQ[x_1..x_t];
    dimen = {(random d)+1,(random d)+1};
    W = weightMatNM(2,t,i);
    A = diagonalAction(W,dimen,R);
    print W;
    print invariants A)

--Loads a list of primes, checks that it worked with a print
load "primeList.m2"
print primeList

-- get a sampling of primes within a range i of size m
-- for example, samplePrimes(3,3) might return (2,5,3) or (3,3,3) etc.
-- max m allowed is 999 which corresponds to 7919
samplePrimes = (m,i) -> (for n from 1 to m list primeList#(random i))

-- Randomly find invariants but only for a specific idea:
-- There are t variables in the ring
-- G \cong Z_p^d
-- W is not set yet
--
-- @param t the number of variables in the ring
-- @param d the number of Z_p in the ring
-- @param p the p
doInvariants = (t,d,p) -> (
    R = QQ[x_1..x_t];
    dimen = for n from 1 to d list p;
    --Need to generate a W
    A = diagonalAction(W,dimen,R);
    print W;
    print invariants A
)

-- Randomly find invariants, but this time with more rules:
--
-- Each Z_p has a random prime p
-- There are a d Z_p's forming your group
-- There are t variables in the ring
-- Weight matrix still isn't solid
--
-- @param t the number of variables in the ring
-- @param d the number of Z_p's in your group thing or whatever
-- @param p the highest allowable index for a prime (p(0)=2, p(1)=3, p(2)=5, ...)
testInvariants = (t,d,p) -> (
    R = QQ[x_1..x_t];
    dimen = samplePrimes(d,p);
    --Need to generate a W still
    A = diagonalAction(W,dimen,R);
    print W;
    print invaraints A
)


-- Randomly finds invariants, but this time with more randomness:
--
-- Each Z_p has a random prime p
-- There are a random amount of Z_p's forming your group
-- There are a random amount of variables in the ring
-- Weight matrix is not solid, again
--
-- @param t the highest number allowed for a random number of variables in the ring
-- @param d the highest number allowed for a random selection of primes
-- there is no param p because we are randomly selecting primes
testInvariants = (t,d) -> (
    R = QQ[x_1..x_t];
    dimen = samplePrimes(d,#samplePrimes);
    --Need to generate a W still
    A = diagonalAction(W,dimen,R);
    print W;
    print invaraints A
)

--**** Section Three: Testing the code ****--
-- VERY MUCH WIP
--List of different things to test
varSizes = {1,2,3,4,5,6,7,8,9} -- Possible numbers for the variables in the ring
primeSizes = {} -- D
weightMatrices = {} --Different weight matrices to test. Code makes sure that it only uses ones that make sense


--run through every test case that we want


--**** Section Four: Notes ****--
-- Notes:
--
--* The dimension is a list of each Z_p. Ex.: (3,5,7) -> Z_3, Z_5, Z_7.
-- I'm making a concat to add lists together
-- This will be useful in creating a group of random order
--
--* Making a function to use a random prime would be useful. This could be
-- accomplished by searching through a list of primes?
--
--* I'm going to eventually try and make this a package, but it needs a lot of polish
--
--* I want to make a parallel version of a lot of this
--
--* to get size of list L do #L
