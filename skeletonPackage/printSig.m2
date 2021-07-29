--NAME:             printSig.m2
--DESCRIPTION:      Originally intended to be used to print the signature before the rest of the code is run.
--                  Currently used as the driver for the "Invariant Calculator"
--AUTHORS:          Lucas Rizzolo
--LAST MODIFIED:    Wed Jul 28

--Get the K College logo for the signature
s1 = get "kSymb.txt"

--Function for restart that supresses String AfterPrint
--that also prints the signature
rest = i ->(String#{Standard,AfterPrint}=r-> r; <<s1<<"\n")

--Adds the function to the restart
addStartFunction rest

--Functions for printing exit message before exit
extt = i ->(<<"\nGoodbye friend!\n")
addEndFunction extt

--Load input formatter code and display signature
load "stringToRing.m2"
rest 1

--init for while loop
cont = true

--While the user still wants the code to run
while cont do(
    inp = read "\nInput the ring (RING[var1,var2,...]:\n";
    
    --Try to input the ring. If an error is thrown, handle it with grace
    try(R = stringToRing(inp))
    then(
        --Read the input as a ring
        R = stringToRing(inp);
        
        --Try to print the variables in the ring. If not possible, handle and inform the user
        try (vars R) then (<<"\nVariables in your ring:\t" << vars R) else (<<"\nError, could not print variables!\n");
        
        --If the format for the ring was incorrect, stringToRing will return -1
        --Check for this and inform the user of the issue
        try (if R == -1 then <<"\nCould not read ring!\n");
    )
    else (
        <<"\nThe use of CC and RR is currently not supported\n"
    );
    
    --See if the user wants to run the code again
    cond = read "\nWould you like to run it again (y/n)?\t";
    cont = if cond=="n" then false else true;
)

exit

