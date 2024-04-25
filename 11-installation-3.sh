#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access"
    exit 1      #manually exit when error occurs.
else
    echo "You are super user"
fi

dnf install mysql -y 

echo "End of the script"

<<com
when we run this script then script will exit whenever the if condition fail because of exit command.

[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 11-installation-3.sh
Please run this script with root access

com