#!/bin/bash

# This script demonstrates case statements

if [[ "${1}" = "start" ]]
then
	echo "Starting"
elif [[ "${1}" = "stop" ]]
then
	echo "Stopping"
elif [[ "${1}" = "status" ]]
then
	echo "Status:"
else
	echo "Please supply a command." >&2
	exit 1
fi
