#!/bin/bash

Num1=$1
Num2=$2

SUM=$(($Num1 + $Num2))

echo "Sum of $Num1 and $Num2 is: $SUM"

diff=$(($Num1 - $Num2))
echo "The difference is $diff"

prod=$(($Num1 * $Num2))
      echo "The product is $prod"

quot=$(($Num1 / $Num2))
      echo "The quotient is $quot"

##example run: sh 08-data-types.sh 40 20