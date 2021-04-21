-- TITLE:           rMat.m2
-- AUTHORS:         Lucas Rizzolo
-- DESCRIPTION:     Establishes various functions to test the Derksen-Gandini algorithm with varying data sets,
--                  of varying randomness
-- LAST MODIFIED:   Wed April 21

-- WIP, may not even compile. I'd recommend copy and pasting interesting things into a different place to test them.

needsPackage "InvariantRing"

-- **** First section: a bunch of functions that I probably could have found but just made myself **** --

-- calculates the size of the list because I can't find a function to do that already
listSize = i -> (a=0;for n in i do a=a+1; return a)

-- concat list by appending the second to the end of the last
listAdd = (i,j) -> (for n from 1 to maximum(listSize(i),listSize(j)))

-- find max because I don't want to import a function to do that for me
maximum = (a,b) -> (if a>b then return a else return b)

-- Runs the Derksen-Gandini Algorithm on a specified ring size, dimension, and weightmatrix
-- @param t the number of variables in the ring
-- @param dim the list of primes for the Z_p products forming the group
-- @param weights the weight matrix
minimalInvariants = (t,d,weights) ->(
    R = QQ[x_1..x_t];
    dim = d;
    W = weights;
    A = diagonalAction(W,dim,R);
    print W;
    print invariants A;
)

-- **** Second Section: messing around with ways to randomize weights, variables in the ring, order of the group, etc. **** --
--Note: Each function is has a different flavor of randomness. Make sure you choose the one that you want.


-- Generates a random weight matrix
-- @param n dim1 of the matrix
-- @param m dim2 of the matrix
-- @param k the max a weight can be in the weight matrix
weightMatNM = (n,m,k) -> (L = for i from 1 to n list(for j from 1 to m list random(0,k)); return matrix L)

-- First way of randomly finding invriants. This is just the wild west of unrestrained calculations
-- @param i the max number a random weight could be
-- @param t the number of variables in the ring
-- @param d the max a number p for Z_p could be
randInvariants = (i,t,d) -> (
    R = QQ[x_1..x_t];
    dim = {rand(1,d),rand(1,d)};
    W = weightMatNM(2,t,i);
    A = diagonalAction(W,dim,R);
    print W;
    print invariants A)

--Useful for getting random primes. Needs to be bigger. Probably will make a separate file for it
primesList = {2,3,5,7,9,11,13,17}


-- get a sampling of primes within a range i of size m
-- for example, samplePrimes(3) might return (3,5,7) or (3,3,3)
samplePrimes = (m,i) -> (for n from 1 to m list primesList#(random i))

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
    dim = for n from 1 to d list p;
    --Need to generate a W
    A = diagonalAction(W,dim,R);
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
    dim = samplePrimes(d,p);
    --Need to generate a W still
    A = diagonalAction(W,dim,R);
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
    dim = samplePrimes(d,#samplePrimes);
    --Need to generate a W still
    A = diagonalAction(W,dim,R);
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
for v in varSizes do(
    for p in primeSizes do(
        for w in weightMatrices do(
            --Check to make sure we can use this weight matrix
            if 1==1 then(
                minimalInvariants(v,d,w)
            )
            else
    )
)

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
