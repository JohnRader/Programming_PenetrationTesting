#!/bin/bash

# Basic Bash port scanner
# project 1
# John Rader

timeoutcommand=$1
timeoutnumber=$2
host=$3
startport=$4
stopport=$5


function pingcheck
{
ping=$(ping -c 1 $host | grep bytes | wc -c)
if [ "$ping" -gt 1 ]; then
	echo "$host is up"
else
	echo "$host is down, quitting"
	exit
fi
}


function portcheck
{

for ((counter=$startport; counter<=$stopport; counter ++))
do
	if timeout $timeoutnumber bash -c "echo >/dev/tcp/$host/$counter" 
	then
		echo "$counter open" 
	else
		echo "$counter closed"
	fi
done
}

if [ "$1" = '-t' ]
then 
	timeoutnumber=$2
else 
	timeoutnumber=2
	host=$1
	startport=$2
	stopport=$3
fi


if [ "$host" = '' ]
then
	while true 
	do	
	echo "Enter a host name:"
	read host
	if [ "$host" = '' ]
	then 
		exit
	fi

	echo "Enter the start port:"
	read startport
	echo "Enter the stop port:"
	read stopport
	pingcheck
	portcheck
	done
fi

if [ "$4" = startport ] 
then
	pingcheck
	portcheck
else
	echo "Error, incorrect arguments entered. Please use program as such: ./portscanner.sh [-t timeout_number] [host startport endport]"
	exit
fi


#first, check that the host is alive
pingcheck
#next, loop through the ports
portcheck
