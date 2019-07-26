#!/bin/bash
# https://linuxhint.com/bash-for-loop-examples/

for (( counter=10; counter>0; counter-- ))
do
    echo -n "$counter "
done
printf "\n"