
--variable names are stored as symbols 
X
X = 2
class X
symbol X

--the basic data types are similar to other programming languages (like Java)
--integers are stored as rings of type ZZ(the ring of integers)
2
class 2

--strings are Sequences of characters
stringEx = "abcdefg"
class "abcdefg"

--"type" is like a class in Java, sort of

--strings also have escape characters, like strings in other languages
"Math 398 \n Winter 2021"

--useful string methods
peek stringEx --think System.out.println
#stringEx --stringEx.length()
stringEx|"hijk" --stringEx + "hijk"

--creating "blocks" in code can be a little tricky
    --as we've seen, but parentheses are most useful
--ints[];
--for(int i = 0; i<=5; i++){
    --ints += i;
--}
ints  = "";
for i from 0 to 5 do (
    ints = ints|"a"
    )
peek ints
