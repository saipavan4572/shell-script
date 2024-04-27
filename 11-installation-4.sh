#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql -y

if [ $? -ne 0 ]
then
    echo "Installation of mysql...FAILURE"
    exit 1
else
    echo "Installation of mysql...SUCCESS"
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "Installation of git...FAILURE"
    exit 1
else
    echo "Installation of Git...SUCCESS"
fi

echo "is script proceeding?"

<<com

if we run this script with the sudo access then it will check all the conditions and perform actions accordingly

[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sudo sh 11-installation-4.sh
You are super user.

....installtion process goes here...

Installed:
  mariadb-connector-c-config-3.2.6-1.el9_0.noarch     mysql-8.0.36-1.el9_3.x86_64     mysql-common-8.0.36-1.el9_3.x86_64

Complete!
Installation of mysql...SUCCESS
Last metadata expiration check: 1:23:53 ago on Thu Apr 25 12:44:23 2024.
Package git-2.39.3-1.el9_2.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!
Installation of Git...SUCCESS
is script proceeding?

com