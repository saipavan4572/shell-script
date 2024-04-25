#!/bin/bash

Num1=$1
Num2=$2

if [ $Num1 -gt $Num2 ]
then
    echo "Number $Num1 is greater than $Num2"
else
    echo "Number $Num1 is less than $Num2"
fi