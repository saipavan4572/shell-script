#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
else
    echo "You are super user"
fi

dnf install mysql -y 

echo "End of the script"

<<com
if we run this script then still we are getting error as below

[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 11-installation-2.sh
Please run this script with root access
Error: This command has to be run with superuser privileges (under the root user on most systems).
End of the script

com