#!/bin/bash

# Demonstrate the use of shift and while loops.

# Display the first three parameters.

echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"
echo "Parameter 3: ${3}"
echo

while [[ true ]]
do
	echo $RANDOM
	sleep 1
done
