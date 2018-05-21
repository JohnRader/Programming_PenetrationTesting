CS 427 Project 2: Brute Force SSH login
John Rader
2/18/18

NAME
	sshbrute.py

USAGE
	./sshbrute.py <filename | -g> <hostname> <username>

DESCRIPTION 
	The program attempts to ssh bruteforce into a specified host using the discovered usernames given to us 	in the project description. It works in two different ways, it is either given a list of passwords to 		use or generates all possible 3 letter combinations of the alphabet. 

COMMAND-LINE OPTIONS
	To use sshbrute.py with list of passwords, use ./sshbrute.py <filename> <hostname> <username>
	To use sshbrute.py with the password generation function, use ./sshbrute.py <-g> <hostname> <username>

KNOWN BUGS AND LIMITAIONS
	No limitations, can find passwords for all usernames. 
	
ADDITIONAL NOTES
	Passwords for the accounts:
		usera - abc123
		userb - baseball
		userc - adf
		userd - letmein
		usere - cxv











