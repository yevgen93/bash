#!/bin/bash

# This script displays various information to the screen

# Display 'Hello'
echo 'Hello'

# Assign a value to a variable
WORD='script'

# Display that value using the variable.
echo "$WORD"

# Display that single quotes don't expand var names
echo '$WORD'

# Combine the varaible with hard-coded text.
echo "This is a shell $WORD"

# Display the contents of the variable using an alt syntax.
echo "This is a shell ${WORD}"

# Append the text to the variable.
echo "${WORD}ing is fun!"

# This doesn't work:
echo "$WORDing is fun!"

# Create a new var
ENDING='ed'

# Combine the two vars
echo "This is ${WORD}${ENDING}."

# Reassignment
ENDING='ing'
echo "${WORD}${ENDING} is fun!"
