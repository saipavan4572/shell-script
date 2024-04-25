#!/bin/bash

echo "Please enter username:"
read USERNAME       ## Here USERNAME is a variable
# with this read command actual entered username value is visible on the console

echo "Please enter password:"
read PASSWORD       ## Here PASSWORD is a variable
# with this read command actual entered password value is visible on the console

echo "Username is : $USERNAME , Password is: $PASSWORD"

#instead of reading value in next line we can read in the same line after the string/text
read -P "Enter a value: " VALUE

echo You entered a value : $VALUE 