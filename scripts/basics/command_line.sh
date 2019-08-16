#!/bin/bash

echo "Total arguments : $#"
echo "1st arguments : $1"
echo "2nd arguments : $2"

x=$1
y=$2
((result=$x+$y))
echo "X+Y=$result"