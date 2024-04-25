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