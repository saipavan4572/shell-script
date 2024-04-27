#!/bin/bash

dnf install mysql -y 



<<com
if we run this script with only above command then we will get error as below

[ ec2-user@ip-172-31-87-141 ~/shell-script ]$ sh 11-installation.sh
Error: This command has to be run with superuser privileges (under the root user on most systems).

com