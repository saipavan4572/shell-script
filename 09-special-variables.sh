#!/bin/bash

echo "All variables: $@"
echo "Number of variables passed: $#"
echo "Script Name: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user is running this script: $USER"
echo "Hostname: $HOSTNAME"
echo "Process ID of the current shell script: $$"
#sleep 60       # to run the command in foreground
sleep 60 &   # to run the command in the background
echo "Process ID of last background command: $!"


echo "To check the exit status of a previous command is: $?"

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
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x
All variables: 10 20 harish girish 876abc 2#bc9u*x
Number of variables passed: 6
Script Name: 09-special-variables.sh
Current working directory: /home/ec2-user/shell-script

5) $HOME
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x
All variables: 10 20 harish girish 876abc 2#bc9u*x
Number of variables passed: 6
Script Name: 09-special-variables.sh
Current working directory: /home/ec2-user/shell-script
Home directory of current user: /home/ec2-user

6) $USER
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x
All variables: 10 20 harish girish 876abc 2#bc9u*x
Number of variables passed: 6
Script Name: 09-special-variables.sh
Current working directory: /home/ec2-user/shell-script
Home directory of current user: /home/ec2-user
Which user is running this script: ec2-user

7) $HOSTNAME
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x
All variables: 10 20 harish girish 876abc 2#bc9u*x
Number of variables passed: 6
Script Name: 09-special-variables.sh
Current working directory: /home/ec2-user/shell-script
Home directory of current user: /home/ec2-user
Which user is running this script: ec2-user
Hostname: ip-172-31-87-141.ec2.internal

8) $$
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x
All variables: 10 20 harish girish 876abc 2#bc9u*x
Number of variables passed: 6
Script Name: 09-special-variables.sh
Current working directory: /home/ec2-user/shell-script
Home directory of current user: /home/ec2-user
Which user is running this script: ec2-user
Hostname: ip-172-31-87-141.ec2.internal
Process ID of the current shell script: 2495

sleep 60 ---> sleep for 60 sec and we can check which script is running with process ID:2495 (by opening anoter terminal)

ec2-user    2495    1861  0 11:44 pts/1    00:00:00 sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x

9) $!
[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 09-special-variables.sh 10 20 harish girish 876abc 2#bc9u*x
All variables: 10 20 harish girish 876abc 2#bc9u*x
Number of variables passed: 6
Script Name: 09-special-variables.sh
Current working directory: /home/ec2-user/shell-script
Home directory of current user: /home/ec2-user
Which user is running this script: ec2-user
Hostname: ip-172-31-87-141.ec2.internal
Process ID of the current shell script: 2580
Process ID of last background command: 2581

once we ran the above command we can check the PID:2581 process details in another terminal whether it is running or not

[ ec2-user@ip-172-31-87-141 ~ ]$ ps -ef|grep sleep
ec2-user    2581       1  0 11:53 pts/1    00:00:00 sleep 60
ec2-user    2586    2501  0 11:53 pts/0    00:00:00 grep --color=auto sleep



com