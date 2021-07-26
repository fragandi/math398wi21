s1 = get "kSymb.txt"

--Function for restart that supresses String AfterPrint
--that also prints the signature
rest = i ->(String#{Standard,AfterPrint}=r-> r; <<s1<<"\n")

--Adds the function to the restart
addStartFunction rest

--Functions for printing exit message before exit
extt = i ->(<<"\nGoodbye friend!\n")
addEndFunction extt

--Testing section

restart
rest 1
<<"This is a test!"
extt 1
exit

