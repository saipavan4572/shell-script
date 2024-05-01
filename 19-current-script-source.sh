#!/bin/bash


COURSE="Devops from current script"

echo "Before calling other script : $COURSE"
echo "Process id of current script: $$"

source ./18-other-script.sh

echo "After calling other script : $COURSE"
echo "Process id of current script: $$"

<<com

$ sh 19-current-script-source.sh
Before calling other script : Devops from current script
Process id of current script: 1503
variable value from other script : Devops from other script
Process id of current script: 1503
After calling other script : Devops from other script
Process id of current script: 1503


com