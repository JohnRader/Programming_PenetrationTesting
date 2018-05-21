CS 427 Project 1: Bash port scanner
John Rader
2/6/18

NAME
	portscanner.sh

USAGE
	./portscanner.sh www.yahoo.com 80 81

DESCRIPTION 
	The function of this script is in two seperate parts. The first part is a simple ping 		check which pings the requested server to see if it is currently alive. The second part of 		the script is a port check to see which ports are going to be open.

COMMAND-LINE OPTIONS
	The first part of the command-line option is just calling the program, followed by an 		optional timeout arguement and time for timeout, followed by the hostname then start and 	 stop ports. 
	

INPUT FILE FORMAT
	The input file must be done line by line. The first line must be the host, followed by 		start port and then the end port. 
	Will look like this:
	www.yahoo.com
	70
	80
	"next host"
	"next startport"
	"next stopport"

KNOWN BUGS AND LIMITAIONS
	The only limitation my program has is that it on recognizes an invalid amount of arugments 		for errors with less than 5 arguments entered. If 6 or more arguments are entered then 		there is not an error message that shows up.
	
ADDITIONAL NOTES
	There were some slight issues with batch mode as it prints enter host, enter start port, 	and enter stop port after each entry on the batch file being read. Does not inhibit the s	cript from working.











