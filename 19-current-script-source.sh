#!/bin/bash


COURSE="Devops from current script"

echo "Before calling other script : $COURSE"
echo "Process id of current script: $$"

source ./other-script.sh

echo "After calling other script : $COURSE"
echo "Process id of current script: $$"