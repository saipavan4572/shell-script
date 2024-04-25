#!/bin/bash

echo "All variables: $@"
echo "Number of variables passed: $#"
echo "Script Name: $0"
echo "Current working directory: $PWD"



<<com
1) $@
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20
All variables: 10 20

[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u!zw
-bash: !zw: event not found

[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x
All variables: 10 20 harish girish 876abc 2#bc9u*x

2) $#
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x
All variables: 10 20 harish girish 876abc 2#bc9u*x
Number of variables passed: 6

3) $0
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x
All variables: 10 20 harish girish 876abc 2#bc9u*x
Number of variables passed: 6
Script Name: 09-special-variables.sh

4) $PWD




com