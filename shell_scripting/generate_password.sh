#!/bin/bash

# This script generates a list of random passwords.

# A random number as a password.
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Use the current date/time as the basis for the password.
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use nanoseconds to act as a randomization.
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# A better password
PWD=$(date +%s${RANDOM}${RANDOM} | shasum | head -c32)
echo "${PWD}"
