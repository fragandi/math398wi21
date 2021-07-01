--CLASS: Integer
--DESCRIPTION: Establishes an Integer wrapper class (kinda) for Macaulay2
--DATE: Mon Jun 7
--AUTHOR: Lucas Rizzolo

Integer = new Type of HashTable

--Function for create a new Integer
wrapInt = i -> hashTable{val => i};
Integer = new Type of HashTable

--Returns as ZZ value
getVal = method()
getVal Integer := i -> n#val;

--Defines addition between integers
Integer + Integer := (x,y) -> (return new Integer from wrapInt(x#val+y#val));

--Defines subtraction between integers
Integer - Integer := (x,y) -> (return new Integer from wrapInt(x#val-y#val));

--Defines division between integers
Integer / Integer := (x,y) -> (n = x#val/y#val);

--Defines toString and other representations

--Testing Section--
int1 = new Integer from wrapInt(1)

