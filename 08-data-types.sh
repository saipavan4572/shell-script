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
<<com

echo "Scenario:1 number and string"
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ bash 08-data-types.sh 60 hello
Sum of 60 and hello is: 60
The difference is 60
The product is 0
08-data-types.sh: line 16: 60 / hello: division by 0 (error token is "hello")
The quotient is

echo "Scenario:2 String and number"
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ bash 08-data-types.sh hai 20
Sum of hai and 20 is: 20
The difference is -20
The product is 0
The quotient is 0
com
