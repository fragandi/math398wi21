--Author:       Lucas Rizzolo
--Date:         Feb 9, 2020
--Name:         echo
--Description:  echos a user input, stores to file and prints echo
--Notes:        This is a test for user input and for file output/line output

--Prompt user for path to store the file:

--define main function to echo user input. Prompts user for path to store the file
echo = i -> (i=read "What say you?\n",
                fileName = read "\nHow should I save the file (/path/name.txt)?\n";
                fileName << "I say:\t" << i << close;
                get fileName)
--Note: how I have M2 set up, it automatically creates a file under the /path/name.txt given, but in the directory ~/Users/[my username]

--get fileName returns whatever is contained in the file as a string output

--run function
echo()

--to open a file in M2, use this:
show URL fileName

