--Author:       Lucas Rizzolo
--Date:         Feb 8, 2020
--Name:         stringToRing
--Description:  uses select and read method to parse string input into
--              a ring declaration
--Notes:        See comments for detailed code explanation



--define main function to parse ring from string
--input: RING[var1, var2, ...]
--takes input, converts to an actual ring in the data

stringToRing = i -> (l = select("[^, [\\]]+", i); if l#0 == "RR"
						then return(RR l_{1..#l-1}) 
					else (
						if l#0 == "QQ" 
							then return(QQ l_{1..#l-1}) 
						else (
							if l#0 == "CC" 
								then return(CC l_{1..#l-1}) 
							else (
								if l#0 == "ZZ" 
									then return (ZZ l_{1..#l-1}) 
								else (return -1)
							)
						)
					)
			)


--Explanation:

--select("regex", "input string") selects substrings matching the regex and puts them into a list

--"[^, [\\]]+" is the regex. Here's essentially what it says: The outer set of
--square brackets specifies that we'll look for anything within the range of
--characters specified between the braces. The + sign at the end says we want it to
--grab the specified sequence that appears one or more times. Next, everything
--inside of the bracket specifies what we're looking for. Starting with the ^, that
--tells us that we want everything that isn't anything specified to the left (think
-- of it like a negation). We then give the following symbols to look for: ','
--' ', '[', and ']' (comma, whitespace, open and closed square bracket). We have to
-- "escape" the closed square bracket, so it becomes '//]'. So, the regex in
--english is roughly: Select anything that is not a comma, whitespace, open square
--bracket, or closed square bracket, appearing more than once.

--So, the select function will take something of the form "QQ[x,y,z]" and put it
--into a list as {QQ,x,y,z}

--The rest of the code is just if-else to check which field is used, based off
--which fields M2 can recognize (returns sentitel value -1 if non-recognized field is given)

-- The statements of the form return(RING l_{1..#l-1}) takes the rest of the list
-- (values 1 through length(l)-1) and uses the SPACE operator with type Ring and
-- List, casting the list to type RingArray, then creating the ring.

--Implementation with read from user
R = stringToRing(read "Input the ring (RING[var1,var2,...\n]")

--Checks to see if it worked
vars R

--Ask for field and number of variables so then use symbol(x, n) to generate the ring
