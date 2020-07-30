#!/bin/bash

# This script generates a random password
# This user can set the password length with -l and add a special character with -s.
# Verbose mode can be enabled with -v.

# Set a default password length
LENGTH=48

while getopts vl:s OPTION
do
	case ${OPTION} in
	  v)
	    VERBOSE='true'
	    echo 'Verbose mode on.'
	    ;;
	  l)
	    LENGTH="${OPTARG}"
	    ;;
	  s)
	    USE_SPECIAL_CHARACTER='true'
	    ;;
	  ?)
	    echo 'Invalid option.'
	    exit 1
	    ;;
	esac
done
