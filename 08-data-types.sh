#!/bin/bash

Num1=$1
Num2=$2

SUM=$(($Num1 + $Num2))

echo "Sum of $Num1 and $Num2 is: $SUM"

diff=$(($num1 - $num2))
echo "The difference is $diff"

prod=$(($num1 * $num2))
      echo "The product is $prod"

quot=$(($num1 / $num2))
      echo "The quotient is $quot"
